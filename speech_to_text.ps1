Write-Output "===============正在加载环境==============="

$exec_file = "D:\develop\python\speech_to_text\main.py"
$current_dir = Get-Location

# 初始化 conda 并激活环境
conda init powershell | Out-Null
. $env:USERPROFILE\Documents\WindowsPowerShell\profile.ps1
conda activate myenv | Out-Null

Write-Output "===============环境加载完毕，正在扫描mp3文件==============="

Get-ChildItem -Path . -Filter *.mp3 | ForEach-Object {
    Write-Output "===============音频文件$($_.Name), 正在获取音频内容==============="
    python "$exec_file" -f="$current_dir\$($_.Name)"
}

Write-Output "===============处理完成==============="