REFERENCES:

1) I used this following to learn how to write and run bash scripts

    https://www.youtube.com/watch?v=eH8Z9zeywq0&list=PLTXMX1FE5Hj5ZJDt_WMbioFpdWO5SGy8r

2) I used this to learn how to separate strings by unicode characters

    https://stackoverflow.com/questions/33384545/how-to-split-by-unicode-chars-in-shell

3) I used this to learn how to pass variables into awk

    https://stackoverflow.com/questions/19075671/how-do-i-use-shell-variables-in-an-awk-script

4) I used this to learn how to sort a file by column in reverse (descending order)

    https://www.geeksforgeeks.org/sort-command-linuxunix-examples/

5) I used this to learn how to fine the lenght of an array

    https://www.cyberciti.biz/faq/finding-bash-shell-array-length-elements/



RUN:

1) Move the myBash.bash script by moving myBash.bash and discussions.thorn to current directory
2) Change the permissions:  chmod +x myBash.bash
3) At $ prompt: ./myBash.bash



POSSIBLE ERRORS ACCOUNTED FOR:

1) When I used the command grep to count lines with certain characters, or only lines excluding certain chacarters, for the numerator and denominator of the Jaccard Distance,
   a possible error was sometimes returned at the end of the file, Binary file (standard input) matches.  I removed this with grep -v "Binary file (standard input) matches".



METHOD:

1)  In the discussions.thorn file replace new lines (\n) with spaces.
2)  Split the new string by the thorn character using awk.
3)  Loop through setting a temporary string to the ith split string and adding it to an array
4)  Loop through the array comparing each combination of 2 strings
5)  Count the number of characters that are different and the number of characters in the union
6)  Calculate the number of characters in the intersection by taking the differnce between the number of characters in the uninon and the number of characters that are different
7)  Calculate the Jaccard Distance by dividing the count in the intersection by the count in the union
8)  Append the combination and its corresponding Jaccard Distance to a new file, discussions.jaccard
9)  Sort and print the discussions.jaccard file by the 3rd column (Jaccard Distance) in reverse order
10) Remove the file discussions.jaccard

