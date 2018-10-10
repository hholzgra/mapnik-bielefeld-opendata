#! /bin/bash

rm -rf wohnlagen.csv wohnlagen-data.sql

wget "http://www.bielefeld01.de/md/WFS/wohnlagenkarte/01?SERVICE=WFS&VERSION=1.1.0&REQUEST=GetFeature&TYPENAME=wohnlagenkarte_pl&SRSNAME=EPSG:25832&OUTPUTFORMAT=text/csv&NW_INFO=/wohnlagenkarte_pl_EPSG25832_CSV.csv" -O wohnlagen.csv

python3 csv2sql.py > wohnlagen-data.sql

psql gis < wohnlagen-schema.sql
psql gis < wohnlagen-data.sql

