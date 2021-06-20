# unsplash_viewer_flutter

Flutterフレームワークを利用したスマホアプリです。

[unsplash api](https://unsplash.com/developers) という、写真を提供してくれるAPIを利用したフォトビューワーです。

## 説明

基本的な構成は [wasabeef's project](https://github.com/wasabeef/flutter-architecture-blueprints) のプロジェクトをかなり参考にしています。したがって、いくつかのソースは同一のものになっています。

### アーキテクチャ
クリーンアーキテクチャの考え方を踏襲し、基本的構造はMVVM、repositoryを使用する形にしています。

### 機能
![unsplash_viewer_video](https://user-images.githubusercontent.com/41030516/122670679-2b1ab100-d1fe-11eb-8c88-f8054100b7bc.gif)
* Unsplashより取得した写真を表示することができる
* 画面回転により、写真を表示する個数を変更することができる
* 設定画面より、ホーム画面で使用する写真のサイズを変更できる

### ポイント
* [riverpod](https://riverpod.dev/) を採用し、DIを考慮したアーキテクチャによりテスト可能にしている
* タスクRunnerとして[grinder](https://pub.dev/packages/grinder) を採用することで基本的なタスクは環境を問わず実行可能にしている
* [freezed](https://pub.dev/packages/freezed) を利用することで、mutableの負債を蓄積しない作りにしている
* [retrofit](https://pub.dev/packages/retrofit) を利用することでAPIのコードをスッキリ書いている
* analysis_options.yamlを指定することで強固なLINTを有効にしている
* [flutter_gen](https://pub.dev/packages/flutter_gen) を利用することでリソースの書き間違いを防止
* httpクライアントアプリケーション上で単一のインスタンスとして持ち、ネットワーク越しにデータを取りに行くときにその共有のインスタンスを使用できるような作りにしている

### メモ
* 写真詳細画面の追加
* Firebaseにレポートする機能の追加
* Web対応
* 多言語対応
* Theme変更対応
