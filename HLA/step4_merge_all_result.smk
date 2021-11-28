rule Merge_all:
    input:
        log = expand("{lib}/step3.done.log", lib=librarys),
    params:
        projdir = config["O"],
        all_library = expand("{lib}", lib=librarys),
        all_abs_library = expand("{projdir}/figure/{lib}", projdir=config["O"], lib=librarys),
    output:
        log = "step4.done.log"

    shell:
        """ 
        echo "start: merge all result of one library" + `date` >> {output.log} 

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/cat_index_results_V2 \\
            {params.projdir} {params.all_library} 

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/C_checkV3 \\
            {params.projdir}

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/Check_DRB1 \\
            {params.projdir}

        #/zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/abstract_InDel2 \\
            {params.projdir}/*/fastq/L*/*.consence \\
            {params.projdir}/21HLA049P-21GSK830-831.samid \\
            > {params.projdir}/result/all.InDel.txt

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/Rscript \\
            /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/read_num_png_V4.R \\
            {params.projdir}/figure/*.exon_num \\
            {params.projdir}/figure

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/intergratefile \\
            {params.projdir}/*/statistic.txt

        /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/Rscript \\
            /zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/bin/depth_figure_V4.R \\
            {params.all_abs_library} \\
            {params.projdir}/figure

        echo "start: merge all result of one library" + `date` >> {output.log} 

        """
