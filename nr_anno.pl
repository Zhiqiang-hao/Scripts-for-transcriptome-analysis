#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/nr/blast2go_out/liver3_annot.txt.annot"or die;
while($in2=<$in1>){
$b{$1}=$2 if $in2=~/^(\S+)\s+\S+\s+(\S.*)/;
}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/nr/blast2go_out/blast2go_topblast_nr2.txt"or die;
while($in2=<$in1>){
@b=split"\t",$in2;
$nam=$b[0];
next unless $b{$nam};
if ($b[3]=~/(\S*\|){3}(.*?])/){
$c.=$nam."\t".$2."\n";
}
else{$c.=$nam."\t".$b{$nam}."\n";}
}
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/nr/1_nr_out"or die;
print$out($c);
