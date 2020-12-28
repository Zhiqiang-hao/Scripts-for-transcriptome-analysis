#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/1_cout10.3"or die;
while($in2=<$in1>){
$b{$1}=1 if $in2=~/^(\S+)_/;
}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Expression/liver_gene.counts.matrix"or die;
while($in2=<$in1>){
if ($in2=~/^(\S+)/){
next unless $b{$1};
$c.=$in2;
}
else{$c.=$in2;}
}
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Unigene/Unigene_find/2"or die;
print$out($c);
