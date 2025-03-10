PLATFORMS := windows darwin linux
ARCHITECTURES := amd64 arm64 arm

.PHONY: build-all clean $(foreach p,$(PLATFORMS),build-$(p)) $(foreach p,$(PLATFORMS),build-$(p)-all)

# 构建特定平台特定架构 (默认为amd64)
build-windows:
	GOOS=windows GOARCH=amd64 go build -o build/app-windows-amd64.exe

build-mac: build-darwin
build-darwin:
	GOOS=darwin GOARCH=amd64 go build -o build/app-darwin-amd64

build-linux:
	GOOS=linux GOARCH=amd64 go build -o build/app-linux-amd64

# 构建所有平台所有架构
build-all: $(foreach p,$(PLATFORMS),build-$(p)-all)
	@echo "所有平台所有架构构建完成！"

# 构建特定平台的所有架构
build-windows-all:
	@echo "构建 Windows 所有架构..."
	GOOS=windows GOARCH=amd64 go build -o build/app-windows-amd64.exe
	GOOS=windows GOARCH=arm64 go build -o build/app-windows-arm64.exe
	GOOS=windows GOARCH=arm go build -o build/app-windows-arm.exe
	@echo "Windows 所有架构构建完成！"

build-darwin-all:
	@echo "构建 macOS 所有架构..."
	GOOS=darwin GOARCH=amd64 go build -o build/app-darwin-amd64
	GOOS=darwin GOARCH=arm64 go build -o build/app-darwin-arm64
	@echo "macOS 所有架构构建完成！"

build-linux-all:
	@echo "构建 Linux 所有架构..."
	GOOS=linux GOARCH=amd64 go build -o build/app-linux-amd64
	GOOS=linux GOARCH=arm64 go build -o build/app-linux-arm64
	GOOS=linux GOARCH=arm go build -o build/app-linux-arm
	@echo "Linux 所有架构构建完成！"

# 清理构建产物
clean:
	rm -rf build/*