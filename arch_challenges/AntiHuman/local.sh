#!/bin/bash
targ="http://localhost:3000"
val=$[$(curl -c "cookie.txt" "${targ}" 2> /dev/null | cut -d'>' -f18 | cut -d'<' -f1)]
curl --data-urlencode "val3=${val}" --cookie "cookie.txt" "${targ}" 2> /dev/null | cut -d":" -f2 | cut -d"<" -f1
