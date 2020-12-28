#!/usr/bin/perl
$dir="/path/to/cleandata";
opendir$in1,"$dir"or die;
while($in2=readdir$in1){
next if $in2=~/^\./;
next if $in2=~/_2/;
$in4=$1 if $in2=~/^(\S+)_/;
$input2=$in2;$input2=~s/_1/_2/;
mkdir"/home/omics/exp"; 
chdir"/home/omics/exp/$in4";
system"/home/omics/trinityrnaseq-2.4.0/util/align_and_estimate_abundance.pl  --thread_count 24 --trinity_mode --transcript /home/omics/trinity_out/Trinity.fasta  --seqType fq --left $dir/$in2 --right $dir/$input2 --est_method RSEM --aln_method bowtie --output_dir /home/omics/exp/$in4";
}
