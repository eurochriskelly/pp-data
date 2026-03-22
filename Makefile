.PHONY: help up down deploy undeploy

# Default target shows help
.DEFAULT_GOAL := help

# Load environment variables from .env file if it exists
ifneq (,$(wildcard .env))
    include .env
    export
endif

help:
	@echo "Available commands:"
	@echo "  make up       - Start Docker containers"
	@echo "  make down     - Stop and remove Docker containers"
	@echo "  make deploy   - Deploy using gradle"
	@echo "  make undeploy - Undeploy using gradle"

up:
	docker compose up --pull never -d

down:
	docker compose down

deploy:
	gradle deploy

undeploy:
	gradle undeploy
