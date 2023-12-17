# model_size="large-v3"
model_size="tiny"

python finetune_lora.py \
    --model_path openai/whisper-$model_size \
    --dataset_path ./data \
    --peft_mode lora \
    --lora_rank 16   \
    --learning_rate 2e-4 \
    --fp16 \
    --logging_steps 10 \
    --output_dir models/$model_size \
    --save_strategy "no"  \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --num_train_epochs 1  \
    --evaluation_strategy "steps" \
    --per_device_eval_batch_size=1 \
    --eval_steps 100
