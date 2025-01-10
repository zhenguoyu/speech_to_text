@echo off
echo ===============正在加载环境===============

set exec_file=%USERPROFILE%\development\python\voice_to_word\main.py
set current_dir=%cd%

:: 初始化 conda 并激活环境
call conda init cmd.exe > nul
call %USERPROFILE%\miniconda3\Scripts\activate.bat > nul
call conda activate myenv > nul

echo ===============环境加载完毕，正在扫描mp3文件===============

for %%f in (*.mp3) do (
    echo ===============音频文件%%f, 正在获取音频内容===============
    python "%exec_file%" -f="%current_dir%\%%f"
)

echo ===============处理完成===============