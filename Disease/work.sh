/usr/local/bin/snakemake \
    -s disease.smk \
    -p \
    -C S=data.path \
    O=/Code/Disease \
    --cluster "qsub -clear -cwd -P B2C_Cancer -q bc_b2c.q -l num_proc={threads} -l vf={resources.mem_mb}M -binding linear:{threads}" \
    --rerun-incomplete \
    --jobs 1000 \
    --restart-times 3 \
    --keep-going \
    --rerun-incomplete \
    --latency-wait 60 \
    --stats runtime.json \
    --cores all \
    --drmaa-log-dir /Code/Disease/sh  \
    -n 


