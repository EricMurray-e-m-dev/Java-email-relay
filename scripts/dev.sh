#!/bin/bash
case "$1" in
  start)
    echo "Starting local services..."
    docker-compose -f docker/docker-compose.yml up -d postgres redis
    echo "Services started."
    ;;
  
  stop)
    echo "Stopping services..."
    docker-compose -f docker/docker-compose.yml down
    ;;
  
  restart)
    $0 stop
    $0 start
    ;;
  
  test)
    echo "Running tests..."
    mvn clean test
    ;;
  
  run)
    echo "Starting application..."
    mvn spring-boot:run
    ;;
  
  build)
    echo "Building application..."
    mvn clean package
    ;;
  
  *)
    echo "Usage: $0 {start|stop|restart|test|run|build}"
    exit 1
    ;;
esac