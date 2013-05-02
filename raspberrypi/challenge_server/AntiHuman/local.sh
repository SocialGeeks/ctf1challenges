#!/bin/bash
TMP=$(mktemp -d)
val=$(curl -c "${TMP}/cookie.txt" "http://localhost:3000" 2>/dev/null | cut -d">" -f17 | cut -d"<" -f1 | awk '{print $1+$3}')
curl --data-urlencode "val3=${val}" --cookie "${TMP}/cookie.txt" "http://localhost:3000" 2>/dev/null | cut -d":" -f2 | cut -d"<" -f1
rm -r ${TMP}

