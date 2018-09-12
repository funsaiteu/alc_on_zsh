# alc on zsh

zshで英和辞典や和英辞典を使用したいというモチベーションで書きました。
alcの検索結果の部分を切り取って表示しています。
画面内に収まって欲しかったので例も切り取っています。
itermなどで半透明にしてhot keyを設定しておくと翻訳や論文を読むのが捗ります。

## 下準備

1. w3mをインストール

* macportsを使用する場合

```zsh
% sudo port selfupdate
% port install w3m
```

2. `~/.zshrc`内にコードを記述

## 使用例

* 標準

```zsh
% alc git
    【名】
        〈英話〉ばか、間抜｛まぬ｝け、くそったれ（野郎｛やろう｝）
    【発音】gít、【＠】ギットゥ
%
```

* aliasを使用

```zsh
% a git
    【名】
        〈英話〉ばか、間抜｛まぬ｝け、くそったれ（野郎｛やろう｝）
    【発音】gít、【＠】ギットゥ
%
```

* 熟語は`space`の代わりに`+`を用いることによって検索可能

```zsh
% a pros+and+cons
    賛否両論｛さんぴりょうろん｝、良い点と悪い点
    ・Let's discuss the pros and cons of the proposal. : その提案のプラス面とマ
    イナス面について話し合おう。
    ・The pros and cons are batted back and forth. : 賛否両論が入り乱れている。
%
```

* スペルミスをした場合

```zsh
% a ggit
failed
%
```
