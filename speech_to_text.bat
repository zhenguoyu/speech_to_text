@echo off
echo =============== ���ڼ��ػ��� =======================

:: ���ñ���
set exec_file=D:\develop\python\speech_to_text\main.py
set current_dir=%cd%

:: ��ʼ�� conda �������
call conda init cmd.exe >nul
call %USERPROFILE%\anaconda3\Scripts\activate.bat >nul
call conda activate myenv >nul

echo =============== ����������ϣ�����ɨ�� mp3 �ļ� ===============
echo.

:: ��ʼ��������
set /a i=0

:: ������ǰĿ¼�µ����� .mp3 �ļ�
for %%f in (*.mp3) do (
    echo =============== ��Ƶ�ļ� %%f, ���ڻ�ȡ��Ƶ���� ===============
    python "%exec_file%" -f="%current_dir%\%%f"
    set /a i+=1
)

:: ����Ƿ��ҵ���Ƶ�ļ�
if %i%==0 (
    echo =============== δ�ҵ���Ƶ�ļ� ===============
) else (
    echo =============== �������, ���ҵ� %i% ����Ƶ�ļ� ===============
)

:: ��������˳�
pause