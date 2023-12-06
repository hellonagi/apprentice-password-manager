# アプレンティス Webテスト 提出課題
## 機能
- パスワードの追加: サービス名、ユーザー名、パスワードを暗号化して保存します。
- パスワードの取得: サービス名を入力すると、該当するサービスのユーザー名とパスワードを表示します。
- プログラムの終了: スクリプトを終了します。

## 使用方法
```
./password_manager.sh
```
表示されるメニューから以下の選択肢を入力してください。
- Add Password: パスワードの追加。
```
次の選択肢から入力してください(Add Password/Get Password/Exit)：
Add Password
サービス名を入力してください：
Google
ユーザー名を入力してください：
Mike
パスワードを入力してください：

パスワードの追加は成功しました。
```
- Get Password: パスワードの取得。
 ```
次の選択肢から入力してください(Add Password/Get Password/Exit)：
Get Password
サービス名を入力してください：
Google
## サービス名が保存されていなかった場合
そのサービスは登録されていません。
## サービス名が保存されていた場合
サービス名：Google
ユーザー名：Mike
パスワード：12345678
```
- Exit: スクリプトを終了します。
```
次の選択肢から入力してください(Add Password/Get Password/Exit)：
Exit
Thank you!
```

## 備考
このスクリプトは課題用に作成されたもので、セキュリティの安全性を完全に保証するものではありません。
