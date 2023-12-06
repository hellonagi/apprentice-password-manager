#!/usr/bin/bash

function add_password (){
    echo "サービス名を入力してください："
    read service

    echo "ユーザー名を入力してください："
    read username

    echo "パスワードを入力してください："
    read -s password

    echo "${service}:${username}:${password}" >> accounts.txt
}

echo "パスワードマネージャーへようこそ！"

while true
do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read choice

    case $choice in
        "Add Password" )
            add_password
            echo "パスワードの追加は成功しました。"
            ;;
        "Get Password" )
            # TODO: get_passwordの実装
            echo "Get Password"
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