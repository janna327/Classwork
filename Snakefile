rule all:
	input:
		expand("results/{sample}_trimmed.fastq.gz", sample=config["samples"])
		
rule fastp:
	input:
		sample="{sample}.fastq.gz"
	output:
		out="results/{sample}_trimmed.fastq.gz"
	shell:
		"fastp -i {input.sample} -o {output.out} -h report_name.html"