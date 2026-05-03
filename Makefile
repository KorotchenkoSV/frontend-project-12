install:
	npm ci
	cd frontend && npm ci

build:
	npm run build

start:
	./node_modules/.bin/serve -s ./frontend/dist -p 10000

lint:
	npm run lint
