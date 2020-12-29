#!/bin/bash
########################## Pipelines for transcritome analyisis ##########################################
##### 1 raw data preprocess #####
cutadapt -a ADAPTER_FWD -A ADAPTER_REV -o out.1.fastq -p out.2.fastq reads_1.fq reads_2.fq

##### 2 Assembly by Trinity #####
cd /home/omics/clean_data
$TRINITY_HOME/Trinity   --seqType fq  --no_normalize_reads --max_memory 256G  --left reads_1.fq  --right read_2.fq  --CPU 24 --output /home/omics/trinity_out

##### 3 Estimate gene expression level #####
calculate_expression.pl

##### 4 Construct a matrix of counts #####
$TRINITY_HOME/util/abundance_estimates_to_matrix.pl --est_method --quant_files /path/to/expression_out_name --name_sample_by_basedir --basedir_index 2 --gene_trans_map /home/omics/trinity_out/Trinity.fasta.gene_trans_map

##### 5 Identify Differentially expressed genes ***** Trinity Tools #####
$TRINITY_HOME/Analysis/DifferentialExpression/run_DE_analysis.pl --matrix expression_count_tab --method DESeq2 --samples_file liver_describe.txt --output liver_DEG_OUT
 
##### 6 Identify Unigene sequences  ******  in-house perl script #####
unigene_find_step1.pl&&unigene_find_step2.pl&&unigene_find_step3.pl

###### 7 Identify CDS ######
TransDecoder.LongOrfs -t target_transcripts.fasta
hmmscan --cpu 8 --domtblout pfam.domtblout /path/to/Pfam-A.hmm transdecoder_dir/longest_orfs.pep
TransDecoder.Predict -t target_transcripts.fasta --retain_pfam_hits pfam.domtblout

###### 8 Cluster unigene sequence by cd-hit #####
cdhit-dir/cd-hit  -i unigene_seq.fa  -o unigene_cd_hit_cluster -T 8

###### 9 Functional annotation  #######
blastall  -d /public/data/nr_data/nr -e 1e-3  -m 7 -b 20 -v 20 -a 24 -i $INPUT_FILE  -p blastx -o $INPUT_FILE.xml
$Blast2GO_HOME/blast2go_cli.run -properties cli.prop -loadfasta input.fasta -loadblast blastResult.xml -mapping -annotation -saveb2g -savedat -annex -useobo go-basic.obo
phmmer -E 1e-5 -cpu 8 -pfamtblout output input.pep Pfam-A.hmm
blastall -p blastx -i input.fa -d uniprot_sprot -m 8 -e 1e-10 -F F -a 4 -o swiss_prot_out
pfam_out_table.pl
kegg_map.pl
GO_anno.pl
nr_anno.pl
swiss_map.pl
Annotate_integrate.pl
