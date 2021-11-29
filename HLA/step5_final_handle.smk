rule Final_step:
    input:
        "step4.done.log"
    params:
        projdir = config["O"],
        suffix = config["suffix"],
    resources: 
        mem_mb = 5000,
    threads: 1
    output:
        "step5.done.log"
    shell:
        """
        echo five

        cd {params.projdir}

        /ifs9/B2C_Cancer/PIPELINE/lung_colon_yitiji/lung_colon/miniconda3/envs/seqmeta/bin/python \\
            /zfsyt1/B2C_COM_P1/USER/lmt/zhougenming/zhougengmin/HLA/get_HLAexomfile.py \\
            -d {params.projdir} 

        /ifs9/B2C_Cancer/PIPELINE/lung_colon_yitiji/lung_colon/miniconda3/envs/seqmeta/bin/python \\
            /zfsyt1/B2C_COM_P1/USER/lmt/zhougenming/zhougengmin/HLA/HLAb2_check.v0.1.py \\
            -i {params.projdir}/result/{params.suffix}.xlsx \\
            -d {params.projdir}

        cat {params.projdir}/result/all_a_results \\
            >> /zfsyt1/B2C_COM_P1/B2C_BACKUP/HLA/HLA2019_lane_result/2019_all_a_results 

        /ifs9/B2C_Cancer/PIPELINE/lung_colon_yitiji/lung_colon/miniconda3/envs/seqmeta/bin/python \\
            /zfsyt1/B2C_COM_P1/USER/wanglinlin/python/get_type.result.combined_v0.1.py \\
            -i {params.projdir} 

        /ifs9/B2C_Cancer/PIPELINE/lung_colon_yitiji/lung_colon/miniconda3/envs/seqmeta/bin/python \\
            /zfsyt1/B2C_COM_P1/USER/lmt/zhougenming/zhougengmin/HLA/HLA_snp.py \\
            -d {params.projdir}

        mv snp_bias_file {params.suffix}_snp_bias_file

        zip -r  {params.suffix}_snp_bias_file.zip {params.suffix}_snp_bias_file  

        zip -r {params.suffix}_exom_file.zip {params.suffix}_exom_file

        ln -sf {params.projdir}/result/{params.suffix}.xlsx \\
            {params.projdir}/release/{params.suffix}样本信息整体对应表-LYM_ZLM.xlsx 

        ln -sf {params.projdir}/{params.suffix}_result_combined.xls \\
            {params.projdir}/release/{params.suffix}样本信息整体对应表-LYM_ZLM_result_combined.xls 

        ln -sf {params.projdir}/{params.suffix}_snp_bias_file.zip \\
            {params.projdir}/release/{params.suffix}样本信息整体对应表-LYM_ZLM_snp_bias_file.zip 

        ln -sf {params.projdir}/{params.suffix}_exom_file.zip \\
            {params.projdir}/release/{params.suffix}样本信息整体对应表-LYM_ZLM_exom_file.zip 

        /ifs9/B2C_Cancer/PIPELINE/lung_colon_yitiji/lung_colon/miniconda3/envs/seqmeta/bin/python \\
            /ifs9/B2C_COM_P1/PROJECT/HLA/WORK/lmt/Code/pipelineHLA/sendemail2.py \\
            --projdir {params.projdir} \\
            --name {params.suffix}样本信息整体对应表-LYM_ZLM 

        /ifs9/B2C_Cancer/PIPELINE/lung_colon_yitiji/lung_colon/miniconda3/envs/seqmeta/bin/python \\
            /ifs9/B2C_COM_P1/PROJECT/HLA/WORK/lmt/Code/pipelineHLA/rmfile_hla.py \\
            --projdir {params.projdir} \\
            --suffix {params.suffix} 

        """



