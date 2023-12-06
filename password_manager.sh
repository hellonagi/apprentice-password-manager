#!/usr/bin/bash

echo "パスワードマネージャーへようこそ！"

echo "サービス名を入力してください："
read service

echo "ユーザー名を入力してください："
read username

echo "パスワードを入力してください："
read -s password

echo "${service}:${username}:${password}" >> accounts.txt

echo "Thank you!"