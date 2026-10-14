# kira-ai-arm64

基于官方 [KiraAI](https://github.com/xxynet/KiraAI) 镜像的自用 ARM64 构建配置。

## 内容
- `Dockerfile`：在官方镜像基础上补充依赖（npm / tiktoken / redis 等），换中科大源加速国内拉取
- `.github/workflows/docker-image.yml`：GitHub Actions 自动构建，手动触发（workflow_dispatch）或发 Release 时触发，推送到 GHCR

## 用法
手动构建：仓库 Actions 页 → Run workflow → 填 image_tag
```
docker pull ghcr.io/kinoko-xgya/kira-ai:latest
```
