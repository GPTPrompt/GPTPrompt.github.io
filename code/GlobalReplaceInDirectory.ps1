$OutputEncoding = [System.Text.Encoding]::UTF8

# 设置目标文件夹路径
$directoryPath = "C:\Users\19426\projects\my\github\GPTPrompt.github.io-main\code\dist"

# 获取目录中所有文件
$global:filePaths = Get-ChildItem -Path $directoryPath -File -Recurse | ForEach-Object {  $_ | Select-Object FullName, Name}


function GetFilesWithUnderscore {
    param ()
    
    Write-Host "GetFilesWithUnderscore..."

    # 创建一个数组来存储重命名后的完整路径
    $renamedFilePaths = @()

    # 循环遍历对象数组，检查文件名是否包含下划线，并进行重命名
    foreach ($file in $global:filePaths) {
        # 如果文件名包含下划线
        if ($file.Name -like "*_*") {
            $renamedFilePaths += $file
        }
    }

    # 返回包含所有重命名后的完整路径的数组
    return $renamedFilePaths
}

# 调用函数，并传递目录路径参数
$global:FilesWithUnderscore = GetFilesWithUnderscore 


function AllTextReplace {
    param (
        [string]$oldText,
        [string]$newText
    )
    # 遍历文件并执行全局文本替换
    foreach ($f in $global:filePaths) {
            # 读取文件内容
        $fileContent = Get-Content -Path $f.FullName -Encoding UTF8

        # 进行全局文本替换
        $newContent = $fileContent -replace $oldText, $newText

        # 将替换后的内容写回文件
        Set-Content -Path $f.FullName -Value $newContent -Encoding UTF8
    }
}


function ReplaceFileName {
    param ()
    
    Write-Host "ReplaceUnderscore..."

    # 循环遍历对象数组，检查文件名是否包含下划线，并进行重命名
    foreach ($file in $global:FilesWithUnderscore) {
        # 如果文件名包含下划线
        $newFileName = $file.Name -replace "_", "-"

        # 执行重命名操作
        Rename-Item -Path $file.FullName -NewName $newFileName -Force

        # 打印旧文件名和新文件名
        Write-Output "old fileName: $($file.Name); new fileName: $($newFileName)"
    }
}


# 替换文本内容
function ReplaceFileContent {
    param ()
    
    Write-Host "ReplaceFileContent..."

    foreach ($file in $global:FilesWithUnderscore) {
        $newFileName = $file.Name -replace "_", "-"

        # 循环遍历对象数组，检查文件名是否包含下划线，并进行重命名
        AllTextReplace -oldText $file.Name -newText $newFileName
    }
}

# 设置要替换的文本
AllTextReplace -oldText "_next/" -newText "next/"

ReplaceFileContent

ReplaceFileName
