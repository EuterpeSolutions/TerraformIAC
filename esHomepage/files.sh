#!/bin/sh

SRC="../../EuterpeSolutionsHomepage/dist"
TF_FILE="files.tf"
COUNT=0

#cat > $TF_FILE ''

find $SRC -iname '*.*' | while read path; do

    cat >> $TF_FILE << EOM

resource "aws_s3_bucket_object" "file_$COUNT" {
  bucket = "\${aws_s3_bucket.static_site.bucket}"
  key = "${path#$SRC}"
  source = "$path"
  content_type = "\${lookup(var.mime_types, "${path##*.}")}"
  etag = "\${md5(file("$path"))}"
}
EOM

    COUNT=$(expr $COUNT + 1)

done
