install:
	npm ci
	cd frontend && npm ci

build:
	npm run build

start:
	cd frontend && npm run start

lint:
	npm run lint

wait-for-server:
	@echo "Waiting for server to be ready on http://localhost:3000..."
	@ATTEMPTS=0; \
	while ! curl -f http://localhost:3000 > /dev/null 2>&1; do \
		if [ $$ATTEMPTS -eq 5 ]; then \
			echo "Error: Server did not become ready after 5 attempts"; \
			exit 1; \
	fi; \
	echo "Server not ready yet, waiting 10 seconds (attempt $$((ATTEMPTS + 1))/5)..."; \
	sleep 10; \
	ATTEMPTS=$$$(($$ATTEMPTS + 1)); \
	done
	@echo "Server is ready!"

test: build start wait-for-server
	@echo "Running tests..."
	npx playwright test --reporter=list
