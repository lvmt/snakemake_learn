rule Merge_library:
    input:
        expand("{{library}}/fastq/{sam}/type.result.final", sam=sams),
    params:
        projdir = config["O"],
        library = "{library}",
        samid = samid,
    resources:
        mem_mb = 5000,
    threads: 1,
    output:
        log = "{library}/step3.done.log",
    shell:
        """
        echo "start: merge all sample result of one library" + `date` >> {output.log} 

        tail {params.projdir}/{params.library}/fastq/L*/type.result.final \\
            > {params.projdir}/{params.library}/total.type.result.final

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/name_all_add_id_v2 \\
            {params.projdir}/{params.library}/total.type.result.final \\
            {params.samid} \\
            {params.library} \\
            {params.projdir}/{params.library}/name_all.results \\
            {params.projdir}/{params.library}/name_all.temp.results 

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/add_tag_on_resultV3 \\
            {params.projdir}/{params.library}/name_all.temp.results \\
            /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/database/add_test.txt \\
            {params.projdir}/{params.library}/add_tag.result 

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/output_split_v2 \\
            {params.projdir}/{params.library}/add_tag.result \\
            {params.samid} \\
            {params.library} \\
            {params.projdir}/{params.library}/ \\

        sort +4 -5 \\
            {params.projdir}/{params.library}/tag_b_results \\
            > {params.projdir}/{params.library}/temp;
            
        mv {params.projdir}/{params.library}/temp \\
            {params.projdir}/{params.library}/tag_b_results

        ###################################################
        sort +4 -5 \\
            {params.projdir}/{params.library}/tag_c_results \\
            > {params.projdir}/{params.library}/temp;
            
        mv {params.projdir}/{params.library}/temp \\
            {params.projdir}/{params.library}/tag_c_results

        #####################################################
        sort +4 -5 \\
            {params.projdir}/{params.library}/tag_d_results \\
            > {params.projdir}/{params.library}/temp;
            
        mv {params.projdir}/{params.library}/temp \\
            {params.projdir}/{params.library}/tag_d_results

        ######################################################
        sort +4 -5 \\
            {params.projdir}/{params.library}/tag_e_results \\
            > {params.projdir}/{params.library}/temp;
            
        mv {params.projdir}/{params.library}/temp \\
            {params.projdir}/{params.library}/tag_e_results

        #######################################################
        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/No_result_judge \\
            {params.projdir}/{params.library}

        awk '{{if(NF>10 && $0!~/L01[12]/) print $0}}' \\
            {params.projdir}/{params.library}/exon_num.txt \\
            >{params.projdir}/figure/{params.library}.exon_num

        find {params.projdir}/{params.library}/fastq/L*/?-E?.consence \\
            >{params.projdir}/figure/{params.library}.consence

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/depth_sta_V4 \\
            {params.projdir}/figure/{params.library}.consence \\
            {params.projdir}/figure

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/snp_bias_sta \\
            {params.projdir}/{params.library} \\
            {params.projdir}/{params.library}/snp_bias_sta.txt \\
            >> {params.projdir}/snp_bias.txt

        echo "end: merge all sample result of one library" + `date` >> {output.log}

        """


