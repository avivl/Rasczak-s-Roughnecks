#!/usr/bin/env bash
BASE_DIR="/Users/aviv.laufer/Git/avivl/Rasczak-s-Roughnecks/data_engineering/dataset"
TARGET_DIR="/Users/aviv.laufer/Git/avivl/Rasczak-s-Roughnecks/dataset"
STRAT=`pwd`

#start with cockroach
cp $BASE_DIR/american_cockroach/* $TARGET_DIR/cockroach/
cp $BASE_DIR/Blattidae/* $TARGET_DIR/cockroach/
cp $BASE_DIR/cockroach/* $TARGET_DIR/cockroach/
cp $BASE_DIR/german_cockroach/* $TARGET_DIR/cockroach/
cp $BASE_DIR/Periplaneta/* $TARGET_DIR/cockroach/

#good lod insects
cp $BASE_DIR/beatles_insects/* $TARGET_DIR/insects/
cp $BASE_DIR/insects_-cockroach/* $TARGET_DIR/insects/
cp $BASE_DIR/bugs/* $TARGET_DIR/insects/