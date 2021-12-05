import pandas as pd


def get_results(wildcards):
    with checkpoints.qc.get().output[0].open() as f:
        qc = pd.read_csv(f, sep=' ')
        return expand(
            "results/processed/{sample}.txt",
            sample=qc[qc['some-value'] > 90.0]['sample']
        )


samples = ['s1', 's2', 's3', 's4']


rule all:
    input:
        get_results


checkpoint qc:
    input:
        expand("results/preprocessed/{sample}.txt", sample=samples)
    output:
        "results/qc.tsv"
    shell:
        "cat {input} > {output}"


rule process:
    input:
        "results/preprocessed/{sample}.txt"
    output:
        "results/processed/{sample}.txt"
    shell:
        """
        cp {input} {output}
        echo "pass" >> {output}
        """