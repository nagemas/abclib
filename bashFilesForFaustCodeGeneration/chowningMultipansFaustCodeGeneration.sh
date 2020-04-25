#!/bin/bash
#ABC_CHOWNINGMULTIPANS FAUST CODE GENERATION
cd ../faustCodes/
#deletes the previous abc_chowningmultipans folder
rm -R abc_chowningmultipans
mkdir abc_chowningmultipans
cd abc_chowningmultipans/
#is there a parameter?
#if not we force 7 as default value
if [ -z $1 ]
then
amborder=7
else
amborder=$1
fi
#is the parameter lower than 7
#we then force 7 as a minimum
if [ $amborder -le 7 ]
then
amborder=7
fi
#number of channels
let "Nch = 2 * $amborder + 2"
headerfilename="../../bashFilesForFaustCodeGeneration/faustCodeHeader.txt"
for i in `seq 1 $Nch`
do
sortie="abc_chopan$i.dsp"
echo "" > $sortie
while IFS= read -r line
do
echo "$line" >> $sortie
done <"$headerfilename"
echo "declare name \"abc_chopan$i\";
//
//MULTISOURCE CHOWNING PANNER
//
import(\"stdfaust.lib\");
import(\"../abccommon/abcchowningmultipan.dsp\");
//" >> $sortie
#we have to manage the exception for one source when i equals 1
if [ $i = 1 ]
then
echo "process = chowningPan1;" >> $sortie
else
echo "process = chowningPan($i);" >> $sortie
fi
done