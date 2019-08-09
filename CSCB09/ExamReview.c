
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






