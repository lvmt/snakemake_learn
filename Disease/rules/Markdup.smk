#!/usr/bin/python
rule markdup:
    input:
        sort_bam = lambda wildcards: sample_bam_list_info[wildcards.sample][0],
        bam_list = lambda wildcards: sample_bam_list_info[wildcards.sample],
    params:
        projdir = config['O'],
        bam_count = lambda wildcards: sample_bam_count[wildcards.sample],  # 这个为什么不能放在input？
    output:
        merge_bam = "{sample}/3.Mapping/{sample}.merge.bam",
        nodup_bam = "{sample}/3.Mapping/{sample}.nodup.bam",
        log = "{sample}/3.Mapping/markdup.{sample}.done"
    shell:
        """
        ## 不同文库的bam合并
        if [ '{params.bam_count}' == 'single']
        then
            mv {input.sort_bam} {output.merge_bam} 
            sambamba index {output.merge_bam}
        else
            sambamba merge \\
            {output.merge_bam} \\
            {input.bam_list}
            sambamba index {output.merge_bam}
        fi


        ## markdup 标记重复
        sambamba markdup \\
            -t 8 \\
            --overflow-list-size=10000000 \\
            --tmpdir={output.merge_bam}.tmp \\
            {output.merge_bam} \\
            {output.nodup_bam}

        sambamba index {output.nodup_bam}

        touch {output.log}

        """