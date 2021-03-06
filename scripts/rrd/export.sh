#!/usr/bin/env bash

if [ -f /etc/lflmonitor/app.cfg ]; then
  source '/etc/lflmonitor/app.cfg'
else
  source './app.cfg.example'
fi

rrdtool xport --showtime -s now-3h -e now --step 300 \
DEF:a=$RRD_PATH:vbattery:AVERAGE \
DEF:b=$RRD_PATH:vpanel:AVERAGE \
XPORT:a:"Battery" \
XPORT:b:"Panel" > $XML_PATH/voltage3h.xml

rrdtool xport --showtime -s now-24h -e now --step 300 \
DEF:a=$RRD_PATH:vbattery:AVERAGE \
DEF:b=$RRD_PATH:vpanel:AVERAGE \
XPORT:a:"Battery" \
XPORT:b:"Panel" > $XML_PATH/voltage24h.xml

rrdtool xport --showtime -s now-48h -e now --step 300 \
DEF:a=$RRD_PATH:vbattery:AVERAGE \
DEF:b=$RRD_PATH:vpanel:AVERAGE \
XPORT:a:"Battery" \
XPORT:b:"Panel" > $XML_PATH/voltage48h.xml

rrdtool xport --showtime -s now-1w -e now --step 600 \
DEF:a=$RRD_PATH:vbattery:AVERAGE \
DEF:b=$RRD_PATH:vpanel:AVERAGE \
XPORT:a:"Battery" \
XPORT:b:"Panel" > $XML_PATH/voltage1w.xml

rrdtool xport --showtime -s now-1month -e now --step 1800 \
DEF:a=$RRD_PATH:vbattery:AVERAGE \
DEF:b=$RRD_PATH:vpanel:AVERAGE \
XPORT:a:"Battery" \
XPORT:b:"Panel" > $XML_PATH/voltage1M.xml

rrdtool xport --showtime -s now-3month -e now --step 3600 \
DEF:a=$RRD_PATH:vbattery:AVERAGE \
DEF:b=$RRD_PATH:vpanel:AVERAGE \
XPORT:a:"Battery" \
XPORT:b:"Panel" > $XML_PATH/voltage3M.xml

rrdtool xport --showtime -s now-1y -e now --step 7200 \
DEF:a=$RRD_PATH:vbattery:AVERAGE \
DEF:b=$RRD_PATH:vpanel:AVERAGE \
XPORT:a:"Battery" \
XPORT:b:"Panel" > $XML_PATH/voltage1y.xml