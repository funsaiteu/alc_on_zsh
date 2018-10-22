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

2. クローンしシンボリックリンクを貼る
```zsh
% cd ~/
% git clone https://github.com/funsaiteu/alc_on_zsh.git
% cd alc_on_zsh
% chmod 755 alc
% ln -si /Users/(username)/alc_on_zsh/alc /usr/local/bin
```

## 使用例

* 標準

```zsh
% alc git
    【名】
        〈英話〉ばか、間抜｛まぬ｝け、くそったれ（野郎｛やろう｝）
    【発音】gít、【＠】ギットゥ
%
```

* 熟語は`space`の代わりに`+`を用いることによって検索可能

```zsh
% alc pros+and+cons
    賛否両論｛さんぴりょうろん｝、良い点と悪い点
    ・Let's discuss the pros and cons of the proposal. : その提案のプラス面とマ
    イナス面について話し合おう。
    ・The pros and cons are batted back and forth. : 賛否両論が入り乱れている。
%
```

* スペルミスをした場合

```zsh
% alc ggit
failed
%
```
