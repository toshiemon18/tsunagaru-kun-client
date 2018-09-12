# つながるくん iOSクライアント

## Getting Started

### リポジトリのクローン

```
$ git clone https://github.com/toshiemon18/tsunagaru-kun-client
```

### rbenv環境の構築

```
$ which ruby
# /Users/yourname/.rbenv/shims/ruby と出ればOK
# /usr/bin/ruby 等が出る場合は、rbenv環境を構築する必要がある。
```

### synxとCocoaPodsのインストール

Gemfileに必要なライブラリが書いてあるので、以下のコマンドを実行すれば良い。

```
$ bundle install
$ rbenv rehash
```

```
$ pod setup
# 結構時間かかる
```

synxは、Xcodeのグループと実際のフォルダ構成を一致させるツール。
CocoaPodsは、ライブラリ管理ツール。（RubyでいうbundlerやPythonでいうpip的なもの）


### Swiftライブラリのインストール

```
$ pod install
```


### Xcodeのプロジェクトを開く

CocoaPodsを利用してライブラリのインストールを行ったXcodeプロジェクトは、 `tsunagaru-kun.xcodeproj` ではなく、 `tsunagaru-kun.xcworkspace` を開くこと。


## 開発方法

UIディレクトリ内にさらに機能ごとにディレクトリを作り、1画面1Storyboardで画面遷移を管理しています。

