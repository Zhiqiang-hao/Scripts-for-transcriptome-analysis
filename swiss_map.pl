#!/usr/bin/perl
open$in1,"/home/li/Database/sprot2/uniprot_sprot"or die;
while($in2=<$in1>){
if ($in2=~/>sp\|(\w+)\|\w+\s+(.*)/){
$def{$1}=$2;
}
}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/swiss_prot/blastx_swiss_diamond.outfmt6"or die;
while($in2=<$in1>){
if ($in2=~/^(\S+)\s+sp\|(\S+)\|/){
$out{$1}=$def{$2} unless $out{$1};
}
}
for(keys%out){
$c.=$_."\t".$out{$_}."\n";
}
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/swiss_prot/1"or die;
print$out($c);
