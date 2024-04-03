GOOS = $(shell go env GOOS)
GOARCH = $(shell go env GOARCH)

# Workaround for goreleaser. It looks for the binary in a specific place
ifeq ($(GOOS),darwin)
BUILD_DIR = dist/macos_${GOOS}_${GOARCH}
else
BUILD_DIR = dist/${GOOS}_${GOARCH}
endif

ifeq ($(GOOS),windows)
OUTPUT_PATH = ${BUILD_DIR}/gon.exe
else
OUTPUT_PATH = ${BUILD_DIR}/gon
endif

.PHONY: build
build:
	go build -o ${OUTPUT_PATH} ./cmd/gon

# release will package the distribution packages, sign, and notarize. It
# will then upload the release to GitHub and publish the Homebrew tap.
#
# AFTER THIS YOU MUST MANUALLY DELETE the checksums.txt file since it is
# incomplete and we don't need checksums since our artifacts are signed.
release:
	goreleaser --clean
.PHONY: release

clean:
	rm -rf dist/
.PHONY: clean

# Update the TOC in the README.
readme/toc:
	doctoc --notitle README.md
.PHONY: readme/toc

vendor: vendor/create-dmg

vendor/create-dmg:
	rm -rf vendor/create-dmg
	git clone https://github.com/andreyvit/create-dmg vendor/create-dmg
	rm -rf vendor/create-dmg/.git
