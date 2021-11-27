#!/usr/bin/python
rule snp_indel_anno:
    input:
        snp_vcf = "{sample}/4.Mutation/SNP_INDEL/{sample}.snp.vcf.gz",
        indel_vcf = "{sample}/4.Mutation/SNP_INDEL/{sample}.indel.vcf.gz",
        log = "{sample}/4.Mutation/SNP_INDEL/{sample}.snp_indel.done"
    params:
        sample = "{sample}",
    output:
        snp_anno = "{sample}/5.Annotation/SNP_INDEL/{sample}.snp.anno.xls",
        indel_anno = "{sample}/5.Annotation/SNP_INDEL/{sample}.indel.anno.xls",
        log = "{sample}/5.Annotation/SNP_INDEL/{sample}.anno.done"
    shell:
        """
        echo snp and indel anno

        use {input.snp_vcf} {input.indel_vcf}
        touch {output.log}

        """



rule sv_anno:
    input:
        sv = "{sample}/4.Mutation/SV/{sample}.sv.xls",
        log = "{sample}/4.Mutation/SV/{sample}.sv.done"
    params:
        sample = "{sample}"
    output:
        sv_anno = "{sample}/5.Annotation/SV/{sample}.sv.xls",
        log = "{sample}/5.Annotation/SV/{sample}.anno.done"
    shell:
        """
        echo sv anno

        use {input.sv}
        touch {output.log}
        """



rule cnv_anno:
    input:
        cnv = "{sample}/4.Mutation/CNV/{sample}.cnv.xls",
        log = "{sample}/4.Mutation/CNV/{sample}.cnv.done"
    params:
        sample = "{sample}"
    output:
        cnv_anno = "{sample}/5.Annotation/CNV/{sample}.cnv.xls",
        log = "{sample}/5.Annotation/CNV/{sample}.anno.done"
    shell:
        """
        echo cnv anno

        use {input.cnv}
        touch {output.log}
        """
