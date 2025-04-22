#!/bin/bash

# 创建保存目录（如果没有）
mkdir -p logs
mkdir -p models

# 设置实验名
EXP_NAME="mnist_lr"

echo "Running experiment: $EXP_NAME"

# 启动训练任务
python grad_attack.py \
  --batch-size 64 \
  --test-batch-size 1000 \
  --epochs 14 \
  --lr 1 \
  --gamma 0.7 \
  --attack \
  --LP l2 \
  --eps 1e-4 \
  --attack_lr 1e-3 \
  --save-model \
  > logs/${EXP_NAME}.log

mv models/mnist.pt target_models/${EXP_NAME}.pt

echo "Done. Model saved to models/${EXP_NAME}.pt"
echo "Log saved to logs/${EXP_NAME}.log"
