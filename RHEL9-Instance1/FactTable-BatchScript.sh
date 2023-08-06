#!/bin/bash

currentDate=$(date +'%Y-%m-%d')
businessProcessPath="/root/BusinessProcess/BusinessProcess-"
incrementalField=$currentDate
fileType=".csv"
finalBusinessProcess=$businessProcessPath$incrementalField$fileType
echo "$finalBusinessProcess"
