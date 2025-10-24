.PHONY: build deploy clean help

# 默认提交消息
COMMIT_MSG ?= "rebuilding site $(shell date)"

help:
	@echo "可用的命令："
	@echo "  make build   - 构建 Hugo 站点"
	@echo "  make prd  - 构建并部署到 GitHub"
	@echo "  make clean   - 清理构建文件"
	@echo ""
	@echo "使用自定义提交消息："
	@echo "  make deploy COMMIT_MSG=\"your message\""

build:
	@echo "\033[0;32m构建 Hugo 站点...\033[0m"
	hugo

prd:
	@echo "\033[0;32m构建并部署到 GitHub...\033[0m"
	git add .
	git commit -m $(COMMIT_MSG)
	git push origin main
	@echo "\033[0;32m部署完成！\033[0m"

clean:
	@echo "清理 public 目录..."
	rm -rf public

