work_dir=/data/projects/gdrive
refresh_token=$(jq -r .refresh_token $work_dir/gdrive_access.json)
client_id=$(jq -r .installed.client_id $work_dir/credentials.json)
client_secret=$(jq -r .installed.client_secret $work_dir/credentials.json)

get_access_token() {
  curl -X POST -L \
    -H "Host: oauth2.googleapis.com" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "client_id=$client_id" \
    -d "client_secret=$client_secret" \
    -d "refresh_token=$refresh_token" \
    -d "grant_type=refresh_token" \
    "https://oauth2.googleapis.com/token" | jq -r '.access_token'
}

access_token=$(get_access_token)
echo $access_token
