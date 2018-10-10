import csv

with open('wohnlagen.csv', mode='r') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=';')
    line_count = 0
    for row in csv_reader:
        sql = "INSERT INTO bielefeld_wohnlagen VALUES(ST_GeomFromText('%s', 25832), %s, %s);" % (row['WKT'], row['gid'], row['lagequalit'])
        print(sql)
