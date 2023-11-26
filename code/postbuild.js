// const fs = require('fs');
// const path = require('path');

// const sourcePath = path.resolve(__dirname, 'dist/_next');
// const targetPath = path.resolve(__dirname, 'dist/custom-next');

// // 检查目标路径是否存在，不存在则创建
// if (!fs.existsSync(targetPath)) {
//   fs.mkdirSync(targetPath);
// }

// // 使用 fs.renameSync 进行目录重命名
// fs.renameSync(sourcePath, targetPath);

// console.log('目录重命名完成');

const { exec } = require('child_process');

const sourcePath = 'dist/_next';
const targetPath = 'dist/next';

const command = `move "${sourcePath}" "${targetPath}"`;

exec(command, { encoding: 'utf8' }, (error, stdout, stderr) => {
  if (error) {
    console.error(`移动失败: ${error.message}`);
    return;
  }

  console.log(`移动成功: ${stdout}`);
});



// 全局文本替换
const command1 = `powershell -File GlobalReplaceInDirectory.ps1`;

exec(command1, (error, stdout, stderr) => {
  if (error) {
    console.error(`全局文本替换失败: ${error.message}`);
    return;
  }

  console.log(`全局文本替换成功: ${stdout}`);
});