#!/usr/bin/python
rule Filter:
    input:
        fq1 = lambda wildcards: fq_dict[wildcards.library][0],
        fq2 = lambda wildcards: fq_dict[wildcards.library][1],
    params:
        n_number = 1,
        Quality = 15,
        library = "{library}",
        projdir = config["O"],
    resources:
        mem_mb = 2000
    threads: 1
    benchmark:
        "benchmark/step1.{library}.step1.log"
    output:
        new_filter_1 = "{library}/new_filter_1.fq",
        new_filter_2 = "{library}/new_filter_2.fq",
        test = "{library}/test.txt",
    shell:
        """
        echo "aaa"
        touch {output.test}

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/raw_reads_filter \\
            {input.fq1} \\
            {input.fq2} \\
            {params.n_number}  \\
            {params.Quality}  \\
            {config[O]}/{output.new_filter_1} \\
            {config[O]}/{output.new_filter_2} \\
            > \\
            {config[O]}/{params.library}/statistic.txt 


        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/sample_grouping_gz \\
            -a {config[O]}/{params.library}/new_filter_1.fq \\
            -b {config[O]}/{params.library}/new_filter_2.fq \\
            -i /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/database/index/index.index \\
            -o {config[O]}/{params.library} \\
        
        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/statistic_ip \\
            {config[O]}/{params.library}/ip.txt \\
            /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/database/N.relation.txt \\
            100 6500 \\
            {config[O]}/{params.library}/exon_num.txt \\
            >> \\
            {config[O]}/{params.library}/statistic.txt 


        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/mv_data \\
            /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/database/N.relation.txt \\
            {config[O]}/{params.library}/fastq

        """ 
