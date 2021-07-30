#!/usr/bin/env python

"""
运行分析的主程序
data.path结构见readme.md文件
"""


import os


config = {}


try:
    data_path = {config["S"]}
except:
    exit("请输入data.path文件")


bin_path = {config['bin_path']}
configfile = bin_path + '/test.yaml'



def mkdir(dirname):
    if os.path.exists(dirname):
        os.path.mkdirs(dirname)


####################################################
sample_info = {}


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

        sample_info[(sample, libid, lane)] = [fq1, fq2]
        