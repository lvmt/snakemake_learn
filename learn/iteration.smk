rule all:
    input:
        "data.10.transformed.txt"
    

def get_iteration_input(wildcards):
    i = int(wildcards.i)
    if i == 0:
        return "data.txt"
    else:
        return f'data.{i-1}.transformed.txt'


rule iterate:
    input:
        get_iteration_input
    output:
        "data.{i}.transformed.txt"