configfile: "config.yaml"

with open(config['SAMPLES']) as fp:
    SAMPLES= fp.read().splitlines()
print(SAMPLES)


rule all:
      input:
           "out.relatedness"

rule relatedness: 
     input: 
        vcf = expand("{COHORT}.vcf", COHORT=SAMPLES)
     log: "logs/relatedness.log" 
     benchmark: "logs/relatedness.benchmark" 
     output: 
        "out.log",
        "out.relatedness" 
     shell:
         """
         vcftools --gzvcf {input} --relatedness
         """




