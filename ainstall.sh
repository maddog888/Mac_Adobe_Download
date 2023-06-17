#!/bin/bash

# 2023 年 6 月 17 日 By:MadDog
# https://github.com/maddog888/Mac_Adobe_Download/
# 使用路径 *.app/Contents/Resources/products/

# 输出声明信息
echo "免责声明："
echo "本脚本仅供学习参考，不可用于其他用途，否则自行承担相应的法律责任。"

#获取 CDN 服务器
if [ -z "$1" ]; then
  cdn="https://ccmdls.adobe.com"
else
  cdn="$1"
fi

echo "开始扫描 Json ...... 。"
# 获取脚本所在文件夹的路径
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 定义一个空的数组来存储文件夹名称
paths=()

# 遍历脚本所在文件夹中的所有文件夹
for dir in "$scriptDir"/*/ ; do
    # 如果是文件夹，则将其添加到数组中
    if [ -d "$dir" ]; then
        paths+=("${dir%/}")
    fi
done

echo "正在读取 相关文件 ...... 。"
# 读取相关文件信息
for dir in "${paths[@]}"; do
  # 获取 文件中 的 Path 值
  path=$(grep -o '"Path":"[^"]*"' "$dir//application.json" | cut -d'"' -f4)
  # 开始构建下载
  for p in $path
    do
      echo "正在下载文件 $cdn$p"
      # 下载文件
      curl -o "$dir/$(basename "$p")" "$cdn/$p" -A "Creative Cloud"
  done
done
echo "下载完成，现在可以运行安装。"
