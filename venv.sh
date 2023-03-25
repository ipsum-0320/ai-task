# 进入 venv 的指令，工作目录需要是 vegetables_analyzer/。
cd ./venv/Scripts && source activate && cd ../../

# 退出 venv 的指令，工作目录需要是 vegetables_analyzer/。
cd ./venv/Scripts && deactivate && cd ../../

# 如果要使用 venv 中的依赖，那么执行时，命令行应该也处于 venv 环境中。