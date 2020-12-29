#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/nr/1_nr_annotation"or die;
while($in2=<$in1>){
chomp$in2;
if ($in2=~/^(\S+)\s+(.*)/){
$ann{$1}=1;
$nr{$1}=$2;
}}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/pfam/v2/1"or die;
while($in2=<$in1>){chomp$in2;
if ($in2=~/^(\S+)\s+(.*)/){
$ann{$1}=1;
$pfam{$1}=$2;
}}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/swiss_prot/1"or die;
while($in2=<$in1>){chomp$in2;
if ($in2=~/^(\S+)\s+(.*)/){
$ann{$1}=1;
$swiss{$1}=$2;
}}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/kegg_kobas/v2/1"or die;
while($in2=<$in1>){chomp$in2;
if ($in2=~/^(\S+)\s+(.*)/){
$ann{$1}=1;
$kegg{$1}=$2;
}}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/nr/v2/3_GOanno"or die;
while($in2=<$in1>){chomp$in2;
if ($in2=~/^(\S+)\s+(.*)/){
$ann{$1}=1;
$go{$1}=$2;
}}
for(keys%ann){
$go{$_}='--' unless $go{$_};
$kegg{$_}='--' unless $kegg{$_};
$pfam{$_}='--' unless $pfam{$_};
$swiss{$_}='--' unless $swiss{$_};
$nr{$_}='--' unless $nr{$_};
$c.=$_."\t".$go{$_}."\t".$kegg{$_}."\t".$pfam{$_}."\t".$swiss{$_}."\t".$nr{$_}."\n";
}
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/1annota"or die;
print$out($c);
