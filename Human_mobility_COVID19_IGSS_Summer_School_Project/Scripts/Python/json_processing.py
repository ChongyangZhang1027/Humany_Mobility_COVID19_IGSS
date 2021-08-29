
# this program is used to convert the inflow and outflow population from text to json

file1 = open("tw_2020_out.txt", 'r')
flow = file1.readlines()

file2 = open("us-states.js", 'r')
json_file = file2.readlines()

file3 = open("tw_2020_out.js", 'w')

n = 0
for line in json_file:
    if n == 0 or n == 53:
        file3.write(line)
        n = n + 1
    else:
        items = line.split(',')
        density_total = items[3]
        items[3] = '"density":' + flow[n-1].strip('\n') + '}'
        line1 = ','.join(items)
        file3.write(line1)
        n = n + 1
file1.close()
file2.close()
file3.close()