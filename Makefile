# start:
# 	bundler install
# 	bundle exec pod install
# 	bundle exec pod setup

start:
	@if ! command -v bundler &> /dev/null; then \
		echo "Bundler not found. Installing Bundler..."; \
		gem install bundler; \
	fi
	bundler install
	bundle exec pod install
	bundle exec pod setup