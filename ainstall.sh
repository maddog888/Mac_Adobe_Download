#!/bin/bash

# 2023 年 6 月 17 日 By:MadDog
# https://github.com/maddog888/Mac_Adobe_Download/

# 输出声明信息
echo "免责声明："
echo "本脚本仅供学习参考，不可用于其他用途，否则自行承担相应的法律责任。"
#获取 CDN 服务器
if [ -z "$1" ]; then
  cdn="https://ccmdls.adobe.com"
else
  cdn="$1"
fi

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

# /application.json
# 输出数组中的所有元素

echo "所需相关信息文件:"
for dir in "${paths[@]}"; do
  echo "$dir"
  wget --header="User-Agent: Creative Cloud" "$cdn" -O ~/Pictures/example.jpg
done

# Download file from server with headers
# wget --header="User-Agent: Creative Cloud" "$cdn"+"/123" -O ~/Pictures/example.jpg
