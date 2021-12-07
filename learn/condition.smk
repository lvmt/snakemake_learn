# a target rule to define the desired final output
rule all:
    input:
        "aggregated/a.txt",
        "aggregated/b.txt"


# the checkpoint that shall trigger re-evaluation of the DAG
checkpoint somestep:
    input:
        "samples/{sample}.txt"
    output:
        "somestep/{sample}.txt"
    shell:
        # simulate some output value
        "echo {wildcards.sample} > somestep/{wildcards.sample}.txt"


# intermediate rule
rule intermediate:
    input:
        "somestep/{sample}.txt"
    output:
        "post/{sample}.txt"
    shell:
        "touch {output}"


# alternative intermediate rule
rule alt_intermediate:
    input:
        "somestep/{sample}.txt"
    output:
        "alt/{sample}.txt"
    shell:
        "touch {output}"


# input function for the rule aggregate
def aggregate_input(wildcards):
    # decision based on content of output file
    # Important: use the method open() of the returned file!
    # This way, Snakemake is able to automatically download the file if it is generated in
    # a cloud environment without a shared filesystem.
    with checkpoints.somestep.get(sample=wildcards.sample).output[0].open() as f:
        if f.read().strip() == "a":
            return "post/{sample}.txt"
        else:
            return "alt/{sample}.txt"


rule aggregate:
    input:
        aggregate_input
    output:
        "aggregated/{sample}.txt"
    shell:
        "touch {output}"