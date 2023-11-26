# 示例脚本：GlobalReplaceInDirectory.ps1

# 设置目标文件夹路径
$directoryPath = "C:\Users\19426\projects\my\github\GPTPrompt.github.io-main\code\dist"

# 设置要替换的文本
$oldText = "_next/"
$newText = "next/"

# 获取目录中所有文件
$filePaths = Get-ChildItem -Path $directoryPath -File -Recurse | ForEach-Object { $_.FullName }

# 遍历文件并执行全局文本替换
foreach ($filePath in $filePaths) {
    # 读取文件内容
    $fileContent = Get-Content -Path $filePath -Encoding UTF8

    # 进行全局文本替换
    $newContent = $fileContent -replace $oldText, $newText

    # 将替换后的内容写回文件
    Set-Content -Path $filePath -Value $newContent -Encoding UTF8
}

Write-Host "目录中所有文件的全局文本替换完成"
