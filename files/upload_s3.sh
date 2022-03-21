#!/bin/bash

file_to_upload=$1

filename=${file_to_upload##*/}

bucket="tchap-stats-metabase"
s3path="/${bucket}/${file_to_upload}"

# metadata
contentType="text/csv"
dateValue=`date -R`
signature_string="PUT\n\n${contentType}\n${dateValue}\n${s3path}"

#prepare signature hash to be sent in Authorization header
signature_hash=`echo -en ${signature_string} | openssl sha1 -hmac ${S3SECRET} -binary | base64`

destination="https://tchap-stats-metabase.s3.gra.cloud.ovh.net/${filename}"
echo $destination

# actual curl command to do PUT operation on s3
curl -k -X PUT -T "${file_to_upload}" \
  -H "Date: ${dateValue}" \
  -H "Content-Type: ${contentType}" \
  -H "Authorization: AWS ${S3ACCESS}:${signature_hash}" \
  $destination
