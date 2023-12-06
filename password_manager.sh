#!/usr/bin/bash

tmp=$(mktemp)
trap 'rm -f "$tmp"' INT TERM EXIT

function encrypt_file(){
    gpg --batch --yes --quiet --symmetric --cipher-algo AES256 --output accounts.gpg "$tmp"
}

function decrypt_file(){
    if [ -f "accounts.gpg" ]; then
        gpg --batch --yes --quiet --output "$tmp" --decrypt accounts.gpg
    else
        : > "$tmp"
    fi
}

function add_password (){
    echo "サービス名を入力してください："
    read service

    echo "ユーザー名を入力してください："
    read username

    echo "パスワードを入力してください："
    read -s password

    decrypt_file
    echo "${service}:${username}:${password}" >> "$tmp"
    encrypt_file

    echo "パスワードの追加は成功しました。"
}

function get_password (){
    echo "サービス名を入力してください："
    read input_service

    decrypt_file
    accounts=$(grep "^${input_service}:" "$tmp")

    if [ -n "$accounts" ]; then
        echo "サービス名：${input_service}"
        while read account;
        do
            user=$(echo "$account" | cut -d':' -f2)
            password=$(echo "$account" | cut -d':' -f3)
            echo "ユーザー名：${user}"
            echo "パスワード：${password}"
        done <<< "${accounts}"
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