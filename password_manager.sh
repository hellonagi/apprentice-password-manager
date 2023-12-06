#!/usr/bin/bash

function add_password (){
    echo "サービス名を入力してください："
    read service

    echo "ユーザー名を入力してください："
    read username

    echo "パスワードを入力してください："
    read -s password

    echo "${service}:${username}:${password}" >> accounts.txt

    echo "パスワードの追加は成功しました。"
}

function get_password (){
    echo "サービス名を入力してください："
    read input_service

    accounts=$(grep "^${input_service}:" accounts.txt)

    if [ -n "$accounts" ]; then
        echo "サービス名：${input_service}"
        for account in $accounts
        do
            user=$(echo "$account" | cut -d':' -f2)
            password=$(echo "$account" | cut -d':' -f3)
            echo "ユーザー名：${user}"
            echo "パスワード：${password}"
        done
    else
        echo "そのサービスは登録されていません。"
    fi
}

echo "パスワードマネージャーへようこそ！"

while true
do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read choice

    case $choice in
        "Add Password" )
            add_password
            ;;
        "Get Password" )
            get_password
            ;;
        "Exit" )
            echo "Thank you!"
            break
            ;;
        * )
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
done