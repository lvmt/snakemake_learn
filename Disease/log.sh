Building DAG of jobs...
Job stats:
job        count    min threads    max threads
-------  -------  -------------  -------------
allDone        1              1              1
fastp         11              1              1
total         12              1              1


[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L01/V350018734_L01_1025_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L01/V350018734_L01_1025_2.fq.gz
    output: yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_1.log, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350018734_L1_1.fq.gz, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350018734_L1_2.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_L1_1.clean.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_L1_2.clean.fq.gz
    jobid: 10
    benchmark: benchmark/fastp.yanxuewu-BM.yanxuewu-BM_V350018734_1
    wildcards: sample=yanxuewu-BM.yanxuewu-BM, libid=V350018734, lane=1
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180017/V350018749/L01/V350018749_L01_1100_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180017/V350018749/L01/V350018749_L01_1100_2.fq.gz
    output: yangshiliang-3.yangshiliang-3/2.QC/yangshiliang-3.yangshiliang-3_V350018749_1.log, yangshiliang-3.yangshiliang-3/1.RawData/yangshiliang-3.yangshiliang-3_V350018749_L1_1.fq.gz, yangshiliang-3.yangshiliang-3/1.RawData/yangshiliang-3.yangshiliang-3_V350018749_L1_2.fq.gz, yangshiliang-3.yangshiliang-3/2.QC/yangshiliang-3.yangshiliang-3_V350018749_L1_1.clean.fq.gz, yangshiliang-3.yangshiliang-3/2.QC/yangshiliang-3.yangshiliang-3_V350018749_L1_2.clean.fq.gz
    jobid: 3
    benchmark: benchmark/fastp.yangshiliang-3.yangshiliang-3_V350018749_1
    wildcards: sample=yangshiliang-3.yangshiliang-3, libid=V350018749, lane=1
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L03/V350014341_L03_1028_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L03/V350014341_L03_1028_2.fq.gz
    output: yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_3.log, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350014341_L3_1.fq.gz, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350014341_L3_2.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_L3_1.clean.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_L3_2.clean.fq.gz
    jobid: 5
    benchmark: benchmark/fastp.yanxuewu-BL.yanxuewu-BL_V350014341_3
    wildcards: sample=yanxuewu-BL.yanxuewu-BL, libid=V350014341, lane=3
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L02/V350018734_L02_1026_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L02/V350018734_L02_1026_2.fq.gz
    output: yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_2.log, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350018734_L2_1.fq.gz, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350018734_L2_2.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_L2_1.clean.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_L2_2.clean.fq.gz
    jobid: 7
    benchmark: benchmark/fastp.yanxuewu-BL.yanxuewu-BL_V350018734_2
    wildcards: sample=yanxuewu-BL.yanxuewu-BL, libid=V350018734, lane=2
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L03/V350014341_L03_1028_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L03/V350014341_L03_1028_2.fq.gz
    output: yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_3.log, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350014341_L3_1.fq.gz, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350014341_L3_2.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_L3_1.clean.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_L3_2.clean.fq.gz
    jobid: 9
    benchmark: benchmark/fastp.yanxuewu-BM.yanxuewu-BM_V350014341_3
    wildcards: sample=yanxuewu-BM.yanxuewu-BM, libid=V350014341, lane=3
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L02/V350018734_L02_1025_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L02/V350018734_L02_1025_2.fq.gz
    output: yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_2.log, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350018734_L2_1.fq.gz, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350018734_L2_2.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_L2_1.clean.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_L2_2.clean.fq.gz
    jobid: 11
    benchmark: benchmark/fastp.yanxuewu-BM.yanxuewu-BM_V350018734_2
    wildcards: sample=yanxuewu-BM.yanxuewu-BM, libid=V350018734, lane=2
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180017/V350018749/L01/V350018749_L01_1004_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180017/V350018749/L01/V350018749_L01_1004_2.fq.gz
    output: siyaolitu-2.siyaolitu-2/2.QC/siyaolitu-2.siyaolitu-2_V350018749_1.log, siyaolitu-2.siyaolitu-2/1.RawData/siyaolitu-2.siyaolitu-2_V350018749_L1_1.fq.gz, siyaolitu-2.siyaolitu-2/1.RawData/siyaolitu-2.siyaolitu-2_V350018749_L1_2.fq.gz, siyaolitu-2.siyaolitu-2/2.QC/siyaolitu-2.siyaolitu-2_V350018749_L1_1.clean.fq.gz, siyaolitu-2.siyaolitu-2/2.QC/siyaolitu-2.siyaolitu-2_V350018749_L1_2.clean.fq.gz
    jobid: 1
    benchmark: benchmark/fastp.siyaolitu-2.siyaolitu-2_V350018749_1
    wildcards: sample=siyaolitu-2.siyaolitu-2, libid=V350018749, lane=1
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180017/V350018749/L01/V350018749_L01_1002_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180017/V350018749/L01/V350018749_L01_1002_2.fq.gz
    output: wangwangfeng-3.wangwangfeng-3/2.QC/wangwangfeng-3.wangwangfeng-3_V350018749_1.log, wangwangfeng-3.wangwangfeng-3/1.RawData/wangwangfeng-3.wangwangfeng-3_V350018749_L1_1.fq.gz, wangwangfeng-3.wangwangfeng-3/1.RawData/wangwangfeng-3.wangwangfeng-3_V350018749_L1_2.fq.gz, wangwangfeng-3.wangwangfeng-3/2.QC/wangwangfeng-3.wangwangfeng-3_V350018749_L1_1.clean.fq.gz, wangwangfeng-3.wangwangfeng-3/2.QC/wangwangfeng-3.wangwangfeng-3_V350018749_L1_2.clean.fq.gz
    jobid: 2
    benchmark: benchmark/fastp.wangwangfeng-3.wangwangfeng-3_V350018749_1
    wildcards: sample=wangwangfeng-3.wangwangfeng-3, libid=V350018749, lane=1
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L02/V350014341_L02_1028_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L02/V350014341_L02_1028_2.fq.gz
    output: yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_2.log, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350014341_L2_1.fq.gz, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350014341_L2_2.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_L2_1.clean.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_L2_2.clean.fq.gz
    jobid: 4
    benchmark: benchmark/fastp.yanxuewu-BL.yanxuewu-BL_V350014341_2
    wildcards: sample=yanxuewu-BL.yanxuewu-BL, libid=V350014341, lane=2
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L01/V350018734_L01_1026_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/V100400180032/V350018734/L01/V350018734_L01_1026_2.fq.gz
    output: yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_1.log, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350018734_L1_1.fq.gz, yanxuewu-BL.yanxuewu-BL/1.RawData/yanxuewu-BL.yanxuewu-BL_V350018734_L1_2.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_L1_1.clean.fq.gz, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_L1_2.clean.fq.gz
    jobid: 6
    benchmark: benchmark/fastp.yanxuewu-BL.yanxuewu-BL_V350018734_1
    wildcards: sample=yanxuewu-BL.yanxuewu-BL, libid=V350018734, lane=1
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule fastp:
    input: /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L02/V350014341_L02_1028_1.fq.gz, /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180034/V350014341/L02/V350014341_L02_1028_2.fq.gz
    output: yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_2.log, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350014341_L2_1.fq.gz, yanxuewu-BM.yanxuewu-BM/1.RawData/yanxuewu-BM.yanxuewu-BM_V350014341_L2_2.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_L2_1.clean.fq.gz, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_L2_2.clean.fq.gz
    jobid: 8
    benchmark: benchmark/fastp.yanxuewu-BM.yanxuewu-BM_V350014341_2
    wildcards: sample=yanxuewu-BM.yanxuewu-BM, libid=V350014341, lane=2
    resources: tmpdir=/tmp, mem_mb=1000

[Sat Jul 31 12:42:50 2021]
rule allDone:
    input: siyaolitu-2.siyaolitu-2/2.QC/siyaolitu-2.siyaolitu-2_V350018749_1.log, siyaolitu-2.siyaolitu-2/2.QC/siyaolitu-2.siyaolitu-2_V350018749_1.log, wangwangfeng-3.wangwangfeng-3/2.QC/wangwangfeng-3.wangwangfeng-3_V350018749_1.log, wangwangfeng-3.wangwangfeng-3/2.QC/wangwangfeng-3.wangwangfeng-3_V350018749_1.log, yangshiliang-3.yangshiliang-3/2.QC/yangshiliang-3.yangshiliang-3_V350018749_1.log, yangshiliang-3.yangshiliang-3/2.QC/yangshiliang-3.yangshiliang-3_V350018749_1.log, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_2.log, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350014341_3.log, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_1.log, yanxuewu-BL.yanxuewu-BL/2.QC/yanxuewu-BL.yanxuewu-BL_V350018734_2.log, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_2.log, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350014341_3.log, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_1.log, yanxuewu-BM.yanxuewu-BM/2.QC/yanxuewu-BM.yanxuewu-BM_V350018734_2.log
    output: all.done, Result.zip
    jobid: 0
    benchmark: benchmark/all.done
    resources: tmpdir=/tmp, mem_mb=100


        echo "done"
        
Job stats:
job        count    min threads    max threads
-------  -------  -------------  -------------
allDone        1              1              1
fastp         11              1              1
total         12              1              1

This was a dry-run (flag -n). The order of jobs does not reflect the order of execution.
