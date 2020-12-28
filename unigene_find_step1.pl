#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Expression/liver.counts.matrix"or die;
while($in2=<$in1>){chomp$in2;
if ($in2=~/^(\S+)\s+(.*)/){
@b=split"\t",$2;$gen=$1;
for(@b){
$a+=1 if $_>=10;
}
$c.=$in2."\n" if $a>1;
$a=0;
}
else{$c.=$in2."\n";}
}
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/1_cout10.iso"or die;
print$out($c);
