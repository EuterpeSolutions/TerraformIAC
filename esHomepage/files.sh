#!/bin/sh

SRC="../../EuterpeSolutionsHomepage"
DIST_SRC="../../EuterpeSolutionsHomepage/dist"
TF_FILE="files.tf"
COUNT=0

cat > $TF_FILE ''

echo "Building the angular components"
cd $SRC
ng build
cd -
echo "Returning to terraform config directory..."

find $DIST_SRC -iname '*.*' | while read path; do

    cat >> $TF_FILE << EOM

resource "aws_s3_bucket_object" "file_$COUNT" {
  bucket = "\${aws_s3_bucket.static_site.bucket}"
  key = "${path#$DIST_SRC}"
  source = "$path"
  content_type = "\${lookup(var.mime_types, "${path##*.}")}"
  etag = "\${md5(file("$path"))}"
}
EOM

    COUNT=$(expr $COUNT + 1)

done
