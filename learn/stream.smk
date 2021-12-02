rule step1:
    output:
        pipe("hello.txt")
    shell:
        "echo hello > {output}"

rule step2:
    output:
        pipe("world.txt")
    shell:
        "echo world > {output}"
    
rule step3:
    input:
        "hello.txt",
        "world.txt"
    output:
        "hello-world.txt"
    shell:
        "cat {input} > {otuput}"