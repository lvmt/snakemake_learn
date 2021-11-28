rule QC:
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
        "benchmark/step1.{library}.QC.log"
    output:
        new_filter_1 = "{library}/new_filter_1.fq",
        new_filter_2 = "{library}/new_filter_2.fq",
        L001 = "{library}/fastq/L001/A-E1.ip",
        L002 = "{library}/fastq/L002/A-E1.ip",
        L003 = "{library}/fastq/L003/A-E1.ip",
        L004 = "{library}/fastq/L004/A-E1.ip",
        L005 = "{library}/fastq/L005/A-E1.ip",
        L006 = "{library}/fastq/L006/A-E1.ip",
        L007 = "{library}/fastq/L007/A-E1.ip",
        L008 = "{library}/fastq/L008/A-E1.ip",
        L009 = "{library}/fastq/L009/A-E1.ip",
        L010 = "{library}/fastq/L010/A-E1.ip",
        L011 = "{library}/fastq/L011/A-E1.ip",
        L012 = "{library}/fastq/L012/A-E1.ip",
        L013 = "{library}/fastq/L013/A-E1.ip",
        L014 = "{library}/fastq/L014/A-E1.ip",
        L015 = "{library}/fastq/L015/A-E1.ip",
        L016 = "{library}/fastq/L016/A-E1.ip",
        L017 = "{library}/fastq/L017/A-E1.ip",
        L018 = "{library}/fastq/L018/A-E1.ip",
        L019 = "{library}/fastq/L019/A-E1.ip",
        L020 = "{library}/fastq/L020/A-E1.ip",
        L021 = "{library}/fastq/L021/A-E1.ip",
        L022 = "{library}/fastq/L022/A-E1.ip",
        L023 = "{library}/fastq/L023/A-E1.ip",
        L024 = "{library}/fastq/L024/A-E1.ip",
        L025 = "{library}/fastq/L025/A-E1.ip",
        L026 = "{library}/fastq/L026/A-E1.ip",
        L027 = "{library}/fastq/L027/A-E1.ip",
        L028 = "{library}/fastq/L028/A-E1.ip",
        L029 = "{library}/fastq/L029/A-E1.ip",
        L030 = "{library}/fastq/L030/A-E1.ip",
        L031 = "{library}/fastq/L031/A-E1.ip",
        L032 = "{library}/fastq/L032/A-E1.ip",
        L033 = "{library}/fastq/L033/A-E1.ip",
        L034 = "{library}/fastq/L034/A-E1.ip",
        L035 = "{library}/fastq/L035/A-E1.ip",
        L036 = "{library}/fastq/L036/A-E1.ip",
        L037 = "{library}/fastq/L037/A-E1.ip",
        L038 = "{library}/fastq/L038/A-E1.ip",
        L039 = "{library}/fastq/L039/A-E1.ip",
        L040 = "{library}/fastq/L040/A-E1.ip",
        L041 = "{library}/fastq/L041/A-E1.ip",
        L042 = "{library}/fastq/L042/A-E1.ip",
        L043 = "{library}/fastq/L043/A-E1.ip",
        L044 = "{library}/fastq/L044/A-E1.ip",
        L045 = "{library}/fastq/L045/A-E1.ip",
        L046 = "{library}/fastq/L046/A-E1.ip",
        L047 = "{library}/fastq/L047/A-E1.ip",
        L048 = "{library}/fastq/L048/A-E1.ip",
        L049 = "{library}/fastq/L049/A-E1.ip",
        L050 = "{library}/fastq/L050/A-E1.ip",
        L051 = "{library}/fastq/L051/A-E1.ip",
        L052 = "{library}/fastq/L052/A-E1.ip",
        L053 = "{library}/fastq/L053/A-E1.ip",
        L054 = "{library}/fastq/L054/A-E1.ip",
        L055 = "{library}/fastq/L055/A-E1.ip",
        L056 = "{library}/fastq/L056/A-E1.ip",
        L057 = "{library}/fastq/L057/A-E1.ip",
        L058 = "{library}/fastq/L058/A-E1.ip",
        L059 = "{library}/fastq/L059/A-E1.ip",
        L060 = "{library}/fastq/L060/A-E1.ip",
        L061 = "{library}/fastq/L061/A-E1.ip",
        L062 = "{library}/fastq/L062/A-E1.ip",
        L063 = "{library}/fastq/L063/A-E1.ip",
        L064 = "{library}/fastq/L064/A-E1.ip",
        L065 = "{library}/fastq/L065/A-E1.ip",
        L066 = "{library}/fastq/L066/A-E1.ip",
        L067 = "{library}/fastq/L067/A-E1.ip",
        L068 = "{library}/fastq/L068/A-E1.ip",
        L069 = "{library}/fastq/L069/A-E1.ip",
        L070 = "{library}/fastq/L070/A-E1.ip",
        L071 = "{library}/fastq/L071/A-E1.ip",
        L072 = "{library}/fastq/L072/A-E1.ip",
        L073 = "{library}/fastq/L073/A-E1.ip",
        L074 = "{library}/fastq/L074/A-E1.ip",
        L075 = "{library}/fastq/L075/A-E1.ip",
        L076 = "{library}/fastq/L076/A-E1.ip",
        L077 = "{library}/fastq/L077/A-E1.ip",
        L078 = "{library}/fastq/L078/A-E1.ip",
        L079 = "{library}/fastq/L079/A-E1.ip",
        L080 = "{library}/fastq/L080/A-E1.ip",
        L081 = "{library}/fastq/L081/A-E1.ip",
        L082 = "{library}/fastq/L082/A-E1.ip",
        L083 = "{library}/fastq/L083/A-E1.ip",
        L084 = "{library}/fastq/L084/A-E1.ip",
        L085 = "{library}/fastq/L085/A-E1.ip",
        L086 = "{library}/fastq/L086/A-E1.ip",
        L087 = "{library}/fastq/L087/A-E1.ip",
        L088 = "{library}/fastq/L088/A-E1.ip",
        L089 = "{library}/fastq/L089/A-E1.ip",
        L090 = "{library}/fastq/L090/A-E1.ip",
        L091 = "{library}/fastq/L091/A-E1.ip",
        L092 = "{library}/fastq/L092/A-E1.ip",
        L093 = "{library}/fastq/L093/A-E1.ip",
        L094 = "{library}/fastq/L094/A-E1.ip",
        L095 = "{library}/fastq/L095/A-E1.ip",
        L096 = "{library}/fastq/L096/A-E1.ip",
    shell:
        """
        echo "aaa"

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
