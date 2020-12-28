#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/pfam/v2/Unigene_pep.fa.gff3"or die;
while($in2=<$in1>){
if ($in2=~/^(\S+)_\S+\s+Pfam\s+.*signature_desc=(.*?);Name=(PF\d+)/){
$c{$1}{$3}=$2;
}}
for$gen(keys%c){$c.=$gen."\t";$num=keys%{$c{$gen}};
for(keys%{$c{$gen}}){
$m++;
if ($m!=$num and $m!=1){
$c.=';; '.$c{$gen}{$_};
}
else{$c.=$c{$gen}{$_};}
}
$c.="\n";$m=0;
}
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/pfam/v2/1"or die;
print$out($c);
