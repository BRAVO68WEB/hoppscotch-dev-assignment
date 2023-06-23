#!/bin/bash

# This script is used to manage the microservices

# Usage:
# ./manage.sh <command> <service>

# Example:
# ./manage.sh start all

# Commands:
# start: start the service
# stop: stop the service
# restart: restart the service
# status: check the status of the service

# Services:
# all: apply the command to all services

# Check if the command is valid
if [ "$1" != "start" ] && [ "$1" != "stop" ] && [ "$1" != "restart" ] && [ "$1" != "status" ]; then
    echo "Invalid command"
    exit 1
fi

# Check if the service is valid
if [ "$2" != "all" ] && [ "$2" != "orders" ] && [ "$2" != "user" ] && [ "$2" != "products" ]; then
    echo "Invalid service"
    exit 1
fi

# Start the service
if [ "$1" == "start" ]; then
    if [ "$2" == "all" ]; then
        echo "Starting all services..."
        docker-compose up -d
    else
        echo "Starting $2 service..."
        docker-compose up -d $2
    fi
fi

# Stop the service
if [ "$1" == "stop" ]; then
    if [ "$2" == "all" ]; then
        echo "Stopping all services..."
        docker-compose down
    else
        echo "Stopping $2 service..."
        docker-compose down $2
    fi
fi

# Restart the service
if [ "$1" == "restart" ]; then
    if [ "$2" == "all" ]; then
        echo "Restarting all services..."
        docker-compose restart
    else
        echo "Restarting $2 service..."
        docker-compose restart $2
    fi
fi

# Check the status of the service
if [ "$1" == "status" ]; then
    if [ "$2" == "all" ]; then
        echo "Checking status of all services..."
        docker-compose ps
    else
        echo "Checking status of $2 service..."
        docker-compose ps $2
    fi
fi