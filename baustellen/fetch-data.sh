#! /bin/bash

rm -rf baustellen.csv baustellen-data.sql

wget "https://www.bielefeld01.de/md/WFS/baustellen_opendata/02?SERVICE=WFS&VERSION=1.1.0&REQUEST=GetFeature&TYPENAME=baustellen_opendata_p&SRSNAME=EPSG:25832&OUTPUTFORMAT=text/csv&NW_INFO=/baustellen_opendata_p_EPSG25832_CSV.csv" -O baustellen.csv

python3 csv2sql.py > baustellen-data.sql

psql gis < baustellen-schema.sql
psql gis < baustellen-data.sql

