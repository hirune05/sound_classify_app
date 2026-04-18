## Sound_Classify_app(Soundfit)

聴覚過敏の人が感じる音の世界を疑似体験できるアプリです。具体的には、
・聴覚過敏の人が感じる、”音によるストレス”をARで可視化
・聴覚過敏の人が苦手な音を大きくする
２つの機能により、聴覚過敏の世界を擬似的に体感できるようにしました。
このアプリが、聴覚過敏の社会認知度・理解の向上に貢献し、聴覚過敏の人にとって過ごしやすいバリアフリー社会が近い将来に実現することを願っています。

分類した音の情報は別アプリの地図上で確認可能です
Soundfit(Mapアプリ):
https://cocomakers-sound-classify-app.web.app

## Skills を用いた対話型セットアップと実行

> [!TIP]
> Codex または Claude Code を使用している場合は、以下コマンドで対話的にセットアップを実行できます。（iOSのみ対応）
> 
> Cocex: `$sound-classify-ios-startup`
> 
> Claude Code: `/sound-classify-ios-startup`

## ビルド方法

direnvとfvmを使用しています。sound_classify_appディレクトリで

```shell
direnv allow
```

してください。

```shell
flutter --version
```

で、バージョンが`3.41.1`であることを確認してください。
`3.41.1`でない場合は

```shell
fvm use 3.41.1
```

を実行してください。
インストールされていない場合は、

```shell
fvm install 3.41.1
```

で、インストールしましょう。

以下のコマンドで実機にて実行してください。

```shell
flutter run -d <device-id>
```
