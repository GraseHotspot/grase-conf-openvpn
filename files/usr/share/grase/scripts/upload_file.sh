#!/bin/bash

UPFILE="$1"
UPHOST="$2"
UPURL="$3"

UPFILECONTENTS=$(cat $UPFILE)

CONTENT=$( cat <<EQRST
-----------------------------7552901051828930864785583031
Content-Disposition: form-data; name="upfile"; filename="$UPFILE"
Content-Type: application/octet-stream

$UPFILECONTENTS

-----------------------------7552901051828930864785583031--
EQRST
)

CONTENT_LENGTH=${#CONTENT}

POSTDATA=$(cat <<EOC
POST $UPURL HTTP/1.1
Host: $UPHOST:80
User-Agent: File Uploader NC
Accept: text/plain
Accept-Language: en-us,en;q=0.5
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
Connection: Close
Referer: http://hotspot.purewhite.id.au/ncuploader
Content-Type: multipart/form-data; boundary=---------------------------7552901051828930864785583031
Content-Length: $CONTENT_LENGTH

$CONTENT
 
EOC
)

#echo "$CONTENT"
echo "$POSTDATA" | /bin/nc -q 5 -C $UPHOST 80|egrep "^  "

