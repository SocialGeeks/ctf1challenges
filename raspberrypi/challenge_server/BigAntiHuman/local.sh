#!/bin/bash

tmp=$(mktemp -d)
equ=$(curl -c "${tmp}/cookie.txt" "http://localhost:3000" 2>/dev/null | cut -d">" -f17 | cut -d"<" -f1)

top=$[ ${equ:0:12} + ${equ:27:12} ]
bot=$[ ${equ:12:12} + ${equ:39:12} ]

if [ ${#bot} -gt 12 ]; then
  bot=${bot:1:12}
  top=$[$top + 1]
fi

curl --cookie "${tmp}/cookie.txt" --data-urlencode "val3=${top}${bot}" "http://localhost:3000" 2>/dev/null | cut -d":" -f2 | cut -d"<" -f1

