#!/usr/bin/python3  

"""
hla分析主程序
"""


import sys
import pandas as pd 
from collections import defaultdict



# 输入文件为生产提供的excel表格
## 生成samid文件
samid = config["O"] + "/" + config["suffix"] + ".samid"   # 后续优化的时候，将分期更改为suffix
fqlist = config["O"] + "/" + config["suffix"] + ".fqlist"
suffix = config["suffix"] 

excel_values = pd.read_excel(config["S"], skiprows=2).values 

with open(samid, 'w') as fw:
    for item in excel_values:
        item = [str(x) for x in item]
        name = item[3]
        fw.write('{}\n'.format('\t'.join(item[:-1])))

    
## 根据samid文件，生成fqlist文件
fq_dict = {}
with open(samid, 'r') as fr:
    suffix = '/ifs9/zebra/MGISEQ-2000'
    for line in fr:
        linelist = line.strip().split('\t')
        machineid = linelist[0]
        chip = linelist[1]
        lane = linelist[2]
        library = linelist[3] # 21GSK830-12
        num = library.split('-')[-1]  
        fq1 = '{suffix}/{machineid}/{chip}/{lane}/{chip}_{lane}_{num}_1.fq.gz'.format(**locals())
        fq2 = fq1.replace("1.fq.gz", "2.fq.gz")

        fq_dict[library] = [fq1, fq2]


with open(fqlist, 'w') as fw:
    for fq1, fq2 in fq_dict.values():
        fw.write('{}\n'.format(fq1))


####################################################################
print(fq_dict)


###################获取全部样本，全部文库信息#############################
########################################################################
sams = ['L' + str(item).rjust(3, '0') for item in range(1, 97)]
librarys = fq_dict.keys()


#===================================================
#===================================================
        

rule allDone:
    input:
        # result = ['{0}/fastq/{1}/type.result.final'.format(library, sam) for library in fq_dict.keys() for sam in sams]
        log =  "step5.done.log"
    output:
        log = "all.done",
        result = "result.zip"


# include: "QC.smk"
# include: "split_data.smk"


include: "step1_filter.smk"
include: "step2_hla_analysis.smk"
include: "step3_cat_library_result.smk"
include: "step4_merge_all_result.smk"
include: "step5_final_handle.smk"