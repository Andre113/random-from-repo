help:
	@echo "  Usage:\n    \033[36m make <target>\n\n \033[0m Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "     \033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Install project required tools
	@./Scripts/setup.sh

run:
	@ruby Source/main.rb