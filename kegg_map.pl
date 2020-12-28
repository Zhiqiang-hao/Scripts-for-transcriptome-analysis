#!/usr/bin/perl
open$in1,"/home/li/Database/KEGG_table/ko00000.keg"or die;
while($in2=<$in1>){
if ($in2=~/^C\s+(\d+)/){
$nam=$1;
}
if ($in2=~/^D\s+(K\d+)/){$m++;
$kegg{$nam}.="\t".$1;
$p{$1}=1;
}}
for(keys%kegg){
$c.=$_.$kegg{$_}."\n";
}
for(keys%p){
$n++;
}
print$m."\t".$n."\n";
open$out,'>',"/home/li/Database/KEGG_table/ko_K"or die;
print$out($c);
