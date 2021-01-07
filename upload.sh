access_token=$(./refresh_token.sh)

while getopts ":d:r:f:" opt; do
  case $opt in
    d) local_dir="$OPTARG"
    ;;
    r) remote_dir_id="$OPTARG"
    ;;
    f) file="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

echo local_dir: $local_dir
echo remote_id: $remote_dir_id
echo file: $file

curl -X POST -L \
    -H "Authorization: Bearer $access_token" \
    -F "metadata={name :'$file', parents: ['$remote_dir_id']};type=application/json;charset=UTF-8" \
    -F "file=@$local_dir/$file" \
    "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart"
