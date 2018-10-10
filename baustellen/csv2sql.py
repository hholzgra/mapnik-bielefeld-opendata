import csv

with open('baustellen.csv', mode='r', encoding='latin1') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=';')
    line_count = 0
    for row in csv_reader:
        sql = "INSERT INTO bielefeld_baustellen VALUES(ST_GeomFromText('%s', 25832));" % (row['WKT'])
        print(sql)
