import csv
# this program is used to change the state name to number according to FIPS Code
csvfile1 = open('FIPS_Code.csv',encoding='utf-8')
fips = csv.reader(csvfile1)
state_code_list = []
for row in fips:
    state_code_list.append(row)

csvfile2 = open('tw_od_2020_state.csv', encoding='utf-8')
data = csv.reader(csvfile2)

out = open("tw_od_2020_state2.csv", "w", newline="")

for row in data:
    name = row[0]
    for state_code in state_code_list:
        if name == state_code[0]:
            row[0] = state_code[1]
            break
    name = row[1]
    for state_code in state_code_list:
        if name == state_code[0]:
            row[1] = state_code[1]
            csv_writer = csv.writer(out, dialect="excel")
            csv_writer.writerow(row)
csvfile1.close()
csvfile2.close()
out.close()

