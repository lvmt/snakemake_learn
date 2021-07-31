#!/usr/bin/python
rule map:
    input:
        done = "{sample}/2.QC/{sample}_{libid}_{lane}.done",
        clean1 = "{sample}/2.QC/{sample}_{libid}_L{lane}_1.clean.fq.gz",
        clean2 = "{sample}/2.QC/{sample}_{libid}_L{lane}_2.clean.fq.gz",
    params:
        projdir = {config['O']},
        sample = "{sample}",
        libid = "{libid}",
        lane = "{lane}",
        ref = {config['ref']}
    resources:
        mem_mb = 5000
    threads: 2
    benchmark:
        "benchmark/map.{sample}_{libid}_{lane}"
    output:
        log = "{sample}/3.Mapping/map.{sample}_{libid}_{lane}.done",
        raw_bam = "{sample}/3.Mapping/{sample}_{libid}_L{lane}.raw.bam",
        sort_bam = "{sample}/3.Mapping/{sample}_{libid}_L{lane}.sort.bam",
    shell:
        """
        set -eo pipefail
        cd   {params.projdir}/{params.sample}/3.Mapping/
        
        ## 比对
        bwa mem \\
            -t {threads} -M \\
            -R '@RG\\tID:{params.sample}_{params.libid}_L{params.lane}\\tSM:{params.sample}\\tLB:{params.sample}\\tPU:{params.sample}_{params.libid}_L{params.lane}' \\
            {params.ref} \\
            {input.clean1} {input.clean2} |
        samtools view \\
            -b -S \\
            -t {params.ref}.fai \\
            -o {output.raw_bam} 

        
        ## 排序
        sambamba sort \\
        -m 4G \\
        --tmpdir {output.raw_bam}.tmp \\
        -o {output.sort_bam} \\
        {output.raw_bam}  

        touch {output.log}

        """