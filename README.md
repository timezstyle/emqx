# 修改 emqx lua hook 拿不到 username 問題

1. 先 compile 修改過的 lua hook
```
make compile
```

1. 啟動 emqx 使用 docker
```
make dev
```

1. 等待 emqx server 啟動後, load test.lua script
```
make load
```