#! /usr/bin/env python3

import sys
import csv
import json
import geojson
import shapely.wkt
from functools import partial
import pyproj
from shapely.ops import transform

project = partial(
    pyproj.transform,
    pyproj.Proj(init='epsg:25832'), # source coordinate system
    pyproj.Proj(init='epsg:4326')) # destination coordinate system

features = []
with sys.stdin as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=';')
    for row in csv_reader:
        properties = {}
        for key in row:
            if key == "WKT":
                geometry = shapely.wkt.loads(row["WKT"])
            else:
                properties[key] = row[key]
        feature = geojson.Feature(geometry=transform(project,geometry), properties=properties)
        features.append(feature)

featurecollection = { "type": "FeatureCollection", "features": features }

print(json.dumps(featurecollection))
