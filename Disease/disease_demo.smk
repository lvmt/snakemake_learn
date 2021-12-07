#!/usr/bin/env python

"""
运行分析的主程序
data.path结构见readme.md文件
"""


import os
from collections import defaultdict





try:
    data_path = config["S"]
except:
    exit("请输入data.path文件")


# bin_path = {config['bin_path']}
configfile: 'yaml/database.yaml'




def mkdir(dirname):
    if os.path.exists(dirname):
        os.path.mkdirs(dirname)


####################################################
projdir = config['O']
sample_fq_dict = {}
sample_info = []
# 记录每个样本对应的bam列表，用于后续合并
sample_bam_list_info = defaultdict(list)
sample_bam_count = {}

with open(data_path, 'r') as fr:
    for line in fr:
        if line.startswith('#'):
            continue
        linelist = line.strip().split('\t')
        sample = linelist[0]
        libid = linelist[1]
        lane = linelist[2]
        fq1 = linelist[3]
        fq2 = linelist[4]

        sample_fq_dict[(sample, libid, lane)] = [fq1, fq2]
        sample_info.append([sample, libid, lane])
        sort_bam = '{sample}/3.Mapping/{sample}_{libid}_L{lane}.sort.bam'.format(**locals())
        sample_bam_list_info[sample].append(sort_bam)
        




#######################################
for sam in sample_bam_list_info:
    if len(sample_bam_list_info[sam]) > 1:
        sample_bam_count[sam] = "more"
    else:
        sample_bam_count[sam] = "single"


# print(sample_fq_dict)
# print(sample_bam_count)
# print(sample_bam_list_info)

#####################################################
########### 获取指定分析的步骤或者指定样本 #############
SAMPLES = [item[0] for item in sample_info] 
def get_final_result(): 
    analysis_steps = config['step'].split(',')
    result_list = set()

    for step in analysis_steps:
        result_suffix = config['result_suffix'][config['analysis'][step]]        
        result_dir = config['result_dir'][config['analysis'][step]]   

        for sample in SAMPLES:
            result_list.add('{sample}/{result_dir}/{sample}.{result_suffix}'.format(**locals()))

    return result_list


all_result = get_final_result()
print('\033[1;32mall_result: \033[0m', all_result)

############################################
rule allDone:
    input:
        all_result
        # snp_indel = ["{sample}/6.Filter/SNP_INDEL/{sample}.filter.done".format(**locals()) for (sample, libid, lane) in sample_info],
        # sv = ["{sample}/6.Filter/SV/{sample}.filter.done".format(**locals()) for (sample, libid, lane) in sample_info],
        # cnv = ["{sample}/6.Filter/CNV/{sample}.filter.done".format(**locals()) for (sample, libid, lane) in sample_info]
    output:
        log = "all.done",
        result = "Result.zip"
    benchmark:
        "benchmark/all.done"
    resources:
        mem_mb = 100
    threads: 1
    shell:
        """
        echo "done"
        """



######################################
include: "rules/QC.smk"
include: "rules/Mapping.smk"
include: "rules/Markdup.smk"
include: "rules/Mutation.smk"
include: "rules/Annotation.smk"
include: "rules/Filter.smk"
 