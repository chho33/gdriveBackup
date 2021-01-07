## Prerequisite 
- Create Application, get client id and client secret, store the file as `credentials.json`
- Authorize Google Drive
- Get Refresh Token, store the file as `gdrive_access.json`

## Use
```
./upload.sh -d $dir_path -f $filename -r $gdrive_dir_id -t $upload_type
```

`$dir_path`: local directory for file(s)

`$filename`: file(s) would like to upload

`$gdrive_dir_id`: directory id on google drive, find it by the tail of the url of target directory. 

`$upload_type`: see https://developers.google.com/drive/api/v3/manage-uploads for detail
