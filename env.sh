#!/bin/bash

# 存放环境变量字符串 
ENV="window._env_={"

# 遍历 .env 文件的每一行
while read -r line || [[ -n "$line" ]];
do
  # 用 `=` 分割
  if printf '%s\n' "$line" | grep -q -e '='; then
    varname=$(printf '%s\n' "$line" | sed -e 's/=.*//')
    varvalue=$(printf '%s\n' "$line" | sed -e 's/^[^=]*=//')
  fi

  # 从环境变量中取值
  value=$(printf '%s\n' "${!varname}")
  # 如果环境变量中没有，使用.env中的值
  [[ -z $value ]] && value=${varvalue}  
  
  # 连接
  ENV+="$varname:\"$value\","
done < .env

ENV+=" }"
echo $ENV
# 在head标签结束前插入html
sed -i  "/<\/head>/i <script>$ENV</script>" index.html