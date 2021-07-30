rule fastp:
    input: 
        fq1 = lambda wildcards: sample_info[(wildcards.sample, wildcards.libid, wildcards.lane)][0],
        fq2 = lambda wildcards: sample_info[(wildcards.sample, wildcards.libid, wildcards.lane)][1],
    params:
        sample = "{sample}",
        libid = "{libid}",
        lane = "{lane}",
    resources:
        mem_mb = 1000
    threads: 1
    benchmark:
        "benchmark/fastp.{sample}_{libid}_{lane}"
    output: 
        log = "{sample}/2.QC/{sample}_{libid}_lane.done",
        clean1 = "{sample}/2.QC/{sample}_{libid}_L{lane}_1.clean.fq.gz",
        clean2 = "{sample}/2.QC/{sample}_{libid}_L{lane}_2.clean.fq.gz",
    run: 
        """
        ## 数据软链
        mkdir -p {sample}/3.RawData/
        cd {projdir}/{sample}/RawData
        ln -sf {path}/{libid}/{libid}_L{lane}_1.fq.gz {sample}/RawData/{sample}_{libid}_L{lane}_1.fq.gz 
        ln -sf {path}/{libid}/{libid}_L{lane}_2.fq.gz {sample}/RawData/{sample}_{libid}_L{lane}_2.fq.gz 
        ln -sf {path}/{libid}/{libid}_L{lane}_1.adapter.list.gz {sample}/RawData/{sample}_{libid}_L{lane}_1.adapter.list.gz 
        ln -sf {path}/{libid}/{libid}_L{lane}_2.adapter.list.gz {sample}/RawData/{sample}_{libid}_L{lane}_2.adapter.list.gz 

        ## 数据质控
        mkdir -p {sample}/2.QC
        cd {projdir}/{sample}/2.QC

        fastp \\
            -i ../1.RawData/{sample}_{libid}_L{lane}_1.fq.gz \\
            -I ../1.RawData/{sample}_{libid}_L{lane}_2.fq.gz \\
            -o {sample}_{libid}_L{lane}_1.clean.fq.gz \\
            -O {sample}_{libid}_L{lane}_1.clean.fq.gz \\
            -j {sample}_{libid}_L{lane}_1.clean.fastp.json \\
            -h {sample}_{libid}_L{lane}_1.clean.fastp.html \\
            -q 5 -u 50 -n 15 -l {PE} \\
            -w 4

        ## 计算clean data MD5值
        for fq in `ls *clean.fq.gz`;
        do
            md5sum $i | unix2dos >> MD5.txt
        done

        """
