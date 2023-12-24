# 使用するベースイメージを指定
FROM alpine:latest

# ワーキングディレクトリを設定
WORKDIR /usr/src/app

# 必要なパッケージをインストール
RUN apk add --no-cache git build-base

# リポジトリをクローン
RUN git clone https://github.com/ggerganov/llama.cpp

# リポジトリのディレクトリに移動し、ビルド
RUN cd llama.cpp && make

# # nekomata-7bのモデルをダウンロード
RUN cd llama.cpp && wget https://huggingface.co/rinna/nekomata-7b-gguf/blob/main/nekomata-7b.Q4_K_M.gguf
