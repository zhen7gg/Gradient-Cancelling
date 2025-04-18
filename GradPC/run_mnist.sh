#!/bin/bash

# 创建保存目录（如果没有）
mkdir -p logs
mkdir -p models

# 设置实验名
EXP_NAME="mnist_cnn"

echo "Running experiment: $EXP_NAME"

# 启动训练任务
python train.py \
  --batch-size 64 \
  --test-batch-size 1000 \
  --epochs 5 \
  --lr 0.01 \
  --gamma 0.7 \
  --attack \
  --LP l2 \
  --eps 0.001 \
  --attack_lr 1 \
  --save-model \
  > logs/${EXP_NAME}.log

mv models/mnist_gd_cnn_5e-1.pt models/${EXP_NAME}.pt

echo "Done. Model saved to models/${EXP_NAME}.pt"
echo "Log saved to logs/${EXP_NAME}.log"
