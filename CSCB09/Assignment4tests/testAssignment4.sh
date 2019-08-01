#Created by Nyah Way EDITED BY THE ONE AND ONLY AMAZHANG ALICE ZHANG >:3
#A testing file for Assignment 4 for CSCB09 in Summer 2019
#Feel free to use this file to test your assignment, but see the disclaimer on my github page!
#gcc -g -w server.c -o server
gcc -g -w client.c -o client

if [ ! -e lorem.txt -o ! -e gibberish.txt -o ! -e gibberish-large.txt ]; then echo "Please download ALL the testing files please!"; fi;

echo Opening client port at 12121, PLEASE HAVE SERVER SET UP BEFOREHAND
echo; echo TEST 1: lorem.txt
./client 127.0.0.1 12121 lorem.txt new_lorem.txt
val1=$(diff lorem.txt new_lorem.txt)
if [ "$val1" != "" ]; then echo Failed test 1: There were errors calling with lorem.txt;
else echo Passed test 1; rm new_lorem.txt; fi;

echo; echo TEST 2: gibberish.txt
./client 127.0.0.1 12121 gibberish.txt new_gibb.txt
val2=$(diff gibberish.txt new_gibb.txt)
if [ "$val2" != "" ]; then echo Failed test 2: There were errors calling with gibberish.txt; 
else echo Passed test 2; rm new_gibb.txt; fi;

echo; echo TEST 3: gibberish-large.txt
./client 127.0.0.1 12121 gibberish-large.txt new_gibb-large.txt
val3=$(diff gibberish-large.txt new_gibb-large.txt)
if [ "$val3" != "" ]; then echo Failed test 3: There were errors calling with gibberish-large.txt; 
else echo Passed test 3; rm new_gibb-large.txt; fi;

echo; echo TEST 4: empty.txt
./client 127.0.0.1 12121 empty.txt new_empty.txt
val4=$(diff empty.txt new_empty.txt)
if [ "$val4" != "" ]; then echo Failed test 4: There were errors calling with empty.txt; 
elif [ ! -e new_empty.txt ]; then echo "Failed test 4: Should have created a new empty file."; 
else echo Passed test 4; rm new_empty.txt; fi;

echo; echo TEST 5: SHOULD COMPLAIN ABOUT INVALID IPv4 ADDRESS:
./client a.a.a.a 12121 lorem.txt new_lorem.txt

echo; echo TEST 5.25: SHOULD NOT ASSIGN THE REQUESTED ADDRESS:
./client 127.0.0.1 00000 lorem.txt new_lorem.txt

echo; echo TEST 5.5: SHOULD REFUSE THE CONNECTION:
./client 127.0.0.1 1212 lorem.txt new_lorem.txt

echo; echo TEST 6: SHOULD COMPLAIN ABOUT TOO FEW PARAMETERS
./client 127.0.0.1 12121 lorem.txt

echo; echo TEST 7: SHOULD COMPLAIN ABOUT BEING UNABLE TO WRITE
chmod -w cannotwrite.txt
./client 127.0.0.1 12121 lorem.txt cannotwrite.txt

echo; echo TEST 8: NOT CREATING FILES IF SERVER DOES NOT SEND
./client 127.0.0.1 12121 random000.ppp TSNE.txt
if [ -e TSNE.txt ]; then echo Failed test 7: should not create new files if server could not send it!; rm TSNE.txt;
else echo Passed test 7; fi;