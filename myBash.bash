#!/bin/bash

#clear the screen
clear

#the thorn character, no useful reason it's here
#þ

#in the discussions.thorn file replace new lines (\n) with spaces
#send new string to awk and split by the thorn character
#loop through setting a temporary string, TEMPVAR to the ith split string and adding it to the VARS array
i=0
while true
do
TEMPVAR=$(cat discussions.thorn | tr '\n' ' ' | awk -v myI="$i" -F$'\u00FE' '{print $myI}')
    if [ -z "$TEMPVAR" ]
    then
        break
    fi
    VARS[$i]=$TEMPVAR
    i=$(($i + 1))
done

#number of strings, 1 + the number of thorn characters
VARSLEN=${#VARS[@]}

#loop through VARS combaring each combination of 2 strings
#count the number of characters that are different and the number of characters in the union
#calculate the number of characters in the intersection by taking the differnce between the number of characters in the uninon and the number of characters that are different
#calculate the Jaccard Distance by dividing the count in the intersection by the count in the union
#append the combination and its corresponding Jaccard Distance to a new file, discussions.jaccard
i=0
while true
do
    j=$(($i + 1))
    if ((j > ($VARSLEN - 1)))
    then
        break
    fi
    while true
    do
        myDiffs=$(diff -u <(echo ${VARS[i]}|fold -w1) <(echo ${VARS[j]}|fold -w1) | grep -e '^-' -e '^+' | grep -v "Binary file (standard input) matches" | wc -l)
        myTot=$(diff -u <(echo ${VARS[i]}|fold -w1) <(echo ${VARS[j]}|fold -w1) | grep -v '^@' | grep -v "Binary file (standard input) matches" | wc -l)
        myDiffs=$(($myDiffs - 2))
        myTot=$(($myTot - 2))
        myInters=$(($myTot - $myDiffs))
        myJaccard=$(awk -v num=$myInters -v den=$myTot 'BEGIN {print (num/den)}')
        echo $i $j $myJaccard >> discussions.jaccard
        j=$(($j + 1))
        if ((j > ($VARSLEN - 1)))
        then
            break
        fi
    done
    i=$(($i + 1))
    if ((i > ($VARSLEN - 1)))
    then
        break
    fi
done

#sort and print the discussions.jaccard file by the 3rd column (Jaccard Distance) in reverse order
sort -k 3r discussions.jaccard

#remove the file discussions.jaccard
rm discussions.jaccard
