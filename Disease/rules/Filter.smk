#!/usr/bin/python3
rule snp_indel_filter:
    input:
        snp_anno = "{sample}/5.Annotation/SNP_INDEL/{sample}.snp.anno.xls",
        indel_anno = "{sample}/5.Annotation/SNP_INDEL/{sample}.indel.anno.xls",
        log = "{sample}/5.Annotation/SNP_INDEL/{sample}.anno.done"
    params:
        sample = "{sample}"
    output:
        snp_filter = "{sample}/6.Filter/SNP_INDEL/{sample}.snp.xls",
        indel_filter = "{sample}/6.Filter/SNP_INDEL/{sample}.indel.xls",
        log = "{sample}/6.Filter/SNP_INDEL/{sample}.filter.done"
    shell:
        """
        echo snp and indel filter 

        {input.log}

        touch {output.log}
        """



rule sv_filter:
    input:
        sv_anno = "{sample}/5.Annotation/SV/{sample}.sv.xls",
        log = "{sample}/5.Annotation/SV/{sample}.anno.done"
    params:
        sample = "{sample}"
    output:
        sv_filter = "{sample}/6.Filter/SV/{sample}.sv.xls",
        log = "{sample}/6.Filter/SV/{sample}.filter.done"
    shell:
        """
        echo sv filter

        {input.log}

        touch {output.log}
        """



rule cnv_filter:
    input:
        cnv_anno = "{sample}/5.Annotation/CNV/{sample}.cnv.xls",
        log = "{sample}/5.Annotation/CNV/{sample}.anno.done"
    params:
        sample = "{sample}"
    output:
        cnv_filter = "{sample}/6.Filter/CNV/{sample}.cnv.xls",
        log = "{sample}/6.Filter/CNV/{sample}.filter.done"
    shell:
        """
        echo cnv filter  

        {input.log}

        touch {output.log}
        """
    

