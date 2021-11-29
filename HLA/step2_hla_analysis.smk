#!/usr/bin/python3
rule HLA_analysis:
    input:
        new_fq1 = "{library}/new_filter_1.fq",
    params:
        sam = "{sam}",
        projdir = config["O"],
        library = "{library}",
    resources:
        mem_mb = 5000,
    threads: 2,
    output:
        result = "{library}/fastq/{sam}/type.result.final",
    shell:
        """
        dir={params.projdir}/{params.library}
        path=/zfsyt1/B2C_COM_P1/USER/lmt/HLA_pipeline/HST_MGI_V4_3.39_2_db_git_exe/pipeline
        cd $path

        bin=../bin/
        database=../database/

        date
        i=$dir/fastq/{params.sam}

        for j in A-E1 A-E3 A-E4 A-E5 B-E1 B-E3 B-E4 B-E5 C-E1 C-E3 C-E4 C-E5 D-E1 D-E2 D-E3 D-E4 P-E1 P-E2 P-E3 Q-E1 Q-E2 Q-E3 Q-E4
        do
            $bin/Reduce_pe_index_primer $i/$j.ip $i/$j\_1.fq $i/$j\_2.fq $i/$j\_1.new.fq $i/$j\_2.new.fq
            prefix=`echo $j | awk -F '-' '{{print $1}}'`
            reference=$database/ref/${{prefix}}.fa

            $bin/bwa aln -l 31 -t 2 -k 10 -q 15 -n 25 $reference $i/$j\_1.new.fq > $i/$j\_1.sai 2>/dev/null
            $bin/bwa aln -l 31 -t 2 -k 10 -q 15 -n 25 $reference $i/$j\_2.new.fq > $i/$j\_2.sai 2>/dev/null
            $bin/bwa sampe $reference $i/$j\_1.sai $i/$j\_2.sai $i/$j\_1.new.fq $i/$j\_2.new.fq > $i/$j.sam 2>/dev/null

            $bin/filter_sam_newV4 $i/$j.sam > $i/$j.sam.filter
            $bin/samtools view -u -b -S -t $reference.fai $i/$j.sam.filter > $i/$j.bam 2>/dev/null
            $bin/samtools sort $i/$j.bam $i/$j.bam 2>/dev/null
            $bin/samtools index $i/$j.bam.bam


            if [[ "$j" =~ "C" ]]
            then
                java -jar $bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -l INFO -I $i/$j.bam.bam -R $reference-o $i/$j.realign.intervals
                java -jar $bin/GenomeAnalysisTK.jar -T IndelRealigner -l INFO -I $i/$j.bam.bam -R $reference -targetIntervals $i/$j.realign.intervals -o $i/$j.realign.bam

                $bin/samtools sort $i/$j.realign.bam $i/$j.realign.bam 2>/dev/null
                $bin/samtools index $i/$j.realign.bam.bam
                $bin/samtools pileup -c -r 0.15 -T 0.87 -f $reference $i/$j.realign.bam.bam > $i/$j.consence
            else
                $bin/samtools pileup -c -r 0.15 -T 0.87 -f $reference $i/$j.bam.bam > $i/$j.consence
            if

            $bin/abstract_snpV4 $i/$j.consence > $i/$j.snp
            $bin/HLA_Divider.graph4.noRand $i/$j.snp $i/$j.sam.filter
        done

        for j in A-E1 A-E2 A-E3 A-E4 A-E5 A-E6 A-E7 B-E1 B-E2 B-E3 B-E4 B-E5 B-E6 B-E7 C-E1 C-E2 C-E3 C-E4 C-E5 C-E6 C-E7 C-E8 D-E1 D-E2 D-E3 D-E4 D-E5 P-E1 P-E2 P-E3 P-E4 Q-E1 Q-E2 Q-E3 Q-E4
        do
            prefix=`echo $j | awk -F '-' '{{print $1}}'`
            reference=$database/ref/$prefix.fa
            for h in $i/$j.hap*.sam
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

            $bin/decide_right_typeV4 $reference $database/snp_type/$j.sam.index $i/$j.right.final $i/$j.hap*.consence >$i/$j.type
        done

        $bin/Decide_type_4 $i/A-E*.type  $i/B-E*.type $i/C-E*.type $i/D-E*.type $i/P-E*.type $i/Q-E*.type $database/snp_type > $i/type.result
        $bin/recombination_type $database/all_exon_same.type $i/type.result
        $bin/validation_type_4 -out $i/type.result.check -dir $i
        $bin/change_TRUEs_effectFs -k $i/type.result.check -m $i/type.result.combined -d $database -o $i/type.result.check.amend
        $bin/check.filter $i/type.result.combined $i/type.result.check.amend $i/type.result.check.filter
        $bin/Filter_result_add_rare3 $database/rare_allele_20210419 $database/Missing_allele $i/type.result.check.filter $i/type.result.final

        date

        """