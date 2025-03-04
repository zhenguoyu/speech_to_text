@echo off
echo =============== 正在加载环境 =======================

:: 设置变量
set exec_file=D:\develop\python\speech_to_text\main.py
set current_dir=%cd%

:: 初始化 conda 并激活环境
call conda init cmd.exe >nul
call %USERPROFILE%\anaconda3\Scripts\activate.bat >nul
call conda activate myenv >nul

echo =============== 环境加载完毕，正在扫描 mp3 文件 ===============
echo.

:: 初始化计数器
set /a i=0

:: 遍历当前目录下的所有 .mp3 文件
for %%f in (*.mp3) do (
    echo =============== 音频文件 %%f, 正在获取音频内容 ===============
    python "%exec_file%" -f="%current_dir%\%%f"
    set /a i+=1
)

:: 检查是否找到音频文件
if %i%==0 (
    echo =============== 未找到音频文件 ===============
) else (
    echo =============== 处理完成, 共找到 %i% 个音频文件 ===============
)

:: 按任意键退出
pause