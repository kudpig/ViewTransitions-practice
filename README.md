# ViewTransitions-practice
[Xcode]画面遷移の練習

[![Image from Gyazo](https://i.gyazo.com/785861a726a294e5e305f7b36791c658.gif)](https://gyazo.com/785861a726a294e5e305f7b36791c658)

## 実装の流れの備忘録
どんなことを試しながら実装していったかを書く。なんの作業をしたか忘れそう<br>
storyboardで色々いじったものをgitに上げても、謎のファイルしか残らない故。

## １）レイアウトを縦に固定
作ろうとしているものが縦のみを想定しているので、練習を兼ねて

### 作業
- Xcodeプロジェクト名クリック → Generalタブクリック
- Deployment info 内の、Device Orientation の設定

いくつか項目
1. Portrait・・・縦画面（ホームボタンは下）
2. Upside Down・・・縦画面（ホームボタンは上）
3. Landscape Left・・・横画面（ホームボタンは左）
4. Landsape Right・・・横画面（ホームボタンは右）

これらのどの状態を許可するかということ。<br>
今回だと縦画面のみ（回転もさせない）ということになるので、<br>
1のPortraitのみをチェックすることにした。


## 2)画面遷移のためのボタン配置
ただボタンをおくだけ。UIButton

### AutoLayout
AutoLayoutの設定もとりあえずでやった。

### 作業
1. Add New Constraints
2. Heightを100に設定(ボタンの高さを設定)<br>
横幅はデバイスによって変えたいため制約をして設定はしない
3. 余白設定をする。<br>
top: 100, leading(左側): 50, trailing(右側): 50 とした。(テキトー)
4. Constrain to margins のチェックは外していない<br>
`どういう時に外すべきものなのかよくわかっていない` 

## 3)NavigationControllerSceneを設定
画面遷移をできるようにするため
### 作業

#### Main.storyboardのクラスをNavigationControllerに変更する
1. Main.storyboardの、View Controller Scene を選択
2. メニューバーの`Editor`→`Embed In`→`NavigationController`と選択
3. ストーリーボードで接続されていることを確認

## 4)Viewの追加(遷移先)
ボタンを押した先の画面を作っておく
### 作業
1. Main.storyboardを選択した状態で、Libraryから`View Controller`を選択、配置する。
2. てきとうに画面にいろつけたりする。（今回は背景をつけたのと、一つラベルをいれた）

## 5)セグエの設定
View1とview2をつなげる
### 作業
1. view1の`ViewController`を選択し、controlを押しながらview2へドラッグする。
2. Manual Segueの選択をする。いろいろあるがとりあえず`show`を選んでおく。画面遷移時の表示方式の設定<br>
showは遷移先の画面が右から左へスライドするアニメーションで表示される<br>
※そのうち全部試してみても良さそう

3. segueのidentifierを設定<br>
SegueObjectを選択→Attributes Inspectorを表示<br>
identifierを"firstTransitions"とした

## 6)ボタンの関連付け
画面遷移ボタンを`ViewController.Swift`に関連づける
#### IBAction接続という。
1. controlを押しながらドラッグする
2. Nameを`moveSecondView`とした

## 7)ボタンを押したら画面遷移するプログラムを追加
performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)を使用する
※上記のメソッド？関数？はVoid型
※Void型は何も返す値がないもののこと

#### 公式ソース
Apple Developer: https://developer.apple.com/documentation/uikit/uiviewcontroller/1621413-performsegue

### 作業
1. withIdentifierにsegueのidを文字列で入れるだけ


おわり
