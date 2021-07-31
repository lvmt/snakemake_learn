#!/usr/bin/python
rule fastp:
    input: 
        fq1 = lambda wildcards: sample_fq_dict[(wildcards.sample, wildcards.libid, wildcards.lane)][0],
        fq2 = lambda wildcards: sample_fq_dict[(wildcards.sample, wildcards.libid, wildcards.lane)][1],
    params:
        projdir = config['O'],
        sample = "{sample}",
    resources:
        mem_mb = 1000
    threads: 1
    benchmark:
        "benchmark/fastp.{sample}_{libid}_{lane}"
    output: 
        log = "{sample}/2.QC/{sample}_{libid}_{lane}.log",
        raw1 = "{sample}/1.RawData/{sample}_{libid}_L{lane}_1.fq.gz",
        raw2 = "{sample}/1.RawData/{sample}_{libid}_L{lane}_2.fq.gz",
        clean1 = "{sample}/2.QC/{sample}_{libid}_L{lane}_1.clean.fq.gz",
        clean2 = "{sample}/2.QC/{sample}_{libid}_L{lane}_2.clean.fq.gz",
    shell: 
        """
        ## 数据软链
        mkdir -p {params.sample}/1.RawData/
        cd {params.projdir}/{params.sample}/1.RawData
        ln -sf {input.fq1} {output.raw1}
        ln -sf {input.fq2} {output.raw2}

        ## 数据质控
        mkdir -p {params.sample}/2.QC
        cd {params.projdir}/{params.sample}/2.QC

        fastp \\
            -i {output.raw1} \\
            -I {output.raw2} \\
            -o {output.clean1} \\
            -O {output.clean2} \\
            -j {output.clean1}.fastp.json \\
            -h {output.clean1}.fastp.html \\
            -q 5 -u 50 -n 15 -l PE \\
            -w 4

        ## 计算clean data MD5值
        for fq in `ls *clean.fq.gz`;
        do
            md5sum $i | unix2dos >> MD5.txt
        done

        """
