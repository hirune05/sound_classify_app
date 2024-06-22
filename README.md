## Sound_Classify_app(Soundfit)
聴覚過敏の人が感じる音の世界を疑似体験できるアプリです。具体的には、
・聴覚過敏の人が感じる、”音によるストレス”をARで可視化
・聴覚過敏の人が苦手な音を大きくする
２つの機能により、聴覚過敏の世界を擬似的に体感できるようにしました。
このアプリが、聴覚過敏の社会認知度・理解の向上に貢献し、聴覚過敏の人にとって過ごしやすいバリアフリー社会が近い将来に実現することを願っています。

## ビルド方法
direnvとfvmを使用しています。sound_classify_appディレクトリで
```shell
direnv allow
```
してください。
```shell
flutter --version
```
で、バージョンが`3.19.0`であることを確認してください。
`3.19.0`でない場合は
```shell
fvm use 3.19.0
```
を実行してください。
インストールされていない場合は、
```shell
fvm install 3.19.0
```
で、インストールしましょう。

ARKitやマイクを使用するため、**実機ビルド**する必要があります。お使いのデバイスを設定して
```shell
flutter run
```
してください。