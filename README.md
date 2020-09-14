id    :nil
name  :yosuke 
email :y-kaneko@naito.jp
pass  :yosuke


・routing →　controller →　view
・CRUD = create/read/update/delete
・rails g controller Users new このコマンドで下記のファイルが作成される。
　　　・app/controllers/ users_controller.rb 
　　　・app/views/users/ new.html.erb

・integer 整数 / string 文字列 / datetime 時刻
・rails g model ファイル名　→　中身編集　→　rails db:migrate
・中身の記述を間違えたままrails db:migrateした時は、rails db：rollback
→直前で実行したmigrateファイルの読み込み前の状態に戻る。→ rails db:migrate

・rails c 
user = User.new(name: 'yosuke', email:'y-kaneko@naito.jp')
user.save

・大文字のユーザー(User)はユーザーのクラスを表す時に使用
・小文字のユーザー(user)はユーザーのインスタンスを表す時に使用

・findメソッド　→　モデルをidで検索する
・allメソッド　→　User.all

<!-- 登録フォーム　　　　　 -->
UsersController　　
newアクション　→　viewでフォーム入力　→　送信　→　createアクション

・form_for　→　フォームを作るためのメソッド
```rb
form_for モデルオブジェクト do |f|
end
```
のように「form_for モデル do |f|」と「end」で囲うことで、そのモデルのフォームを作成可能です。form_forで囲った中の処理には
text_field / text_area / number_field / password_field
などのメソッドが使用できるようになり、入力するデータに適した入力フィールドを作成します。また、form_forで入力したデータを送信するには f.submit を使用.
createアクションに送信される。

<!-- resourcesメソッドとは　 -->
(https://pikawaka.com/rails/resources)
railsで定義されている7つのアクションのルーティングを自動で作成するメソッド。 resourcesメソッドを使うことにより、簡単にルーティングを作成することができる。
rails routesで確認できる。
```rb
Rails.application.routes.draw do
  resources :コントローラー名
end
```
index	リソースの一覧を表示させる
show	リソースの詳細を表示させる
new	投稿フォームを表示させる
create	リソースを追加させる
edit	更新フォームを表示させる
update	リソースを更新させる
destroy	リソースを削除する

・redirect_to 指定したPATH(URL)に転送する
PATHはrails routesコマンドの一覧から、Prefixに_pathをつけたものとなる。
ex) redirect_to root_path
ex) redirect_to new_user_path

・render 呼び出すviewを指定する

<!-- ・params viewでフォームに入力された情報が入っている変数のこと -->

そのtext_fieldに入力されたデータは、submitボタンを押すと、paramsにそれぞれのシンボルで格納される

シンボルとは文字列とよく似たオブジェクトで、「:name」や「:email」のように、頭に「:」がついたオブジェクトのことを言います。

フォームに値を入力する
↓
送信ボタンを押す
↓
フォームの内容がparamsに値が格納される
↓
paramsの値を元にデータを作成する

<!-- validationについて -->

代表的なオプション

・presence　空でないか　/uniqueness 重複してないかどうか/length 長さを指定する/numericality 数値のみ受け付ける

<!-- パスワード機能の実装 -->

パスワードを実装したいモデルに以下のコードを追加

[has_secure_password]
・暗号化されたパスワードをデータベースのpassword_digestというカラムに保存できるようになる。
・passwordに加えてpassword_confirmation（パスワード確認用の再入力）が使えるようになる。また、存在性と値が一致するかどうかのバリデーション(チェック)も追加される。
・[authenticate]メソッドが使えるようになる。authenticateメソッドは、引数の文字列がパスワードと一致したかどうかをtrue/falseで返す。

[使うには]
$ rails g migration add_password_digest_to_モデル名 password_digest:string

$ rails db:migrate

gem 'bcrypt' →　passの暗号化
$ bundle install

rails s で再起動忘れずに

<!-- ログイン機能 session -->

「Session」と呼ばれる仕組みで、情報はサーバー側で保存し、暗号化した情報をクライアント側にCookieとして保存する方法を採用しています。

sessionはDBにデータを保存するわけではない為、モデル不要。

<!-- ナビゲーションの設置 -->

application_helper　→　viewで使用する共通のコードを指定
application_controller　→　controllerで共通で使用するコードを指定
にメソッドを追加する。
application.html.erbの編集

<!-- ログアウト機能 -->

<!-- 投稿機能 -->
[Post]モデルの作成
$ rails g model Post user_id:integer description:string
$ rails db:migrate
↓
モデルにバリデーションの追加
↓
★★モデルの関連付け★★
↓
$ rails g controller posts new
↓
ルーティングの追加
resouces :posts
↓
コントローラ
↓
ビュー

   <div class="">
            <%= f.label :image %>
            <%= f.file_field :image%>
    </div>

<!-- 投稿一覧機能     -->

<!-- ログイン時に　BCrypt::Errors::InvalidHash in SessionsController#create　とエラー -->

password_digestカラムがnilになっているユーザーがいることが原因

$ rake db:reset　で　データベースをリセットした。

<!-- 投稿するとNo method error になるので　下記 image_tagを排除した -->

  <%= image_tag post.image.url %>
  <%= image_tag '', class: '' %>
  <%= image_tag '', class: '' %>

  <!-- Userモデルに管理者権限カラムを追加 -->

下記記事を参考に実装
https://qiita.com/tanutanu/items/7ce8826615f1af605164


