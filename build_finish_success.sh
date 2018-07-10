#!/bin/bash

BUILD_DIR_PATH=~/Documents/Build
START_FILE_PATH=$BUILD_DIR_PATH/_start.txt
BUILD_SUCCESS_DIR_PATH=$BUILD_DIR_PATH/logs/success

#前回のビルド実行開始時間を取得
START=`cat $START_FILE_PATH`

# ビルド開始記録を削除
rm $START_FILE_PATH

# ビルド終了時間
END=`date "+%s"`

# 現在日時
NOW=`date "+%Y-%m%d_%H:%M:%S"`

# ビルド実行時間の情報を格納するディレクトリ作成
mkdir -p $BUILD_SUCCESS_DIR_PATH/$NOW

# ビルド時間を記録
echo $((END-START)) > $BUILD_SUCCESS_DIR_PATH/$NOW/result.txt
