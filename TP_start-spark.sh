cd spark
docker compose up -d
docker exec spark-history bash /opt/spark/sbin/start-history-server.sh
docker exec spark-master bash /opt/spark-apps/jupyter_lab_start.sh