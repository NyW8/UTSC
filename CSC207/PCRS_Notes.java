//Created by Nyah Way, for St. George's CSC207 class
//This is a file with notes from the PCRS resource


//Quest 1
//Hello World
//  - No code exists outside a class
//	- There are no functions, but methods exists
	public static void main(String[] args){}
//	- when a class is run, this method is automatically called
//	- public declares what has access to that object
	System.out.println(5+7);
//	- System is the class
//	- out is a static member in the class
//	- println is a method within that member
//	- 5+7 is the expression

//Variables
	int i;						//default value for int is 0
	Object obj;					//default value for any object is null
	String name = "CSC207";		//note the capital 'S' and double quotes
	boolean isTrue = false;		//lowercase boolean values (true/false)
	double gpa = 0.0;
//	Errors:
	number = 42;			//didn't declare variable
	int i = 19.22;			//type mismatch: can't convert double to int
	int i = 1; int i = 2;	//duplicate local variable
	
//References vs Primitives
//	- Java has primitive and reference types
//	- primitive types directly hold values, while reference types point to values
//	- primitive types start with lower case letters (int, boolean, etc)
//	- reference types start with upper case letters (String, etc) can call using String s1 = new String("...");
//	- call stack keeps track of what method we're running
//	- object space is where objects are stored
//	- static space is where static members of a class are stored
//	- string variables from the call stack get an id referencing the String object in the object space

//Strings pt 1
//	- Strings are immutable (can't ever change a String variable once created, but can perform operations on it)
	String s3 = s2 + s1;		//add two strings to make a new one
	char c = s1.charAt(2);		//get the character at index 2
	s1 = s1.substring(2, 4);	//slice a string (like s1[2:4])
	s1 = "       I am a string  .    ";
	s1 = s1.trim();				//get rid of extra spaces
//	- other methods: length, startsWith, indexOf, etc...
//	- for mutable strings:
	StringBuilder sb = new StringBuilder("hi");
	sb.append(" world.");		//now contains "hi world."
	sb.insert(2, " there");		//now contains "hi there world."
	sb.setCharAt(14, '!');		//now contains "hi there world!" (note single quotes for char)
	sb.reverse()
//	- adding Strings can be slow because it creates a whole new string each time
//	- appending to StringBuilders is faster because it modifies an existing one
	
//Strings pt 2
	String a = new String("abcd");
	String b = new String("abcd");
	System.out.print(a == b);
//	- returns false because a and b have been declared as 'new'
	String a = "abcd";
	String b = "abcd";
	System.out.print(a == b);
//	- returns true because Java tries to reuse string locations, sets 'b' to point to same spot as 'a'
	String a = "hello";
	String a = new String("hello");
	String a; a = new String("hello");
	String a; a = "hello";
//	- all of above are valid initializations
	String a = "hi"; a = "hello";
//	- NOT valid

//Classes
	int i = ___; String val = String.valueOf(i);	//turns an int to a string
	System.out.println(Integer.BYTES);				//prints the number of bytes of an integer
//	- automatic de-allocation when variable doesn't refer to anything, don't need to free anything
//	- can explicitly de-allocate by setting a variable to null

//Arrays pt 1
//	- array length can't be changed
//	- all elements must be of the same type
//	- arrays are reference types, not primitive types
	int[] nums;			//an array of ints, nums is a variable that refers to the array
	nums = new int[5];	//all indices contain default value, 0
	int[] nums = {1,2,7,109,888};	//array holds {1,2,7,109,888}
	nums[1] = 81;					//array holds {1,81,7,109,888}
//	- no negative indices, no slicing
//	- add different types into same array:
	Object[] rand = new Object[5];
	rand[0] = new String("hello"); rand[1] = new Integer(1000); rand[2] = new Monster("Fred");
	rand[3] = new int[50];			//array inside an array
	Object element = rand[0];		//add the first element into another variable
	String element = rand[0];			//DOESN'T WORK, even if rand[0] is a string
	String element = (String)rand[0];	//works if rand[0] can be typecast to a string
	int[][] table;					// 2D array
	
//Alias pt 1
//	- can only create an alias with a MUTABLE reference type (primitives don't create objects)
//	- If object is immutable (e.g. strings), changing string creates a copy
//	- if alias object changes, original still points to it
//	- careful with double & farther aliases (e.g. array of array of strings)
//	- primitive types are compared by VALUES and class types are compared by REFERENCES

	
	
	
	
	
	
	
	
	
	