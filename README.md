# README
■ サービス概要  
　Vegeマップ

　例）
  ベジタリアンメニューのあるレストランをすぐに見つけられない人向けに簡単に探せるようにするツール
  海外の方でも安心してレストランを検索できるツール

■メインのターゲットユーザー  
  ・自身がベジタリアンやヴィーガンの方  
  ・ベジタリアンの方に接待やおもてなしをする方  

■ユーザーが抱える課題  
  ◇課題1  
    ・ベジタリアン向けレストランを簡単に見つけることができない  
    ・情報が古い  
  ◇課題2  
    既存のベジマップが使いづらい  
      ・マップ上でポイントを選択するまで、お店の名前が分からず、詳細を見るためには画面遷移して詳細を見る必要がある  
      ・情報が最新でないため、詳細が書かれていない場合や、google mapで調べると、閉業している場合がある  
      ・検索しても、検索結果がリストのように表示されないため、マップ上でズームして一つずつ選択しなければならない  
      ・日本全国を対象としており、毎回地域を選択しなければならない  
      ・マイリストとして「お気に入り」しかないので、自分オリジナルのリストを作成できない   

■問題点仮説
  ◇仮説1  
    ・SEOが弱く検索しても出て来ない  
    ・情報が古い  
  ◇仮説2  
    ・既存mapのUXが弱い  
    ・Google mapの情報を取り込んでいない  
    ・ユーザーが最新情報を登録できない  
    ・マイリストの機能が乏しい  

■仮説に対する解決策  
  ・スクレイピング／最新マップ読み込みによって新しい情報を掲載する    
    参考予定の情報  
      ①https://vegemap.org/en/  
      ②https://maps.app.goo.gl/CXxybqtmHhry3Li68?g_st=ic  
  ・ユーザーがマップにベジタリアン向けレストランを登録することができる  
  ・Google map APIを利用する  
  ・マイリスト機能を拡充する  

■実装予定の機能  
  ◯未登録ユーザー  
    ・未登録ユーザーは新規登録ページでユーザー登録できる    
      ・名前、住んでいる都道府県、食の選択情報  
      ・ユーザー登録からログイン画面に遷移する  

  ◯未登録ユーザ／登録ユーザー共通  
    ・ユーザーがマップページを閲覧することができる  
    ・マップで選択したレストランの詳細を見ることができる  
      ・詳細ページからレストランのインスタやホームページのURLに遷移できる  
      ・詳細ページはGoogle mapの概要を見ることができる   
    ・ユーザーがレストランを検索して条件ごとに表示できる（地名、レストラン名入力検索、カテゴリー、リスト検索）  
      ・レストランを一覧表示できる  
      ・食事のカテゴリー（イタリアン、中華、日本食など）で検索できる  
      ・「ベジタリアン対応」「ヴィーガン対応」の2種類でレストランを絞ることができる  
        ※全てのメニューが対応している必要はないが、専用メニューがあるレストランに限定する  

  ◯登録ユーザー  
    ・ユーザーのログイン／ログアウト機能がある  
    ・マイページでユーザー情報を編集できる   
    ・登録ユーザーはマイリストを作成できる  
      ・デフォルトは「お気に入り」「行きたい」「行ったよ」「イベント」リスト  
      ・リストの詳細を編集、削除できる  
      ・それぞれのリストを表示し、詳細に遷移できる  
      ・「行きたい」リストのレストランは「行ったよ」にチェックすると「行ったよ」リストに追加される  
      ・イベントは、イベント名、日程、概要、公開設定を登録、編集、削除できる  
      ・リストは登録日順、イベント日付順などに並べ替えできる  
    ・登録ユーザーはマップ内にユーザーがレストランを追加し、公開することができる  
      ・レストランのカテゴリー、URLなどを追加、編集できる  
    ・問い合わせ機能がある
    ・退会機能がある  

  ◯管理ユーザー  
    ・登録ユーザー（管理ユーザ含む）の検索、一覧、詳細、編集  
    ・管理ユーザー用のマイリストの一覧、詳細、編集、削除  
    ・レストランの検索、一覧、詳細、作成、編集、削除  
    ・問い合わせの閲覧

