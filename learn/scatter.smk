scattergather:
    someprocess=8


rule all:
    input:
        "result.txt"

rule scatter:
    input:
        "a.txt"
    output:
        scatter.someprocess("scattered/{scatteritem}.txt")
    shell:
        "echo  {input} > {output}"


rule step2:
    input:
        "scattered/{scatteritem}.txt"
    output:
        "transformed/{scatteritem}.txt"
    shell:
        "cp {input} {output}"


rule gather:
    input:
        gather.someprocess("transformed/{scatteritem}.txt")
    output:
        "result.txt"
    shell:
        "cp {input} {ouput}"



    