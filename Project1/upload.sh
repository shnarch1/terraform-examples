#!/usr/bin/env bash

FILE_URL="https://drive.google.com/uc?authuser=0&id=15vQ7-utH7wBJzdAX3eDmO9ls35J5_sEQ&export=download-"
FILE="udacity-starter-website.zip"
DIR="udacity-starter-website"
BUCKET="schnarch-project1"

function download_site_files {
    if [ ! -f $FILE ]; then
        echo "### Start to download"
        wget $FILE_URL -O $FILE
    fi
}

function extract_zip {
    if [ ! -d $DIR ]; then
        echo "### Extracting ZIP file "
        unzip $FILE -d $DIR
    fi
}

function s3_upload { 
    echo "### Start upload process"
    aws s3 cp $DIR s3://$BUCKET --recursive
}

download_site_files
extract_zip
s3_upload

