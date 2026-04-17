From ubuntu:latest

Run apt update && apt install -y curl cron

WORKDIR /app

COPY monitor.sh /app/
RUN chmod +x /app/monitor.sh


#create log file
Run touch /app/log.txt

#Add Cron job
Run echo "*/2 * * * * /app/monitor.sh >> /app/cron.log 2>&1" > /etc/cron.d/monitor-cron

RUN chmod 0644 /etc/cron.d/monitor-cron
RUN crontab /etc/cron.d/monitor-cron

CMD ["cron", "-f"]