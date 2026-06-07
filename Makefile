install:
	npm ci
	cd frontend && npm ci

build:
	npm run build

start:
	cd frontend && npm run start

lint:
	npm run lint
