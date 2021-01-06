# Scripts-for-transcriptome-analysis
This script set is designed for the study of "Transcriptome analysis of the liver of Eospalax fontanierii under hypoxia";
All scripts were developed on Ubuntu system (version 18.04), one Linux operating system branch, which can be used in other Linux-like systems.
The External tools used in our scripts should be prepared before using scripts. They are:
1. Trinity, https://github.com/trinityrnaseq/trinityrnaseq/archive/master.zip, and installed in your system
2. Transdecoder, https://github.com/TransDecoder/TransDecoder/archive/master.zip
3. CD-hit, from https://github.com/weizhongli/cdhit/archive/master.zip
4. Blast2go, https://www.biobam.com/blast2go-command-line-tools/
5. Blast, ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.11.0+-x64-linux.tar.gz
6. Hmmer, https://github.com/EddyRivasLab/hmmer/archive/master.zip

The main script is pipeline_transcriptome.sh, including other script. When using this script, you can execut each step in script on command line.
By step-wise pipeline, results from different softwares were used and processed by our script. When using external tools to generate necessary result, some conditions should be satified. For example, high memory server are needed  when transcripts are assembled. When annotating sequences, nr database need to be downloaded fristly.

