#!/bin/bash

access_token=$(./refresh_token.sh)
upload_type=multipart

while getopts ":d:r:f:t:" opt; do
  case $opt in
    d) local_dir="$OPTARG"
    ;;
    r) remote_dir_id="$OPTARG"
    ;;
    f) file="$OPTARG"
    ;;
    t) upload_type="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

echo local_dir: $local_dir
echo remote_id: $remote_dir_id
echo file: $file
echo upload_type: $upload_type

curl -X POST -L \
    -H "Authorization: Bearer $access_token" \
    -F "metadata={name :'$file', parents: ['$remote_dir_id']};type=application/json;charset=UTF-8" \
    -F "file=@$local_dir/$file" \
    "https://www.googleapis.com/upload/drive/v3/files?uploadType=$upload_type"
