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


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	