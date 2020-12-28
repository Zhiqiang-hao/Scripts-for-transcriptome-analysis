#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/2_gene_exp_matrix"or die;
while($in2=<$in1>){chomp$in2;
if ($in2=~/^(\S+)\s+(.*)/){
$gen{$1}=1;$gen=$1;$exp=$2;
for(split"\t",$exp){
$sum{$gen}+=$_;
}}}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Transcript.fasta"or die;
while($in2=<$in1>){chomp$in2;
if ($in2=~/^>((\S+)_\S+)\s+len=(\d+)/){
$len{$2}{$1}=$3;$iso=$1;next;
}
$seq{$iso}.=$in2;
}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/1_transcript_exp_matrix"or die;
while($in2=<$in1>){
if ($in2=~/^((\S+)_\S+)\s+(.*)/){
$iso=$1;$gen=$2;
$exp=$3;
for(split"\t",$exp){
$sum1+=$_;
}
$ratio=$sum1/$sum{$gen};
$all{$gen}{$iso}=$ratio if $ratio>=0.1;
$sum1=0;
}
}
for$gen(keys%all){
for(keys%{$all{$gen}}){
$seq2.='>'.$_."\n".$seq{$_}."\n";
}
}
sub sn {$all{$gen}{$b}<=>$all{$gen}{$a}};
sub sn1 {$len{$gen}{$b}<=>$len{$gen}{$a}};
for$gen(keys%all){
for(sort sn keys %{$all{$gen}}){
if ($all{$gen}{$_}>=0.5){
$best{$gen}=$_."\thigh_exp\t$all{$gen}{$_}";
$best1{$gen}=$_;
}
else{
for(sort sn1 keys %{$len{$gen}}){
$best{$gen}=$_."\tlongest\t$len{$gen}{$_}";
$best1{$gen}=$_;
last;
}}}}
for(keys%best){
$c.=$_."\t".$best{$_}."\n";
$nam=$best1{$_};print$nam;
$seq.='>'.$_."\n".$seq{$nam}."\n";
}
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/3_gene_trans"or die;
print$out($c);
open$out1,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/3_unigene_seq"or die;
print$out1($seq);
open$out2,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/3_transcript_seq"or die;
print$out2($seq2);
