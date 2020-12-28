#!/usr/bin/perl
open$in1,"/home/li/b2gFiles/res/go_201806.obo"or die;
while($in2=<$in1>){
if ($in2=~/^id:\s+(GO:\d+)/){
$nam=$1;
}
if($in2=~/^name:\s+(.*)/){
$def{$nam}=$1;
}
if($in2=~/^namespace:\s+(.*)/){
$spa{$nam}=$1;
}
}
open$in1,"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/nr/v2/blast2go/blast2go_annot_20181001_1937.wego"or die;
while($in2=<$in1>){chomp$in2;
$in2=~s/\r//;
if ($in2=~/^(T\S+)\s+(\S.*)/){
$nam=$1;$c.=$nam."\t";print$2;
for(split"\t",$2){
$c.=$spa{$_}.':'.$def{$_}.';; ';
}
$c.="\n";
}
}
$c=~s/cellular_component/Cellular Component/g;
$c=~s/molecular_function/Molecular Function/g;
$c=~s/biological_process/Biological Process/g;
open$out,'>',"/home/li/Myopsalax/Tissues/Liver/liver3/Anno/nr/v2/3_GOanno"or die;
print$out($c);
