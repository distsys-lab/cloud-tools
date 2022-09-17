from pprint import pp
from re import A
from wsgiref.handlers import read_environ
import pandas as pd
import os
import csv
from pprint import pprint
"""
path = "./cross-exp/data/aws-inter-region-rtt/csv"
folders = os.listdir(path)
df=[]
for i in folders:56
    df=pd.read_csv(path+"/"+i)
    print(df[2:5])
"""
path = "./cross-exp/data/aws-inter-region-rtt/csv"
folders = os.listdir(path)
row_lists=[]
for i in folders:
    with open(path+'/'+i, newline='') as f:
        reader = csv.reader(f, delimiter=' ')
        row_lists.append([row[0].split(',') for row in reader])
        #pprint(row_lists)


for i in range(1,16):
    for j in range(1,16):
        sum=0
        cnt=0 
        for l in row_lists:
            if (l[i][j] != "-nan" or l[i][j] != ''):
                print(l)
                sum+=float(l[i][j])
                cnt+=1
        print(sum/cnt, end=',')
    print()