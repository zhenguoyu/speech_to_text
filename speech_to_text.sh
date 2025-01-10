#!/usr/bin/env zsh

echo "===============正在加载环境==============="
cd "$(dirname "$0")"
exec_file=$HOME/development/python/voice_to_word/main.py
current_dir=$(pwd)
conda init zsh >> /dev/null
source ~/.zshrc >> /dev/null
conda activate myenv > /dev/null 

echo "===============环境加载完毕， 正在扫描mp3文件==============="

for file in *; do
    if [ -f "$file" ]; then  # 检查是否是文件
        extension=$(basename "$file" | cut -d. -f2)
        #echo "File: $file". $extension
        if [ "$extension" = "mp3" ]; then 
            echo "===============音频文件$file, 正在获取音频内容==============="
            python $exec_file -f=$current_dir/$file
        fi
    fi
done