#!/usr/bin/python3
rule HLA:
    input:
        sam_dir = "{projdir}/{lirary}/{sam}",

    params:
        projdir = "{projdir}",
        library = "{library}",
    resources:
        mem_mb: 32000
    threads: 2
    output:
        result = "{projdir}/{library}/{sam}/type.result.final"
    shell:
        """
        echo "start time: " `date`

        dir={params.projdir}/{params.library} 
        path=/zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/pipeline
        cd $path

        bin=../bin/
        database=../database/

        #i=$dir/fastq/L079   i = sam_dir

        for j in A-E1 A-E3 A-E4 A-E5 B-E1 B-E3 B-E4 B-E5 C-E1 C-E3 C-E4 C-E5 D-E1 D-E2 D-E3 D-E4 P-E1 P-E2 P-E3 Q-E1 Q-E2 Q-E3 Q-E4
        do
            $bin/Reduce_pe_index_primer {input.sam_dir}/$j.ip {input.sam_dir}/$j\_1.fq {input.sam_dir}/$j\_2.fq {input.sam_dir}/$j\_1.new.fq {input.sam_dir}/$j\_2.new.fq
            ############decide which reference should it use ###############
            prefix=`echo $j | awk -F '-' '{{print $1}}'`
            reference=$database/ref/$prefix.fa

            #################################################################
            $bin/bwa aln -l 31 -t 2 -k 10 -q 15 -n 25 $reference {input.sam_dir}/$j\_1.new.fq > {input.sam_dir}/$j\_1.sai 2>/dev/null
            $bin/bwa aln -l 31 -t 2 -k 10 -q 15 -n 25 $reference {input.sam_dir}/$j\_2.new.fq > {input.sam_dir}/$j\_2.sai 2>/dev/null
            $bin/bwa sampe $reference {input.sam_dir}/$j\_1.sai {input.sam_dir}/$j\_2.sai {input.sam_dir}/$j\_1.new.fq {input.sam_dir}/$j\_2.new.fq > {input.sam_dir}/$j.sam 2>/dev/null
            $bin/filter_sam_newV4 {input.sam_dir}/$j.sam > {input.sam_dir}/$j.sam.filter
            $bin/samtools view -u -b -S -t $reference.fai {input.sam_dir}/$j.sam.filter > {input.sam_dir}/$j.bam 2>/dev/null
            $bin/samtools sort {input.sam_dir}/$j.bam {input.sam_dir}/$j.bam 2>/dev/null
            $bin/samtools index {input.sam_dir}/$j.bam.bam
            
            if [[ "$j" =~ "C" ]]
                then
                    java -jar $bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -l INFO -I {input.sam_dir}/$j.bam.bam -R $reference -o {input.sam_dir}/$j.realign.intervals
                    java -jar $bin/GenomeAnalysisTK.jar -T IndelRealigner -l INFO -I {input.sam_dir}/$j.bam.bam -R $reference -targetIntervals {input.sam_dir}/$j.realign.intervals -o {input.sam_dir}/$j.realign.bam
                    $bin/samtools sort {input.sam_dir}/$j.realign.bam {input.sam_dir}/$j.realign.bam 2>/dev/null
                    $bin/samtools index {input.sam_dir}/$j.realign.bam.bam
                    $bin/samtools pileup -c -r 0.15 -T 0.87 -f $reference {input.sam_dir}/$j.realign.bam.bam > {input.sam_dir}/$j.consence
                else
                    $bin/samtools pileup -c -r 0.15 -T 0.87 -f $reference {input.sam_dir}/$j.bam.bam > {input.sam_dir}/$j.consence
            fi
            
            $bin/abstract_snpV4 {input.sam_dir}/$j.consence > {input.sam_dir}/$j.snp{input.sam_dir}
            $bin/HLA_Divider.graph4.noRand {input.sam_dir}/$j.snp {input.sam_dir}/$j.sam.filter
            #$bin/bayes_predict_snp -i {input.sam_dir}/$j.snp -m $database --h1 {input.sam_dir}/$j.hap1.sam.consence --h2 {input.sam_dir}/$j.hap2.sam.consence
        done

        for j in A-E1 A-E2 A-E3 A-E4 A-E5 A-E6 A-E7 B-E1 B-E2 B-E3 B-E4 B-E5 B-E6 B-E7 C-E1 C-E2 C-E3 C-E4 C-E5 C-E6 C-E7 C-E8 D-E1 D-E2 D-E3 D-E4 D-E5 P-E1 P-E2 P-E3 P-E4 Q-E1 Q-E2 Q-E3 Q-E4
            do
                prefix=`echo $j | awk -F '-' '{{print $1}}'`
                reference=$database/ref/$prefix.fa

                for h in /$j.hap*.sam
                    do
                        $bin/samtools view -u -b -S -t $reference.fai $h > $h.bam 2>/dev/null
                        $bin/samtools sort $h.bam $h.bam 2>/dev/null
                        $bin/samtools index $h.bam.bam
                        if [[ "$j" =~ "C" ]]
                            then
                            java -jar $bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -l INFO -I $h.bam.bam -R $reference -o $h.realign.intervals
                            java -jar $bin/GenomeAnalysisTK.jar -T IndelRealigner -l INFO -I $h.bam.bam -R $reference -targetIntervals $h.realign.intervals -o $h.realign.bam
                            $bin/samtools sort $h.realign.bam $h.realign.bam 2>/dev/null
                            $bin/samtools index $h.realign.bam.bam
                            $bin/samtools pileup -c -T 0.87 -N 1 -f $reference $h.realign.bam.bam > $h.consence
                            else
                            $bin/samtools pileup -c -T 0.87 -N 1 -f $reference $h.bam.bam > $h.consence
                        fi
                done

                $bin/decide_right_typeV4 $reference $database/snp_type/$j.sam.index {input.sam_dir}/$j.right.final {input.sam_dir}/$j.hap*.consence >{input.sam_dir}/$j.type
        done

        $bin/Decide_type_4 {input.sam_dir}/A-E*.type  {input.sam_dir}/B-E*.type {input.sam_dir}/C-E*.type {input.sam_dir}/D-E*.type {input.sam_dir}/P-E*.type {input.sam_dir}/Q-E*.type $database/snp_type > {input.sam_dir}/type.result
        $bin/recombination_type $database/all_exon_same.type {input.sam_dir}/type.result
        $bin/validation_type_4 -out {input.sam_dir}/type.result.check -dir {input.sam_dir}
        $bin/change_TRUEs_effectFs -k {input.sam_dir}/type.result.check -m {input.sam_dir}/type.result.combined -d $database -o {input.sam_dir}/type.result.check.amend
        $bin/check.filter {input.sam_dir}/type.result.combined {input.sam_dir}/type.result.check.amend {input.sam_dir}/type.result.check.filter
        $bin/Filter_result_add_rare3 $database/rare_allele_20210419 $database/Missing_allele {input.sam_dir}/type.result.check.filter {input.sam_dir}/type.result.final

        date

        """