■なぜこのサービスを作りたいのか？
  ・多様な食の選択肢を持った人に向けたレストランがもっと認知されてほしい  
  ・安心して食事の場を選択できるようにしたい  
    ⇨海外にいた時、大抵のレストランではメニューにはグルテンフリー、ヴィーガン対応などの表記がありました。  
      身体的、宗教的、健康面、環境面など様々な理由で食の選択肢は多様化しています。  
      多様化する社会の中で、どんな人でも安心して食事の場を選択できるようにしたい、  
      あらゆる食の選択をする人がいることを社会に認知してもらいたい、と考えこのサービスを作りたいです。  

■スケジュール（フルコミットではない）  
  企画〜技術調査：5/8〆切  
  README〜ER図作成：5/10 〆切  
  メイン機能実装：5/10 - 6/15  
  β版をRUNTEQ内リリース（MVP）：6/15〆切  
  本番リリース：6月末  

■使用する予定の技術  
  - Rails7
  - nokogiri
  - Bootstrap
  - mysql
  - Google Cloud Platform
  - Vue.js
  - AWS

■画面遷移図　　
https://www.figma.com/file/tQgkhDA6YN7GDQob6WHdwI/Vege-project?node-id=0%3A1&t=8wuFjpcySiTfWjVU-1

■ER図

■ER図  
・Userテーブル（ユーザー情報の保存）  
  name：氏名、必須  
  email：メールアドレス、必須  
  profile：プロフィール、任意  
  address：住んでいる県、任意  
  age：年齢、任意  
  vegetarian_type_id：外部キー、自身のベジタリアンの種類、任意  
  avatar：アバター写真、任意  
  roles：権限（一般or管理者）デフォルトは一般ユーザー、必須  
  crypted_password, salt：パスワード、必須  

・User_listsテーブル（ユーザーリストの名前と概要を保存）  
  user_id：外部キー、必須  
  list_name：リスト名、必須  
  description：リストの概要、任意  

・List_places（User_listの中身）  
  user_list_id：外部キー、必須  
  place_id：外部キー、必須  

・Placeテーブル（レストランやお店の情報を保存）  
  name：店舗名、必須  
  address；住所、必須  
  description：店の概要、任意  
  map_url：マップ情報の保存（Google mapのURL）、必須  

・Place_of_vegetarian_type（ベジタリアンの複数選択ができるように店舗とベジタリアン種類の中間テーブル）  
  place_id：外部キー、店舗id、必須  
  vegetarian_type_id：外部キー、ベジタリアン種類の保存、必須  

・Vegetarian_type（ベジタリアン,ヴィーガンなどの種類を保存）  
  name：ベジタリアン種類の名前、必須  

・Category（料理のカテゴリー名の保存）  
  name：カテゴリー名、必須  

・Category_place  
  category_id：外部キー、必須  
  place_id：外部キー、必須  

・Events（イベントの概要の保存）  
  user_id：外部キー、登録するユーザーID、必須  
  place_id：外部キー、イベントの場所ID、任意  
  name：イベントの名前、必須  
  event_url：イベントのURL、任意  
  description：イベントの概要、任意  
  starting_at：イベントの開始時間、必須  
  ending_at：イベントの終了時間、必須  
  status：イベントの公開／非公開／下書きなどの状態、必須  

・Saved_events  
  user_id：外部キー、必須  
  events_id：外部キー、必須  

・Links_of_places（リンクの保存）  
  place_id：外部キー、必須  
  url：レストラン詳細のURL、必須  
  link_category：Webサイト、Instagram、Facebook、その他などリンクの種類が選択できる、必須  

![Vegee](https://user-images.githubusercontent.com/101486233/236111575-0969da6e-0fee-469b-b6c5-1ad73c736848.png)