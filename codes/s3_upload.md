## 1. collect_log.sh

```bash
#!/bin/bash

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export AWS_DEFAULT_REGION=ap-northeast-2
export HOME=/home/ec2-user
cd /home/ec2-user
LOGFILE="/home/ec2-user/$(date +'%Y%m%d-%H%M').log"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\\([0-9.]*\\)%* id.*/\\1/" | awk '{print 100 - $1}')
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

printf "Date: $(date +'%Y-%m-%d %H:%M:%S')\nCPU Usage: %.2f%%\nMemory Usage: %.2f%%\nDisk Usage: %d%%\n" "$CPU_USAGE" "$MEMORY_USAGE" "$DISK_USAGE" > "$LOGFILE"
```

## 2. upload_log.sh

```bash
#!/bin/bash

export PATH=/usr/bin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export AWS_DEFAULT_REGION=ap-northeast-2
export HOME=/home/ec2-user
cd /home/ec2-user

s3_BUCKET="your-S3-bucket"
TIMESTAMP=$(date +'%Y%m%d_%H%M')
LOG_DIR="/home/ec2-user"

for LOG_FILE in ${LOG_DIR}/*.log; do
  if [[ -f "$LOG_FILE" ]]; then
    BASENAME=$(basename "$LOG_FILE" .log)
    
    if [[ "$BASENAME" =~ ^[0-9]{8}-[0-9]{4}$ ]]; then
      /usr/bin/aws s3 cp "$LOG_FILE" "s3://$s3_BUCKET/" --only-show-errors
      if [[ $? -eq 0 ]]; then
        rm "$LOG_FILE"
      fi
    else
      /usr/bin/aws s3 cp "$LOG_FILE" "s3://$s3_BUCKET/${BASENAME}_${TIMESTAMP}.log" --only-show-errors
    fi
  fi
done
```

## 3. memory_monitor.sh

```bash
#!/bin/bash

*# slack Webhook URL 설정*
SLACK_WEBHOOK_URL="your-slack-url"

*# 메모리 임계값 설정 (예: 80%)*
THRESHOLD=80

*# 메모리 사용량 계산*
MEM_USAGE=$(free | grep Mem | awk '{printf "%.1f", $3/$2 * 100.0}')
MEM_INT=${MEM_USAGE%.*}

echo "[$(date)] Current memory usage: ${MEM_USAGE}%"

*# 임계값 초과 시 알림 전송*
if [ "$MEM_INT" -ge "$THRESHOLD" ]; then
  PAYLOAD="{
    \"text\": \"⚠️ [ALERT] Memory Usage Critical!\",
    \"attachments\": [
      {
        \"color\": \"danger\",
        \"fields\": [
          {
            \"title\": \"Current Memory Usage\",
            \"value\": \"${MEM_USAGE}%\",
            \"short\": true
          },
          {
            \"title\": \"Threshold\",
            \"value\": \"${THRESHOLD}%\",
            \"short\": true
          },
          {
            \"title\": \"Server\",
            \"value\": \"$(hostname)\",
            \"short\": true
          },
          {
            \"title\": \"Time\",
            \"value\": \"$(date)\",
            \"short\": true
          }
        ]
      }
    ]
  }"

  curl -X POST -H 'Content-type: application/json' \
       --data "$PAYLOAD" \
       "$SLACK_WEBHOOK_URL" \
       --silent

  echo "[$(date)] ⚠️  ALERT SENT - Memory usage: ${MEM_USAGE}%"
fi
```

- **collect_log.sh**: 시스템 리소스 사용량을 수집하여 로그 파일 생성
- **upload_log.sh**: 로그 파일들을 S3에 업로드 (시스템 로그는 삭제, 기타 로그는 타임스탬프 포함하여 백업)
- **memory_monitor.sh**: 메모리 사용량이 80% 임계값을 초과하면 Slack으로 알림 전송 → Slack은 webhook 허용해야함

모두 환경변수와 절대 경로가 설정되어 크론잡에서 안정적으로 실행될 수 있도록 구성되어 있습니다.

## crontab 설정 내용

```bash
* * * * * /bin/bash /home/ec2-user/collect_log.sh >> /home/ec2-user/cron.log 2>&1
* * * * * /bin/bash /home/ec2-user/memory_monitor.sh >> /home/ec2-user/memory_monitor.log 2>&1
* * * * * sleep 30; /bin/bash /home/ec2-user/upload_log.sh >> /home/ec2-user/cron.log 2>&1
```

## 실행 스케줄 해석

1. **첫 번째 라인**: `collect_log.sh`를 **매분마다** 실행하여 시스템 리소스 로그 수집
2. **두 번째 라인**: `memory_monitor.sh`를 **매분마다** 실행하여 메모리 임계값 체크 및 Slack 알림
3. **세 번째 라인**: **30초 대기 후** `upload_log.sh`를 실행하여 S3 업로드

## 동작 흐름

- **매분 00초**: 로그 수집 + 메모리 체크 동시 실행
- **매분 30초**: S3 업로드 실행 (로그 파일이 생성된 후 업로드)

모든 스크립트의 실행 로그는 각각 `cron.log`와 `memory_monitor.log`에 기록됩니다.