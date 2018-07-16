#!/bin/bash

# Command example: ./train_script.sh -d 3 -s 5 -m train

# Declare dataset index
DATASET1=family
DATASET2=kinship

# Peice of code help take options from command line in order: d, s, m
while getopts d:s:m: opts; do
    case ${opts} in
        d) SELECTED_DATASET=${OPTARG} ;;
        s) STEP_SIZE=${OPTARG} ;;
        m) MODE=${OPTARG} ;;
    esac
done                                                                                                                                                                                                                             # Nested if/else condion
if [ $MODE = "train" ]	# Compare string
then
    if [ $SELECTED_DATASET -eq 1 ]	# Compare number
    then    
		echo "[Double-Q] Training using family dataset"
        python main.py --datadir=datasets/family --exps_dir=exps/ --exp_name=family --num_step=$STEP_SIZE
    elif [ $SELECTED_DATASET -eq 2 ]
    then
        echo "[Double-Q] Training using kinship dataset"
        python main.py --datadir=datasets/kinship --exps_dir=exps/ --exp_name=kinship --num_step=$STEP_SIZE
    else
        echo "[Double-Q] Not support dataset."
    fi
elif [ $MODE = "eval" ]
then
    if [ $SELECTED_DATASET -eq 1 ]
    then
        echo "[Double-Q] Evaluating model in family dataset"
        python eval/get_truths.py datasets/family
    elif [ $SELECTED_DATASET -eq 2 ]
    then
        echo "[Double-Q] Evaluating model in kinship dataset"
        python eval/get_truths.py datasets/kinship
    else
        echo "[Double-Q] Not support dataset."
    fi
else
    echo "[Double-Q] Not support mode."
fi
