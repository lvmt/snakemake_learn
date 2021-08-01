#!/usr/bin/python
rule snpindel_call:
    input:
        bam = "{sample}/3.Mapping/{sample}.nodup.bam"
    params:
        bed = config['capture_bed'],  # 捕获芯片
        ref = config['ref'],
        projdir = config['O'],
        sample = "{sample}",
    output:
        raw_vcf = "{sample}/4.Mutation/SNP_INDEL/{sample}.raw.vcf.gz",
        filt_vcf = "{sample}/4.Mutation/SNP_INDEL/{sample}.filt.vcf.gz",
        snp_vcf = "{sample}/4.Mutation/SNP_INDEL/{sample}.snp.vcf.gz",
        indel_vcf = "{sample}/4.Mutation/SNP_INDEL/{sample}.indel.vcf.gz",
        log = "{sample}/4.Mutation/SNP_INDEL/{sample}.snp_indel.done"
    shell:
        """
        echo "start: snp indel calling" >> {output.log}

        cd {params.projdir}/{params.sample}/4.Mutation/SNP_INDEL/

        samtools-1.6 mpileup \\
            -l {params.bed} \\
            -q 1 -t DP,AD -C 50 -m 2 -F 0.002 -L 9999 -ugf \\
            {params.ref} \\
            {input.bam} |
        bcftools-1.6 call \\
            -g 5,10,30,50,100 \\
            -m |
        bcftools-1.6 vieww \\
            -e 'type!="SNP" && type!="INDEL" && format/DP<5' \\
            -Oz -o {output.raw_vcf}
        
        bcftools-1.6 index -tf {output.raw_vcf}

        # 对vcf文件进行过滤
        # filter QUAL DP MQ, keep GT=0/0; then normalize
        bcftools-1.6 filter \\
            -i '(%QUAL>20 && format/DP>4 && MQ>30) || (GT="0/0")' \\
            {output.raw_vcf} | filterXY - |
        bcftools-1.6 norm \\
            -m -both |
        bcftools-1.6 norm \\
            -f {params.ref} \\
            -m +both \\
            -Oz -o {output.filt_vcf}

        bcftools-1.6 index -tf {output.filt_vcf}

        # separate snp
        bcftools-1.6 filter \\
            -i '%TYPE="snp"' \\
            -Oz -o {output.snp_vcf} \\
            {output.filt_vcf}

        bcftools-1.6 index -tf {output.snp_vcf}

        # separate indel
        bcftools-1.6 filter \\
            -i '%TYPE="indel"' \\
            -Oz -o {output.indel_vcf} \\
            {output.snp_vcf}

        bcftools-1.6 index -tf {output.indel_vcf}


        echo "end: snp indel calling" >> {output.log}

        """



rule sv_call:
    input:
        bam = "{sample}/3.Mapping/{sample}.nodup.bam",
    params:
        sample = "{sample}",
        ref = config['ref']
    output:
        sv = "{sample}/4.Mutation/SV/{sample}.sv.xls",
        log = "{sample}/4.Mutation/SV/{sample}.sv.done"
    shell:
        """
        #使用lumpy进行sv calling
        echo lumpy call for {params.sample} start: `date "+%F %T"`\n

        cd {params.sample}/4.Mutation/SV
        python lumpy.py \\
            -b {input.bam} \\
            -r {params.ref} \\
            -o {params.sample}

        echo lumpy call for {params.sample} done 
        touch {output.log}

        """



rule cnv_call:
    input:
        bam = "{sample}/3.Mapping/{sample}.nodup.bam",
    params:
        sample = "{sample}",
        ref = config['ref']
    output:
        cnv = "{sample}/4.Mutation/CNV/{sample}.cnv.xls",
        log = "{sample}/4.Mutation/CNV/{sample}.cnv.done"
    shell:
        """
        cnv calling
        """
