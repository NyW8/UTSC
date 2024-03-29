//Created by Nyah Way August 9th, 2019
//Final exam review for CSCB09 Summer 2019





//SYSTEM CALLS:
//opens a path given with flags
int open(const char *path, int flags/*, mode_t mode*/);
/*	flags:
	O_APPEND - appends all writes to the end of file
	O_TRUNC - removes file contents before writing anything
	O_RDONLY - read only mode
	O_WRONLY - write only mode
	O_RDWR - read and write mode
	O_NONBLOCK - open in nonblocking mode (otherwise, a process must wait until the previous one finishes)
	note: can add multiple flags e.g. 'O_APPEND | O_TRUNC | O_RDONLY' <- without quotes
	*/
	
//fcntl: File CoNTroL, used to set/change flags that a file has
int fcntl(int fd, F_SETFL, O_NONBLOCK)

//read from a file descriptor, returns number of bytes successfully read
ssize_t read(int fd, void *buf, size_t n)
//write to a file descriptor, returns the number of bytes successfully written
ssize_t write(int fd, const void *buf, size_t n);
/*	fd - file descriptor
	buf - buffer to read from/to
	n - number of bytes requested to read/write (actual number returned by function)
	*/

//call another process to take over the current one, 
//returns -1 if didn't work or doesn't continue current execution otherwise
int execlp(const char *path, const char *arg, ..., (char *)NULL);
//note: need to have the path as the first argument

//creates another process as an almost exact duplicate (including current spot in execution)
//returns 0 if child process, returns child process id if parent process
pid_t fork(void);

//creates a pipe, pipefd[0] is read end, pipefd[1] is write end
int pipe(int pipefd[2]);

//duplicates the oldfd into the newfd, newfd now holds a copy of the oldfd
int dup2(int oldfd, int newfd);
//e.g: below line duplicates read end of pipe to stdin, now reading from stdin reads from pipe
dup2(newpipe[0], 0);

//monitor given sets for ability to do operations (e.g. monitor files in readset for ability to read, exceptset for exceptions, etc)
//returns number of items ready for given operation, or 0 on timeout, -1 on error
int select(int n, fd_set *readset, fd_set *writeset, fd_set *exceptset, struct timeval *timeout);
//usually used with a for loop afterwards to check which file is available for which operation
/*	n - maximum number of descriptors ready for operation (use 1 + given number of files)
	timeout - length to wait before giving up on files (set timeval.tv_sec for seconds and timeval.tv_usec for microseconds)
	note: timeout counts down, value on exit will be time left to wait
		if timeout == NULL, will wait forever for operations
		if timeout == 0, returns answer immediately
	*/

//operations on fd_sets:
void FD_ZERO(fd_set *s);		//sets all values in the set to 0
void FD_SET(int fd, fd_set *s);	//add descriptor fd into set s
void FD_CLR(int fd, fd_set *s);	//remove descriptor fd from set s
int FD_ISSET(int fd, fd_set *s);//check if fd is part of set s, returns 0/1





//C LIBRARY:
//allocating memory:
void *malloc(size_t s);	//allocates a block of memory of size s
void *calloc(size_t n, size_t s);	//allocates n blocks of memory of size s

//unallocating memory:
void free(void *ptr);	//free block of memory at ptr

//opens a file by file name and returns a file pointer to do stuff with
FILE *fopen(const char *path, const char *mode);
//opens a file by fd number and returns a file pointer to do stuff with
FILE *fdopen(int fd, const char *mode);
/*modes: 
	r - open for reading (error if doesn't exist)
	w - open for writing (creates if doesn't exist)
	a - open for appending	(creates if doesn't exist)
	r+ - open for reading and writing (error if doesn't exist)
		 does not delete contents of file if it exists
	w+ - open for writing and reading (creates if doesn't exist)
		 overwrites the file if it exists
	a+ - open for appending and reading (creates if doesn't exist)
	*/

//write to a stream/file
int fprintf(FILE *fptr, const char *str, ...);
//e.g write something to stdout:
fprintf(1, "%d: %s %lf\n", 123, "this is a string", 3.1415);

//read from a stream/file
int fscanf(FILE *fptr, const char *str, ...);

//get input from a stream/file, returns the number of bytes read
size_t fread(void *buf, size_t size, size_t n, FILE *fptr);
//output to a stream/file, returns the number of bytes written
size_t fwrite(const void *buf, size_t size, size_t n, FILE *fptr);
/*	buf - buffer to read/write input to
	size - size of each element to read/write (e.g. char is 1, int is 4)
	n - number of elements each with size bytes
	fptr - input/output stream
	*/








//C PREPROCESSOR DIRECTIVES:
#include <path>		//searches for path in system directories
#include "path"		//searches for path in current directory

#define MY_CONSTANT const_value_here	//replace MY_CONSTANT with const_value_here everywhere it is found
#undefine MY_CONSTANT					//stops replacement of MY_CONSTANT

#ifdef MY_CONSTANT		//do next code if MY_CONSTANT is defined
#endif

#ifndef MY_CONSTANT		//do next code if MY_CONSTANT is not defined
#elif MY_OTHER_CONSTANT	//do next code if MY_OTHER_CONSTANT is defined instead
#else					//do next code in all other cases
#endif