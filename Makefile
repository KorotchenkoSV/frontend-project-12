install:
	npm ci
	cd frontend && npm ci

build:
	npm run build

start:
	npx start-server -s ./frontend/dist

lint:
	npm run lint
