make -f Makefile
echo Testing with:
echo threshold:255 maxDepth:15
./roundtrip ./test.pgm ./test_threshold_255_15.pgm 255 15
echo threshold:100 maxDepth:15
./roundtrip ./test.pgm ./test_threshold_100_15.pgm 100 15
echo threshold:50 maxDepth:15
./roundtrip ./test.pgm ./test_threshold_50_15.pgm 50 15
echo threshold:1 maxDepth:2
./roundtrip ./test.pgm ./test_threshold_1_2.pgm 1 2
echo threshold:1 maxDepth:4
./roundtrip ./test.pgm ./test_threshold_1_4.pgm 1 4
echo threshold:1 maxDepth:6
./roundtrip ./test.pgm ./test_threshold_1_1.pgm 1 6
echo threshold:1 maxDepth:7
./roundtrip ./test.pgm ./test_threshold_1_7.pgm 1 7
echo threshold:3 maxDepth:4
./roundtrip ./test.pgm ./test_threshold_4_3.pgm 4 3
echo threshold:100 maxDepth:7
./roundtrip ./test.pgm ./test_threshold_100_7.pgm 100 7
