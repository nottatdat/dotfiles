#!/bin/bash
export DATA_DIR="$HOME/data"

kaggle_download() {
    mkdir -p $DATA_DIR/"$1"
    kaggle competitions download -c "$1" -p $DATA_DIR/"$1"
}
