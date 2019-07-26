#Created by Nyah Way, 2019
#	Some CSCB09 Assignment3 Tests

#Get everything ready to test
gcc -g -w biquad.c -o biquad
gcc -g -w cascade.c -o cascade
if [ ! -f ./wavfile ]; then	
	if [ ! -f ./unwav ]; then gcc -g -w unwav.c -o unwav; fi 
	./unwav < ugly.wav > wavfile ; fi
echo "IF THERE ARE ANY ERRORS ABOVE THIS LINE, BELOW THIS LINE WILL ONLY BE ERRORS!! PLEASE FIX THOSE FIRST!"
#Testing with one pipe 
echo
echo "TESTING WITH 1 PIPE"
cat wavfile | ./biquad 0.717 -1.414 0 0 1 > biquad1pipe
cat wavfile | ./cascade 0.717 -1.414 0 0 1 > cascade1pipe
diffs1=$(diff biquad1pipe cascade1pipe | grep "^>" | wc -l)
diffs2=$(diff biquad1pipe cascade1pipe | grep "^<" | wc -l)
if [ $diffs1 -eq 0 -a $diffs2 -eq 0 ]; then echo "No differences found between files.";
elif [ $diffs2 -eq 0 ]; then echo "There are $diffs1 differences between files.";
else echo "There are $diffs2 differences between files."; fi
echo Look at the files biquad1pipe and cascade1pipe for more information.
#Testing with two pipes
echo
echo "TESTING WITH 2 PIPES"
cat wavfile | ./biquad 2 0 0 0 0 |./biquad 4 0 0 0 0 > biquad2pipes
./cascade 2 0 0 0 0 4 0 0 0 0 < wavfile > cascade2pipes
diffs1=$(diff biquad2pipes cascade2pipes | grep "^>" | wc -l)
diffs2=$(diff biquad2pipes cascade2pipes | grep "^<" | wc -l)
if [ $diffs1 -eq 0 -a $diffs2 -eq 0 ]; then echo "No differences found between files.";
elif [ $diffs2 -eq 0 ]; then echo "There are $diffs1 differences between files.";
else echo "There are $diffs2 differences between files."; fi
echo Look at the files biquad2pipes and cascade2pipes for more information.
#Testing with3 pipes
echo
echo "TESTING WITH 3 PIPES"
cat wavfile |./biquad 1/3 0 0 0 1 | ./biquad 1 0 0 1 0 | ./biquad 2 0 0 0 0 > biquad3pipes
./cascade 1/3 0 0 0 1 1 0 0 1 0 2 0 0 0 0 < wavfile > cascade3pipes
diffs1=$(diff biquad3pipes cascade3pipes | grep "^>" | wc -l)
diffs2=$(diff biquad3pipes cascade3pipes | grep "^<" | wc -l)
if [ $diffs1 -eq 0 -a $diffs2 -eq 0 ]; then echo "No differences found between files.";
elif [ $diffs2 -eq 0 ]; then echo "There are $diffs1 differences between files.";
else echo "There are $diffs2 differences between files."; fi
echo Look at the files biquad3pipes and cascade3pipes for more information.
#Create a totalfile to be able to compare outputs
echo "" > totalfile; cat cascade1pipe >> totalfile; cat cascade2pipes >> totalfile; cat cascade3pipes >> totalfile
