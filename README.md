# snakemake_learn
use snakemake to make a pipeline

### record my learn
### modify



## snakemake书写中的坑

1）找不到wildcards##

snakemake根据output中的通配符，获取整个rule的通配符；

    如果某个通配符不在output中，但是在其他子命令中，表明该程序的设计存在问题。

2）提示输出的文件在不同的shell中是一样

    此次需要重新设计，尽量在输出文件的前面加上通配符。
