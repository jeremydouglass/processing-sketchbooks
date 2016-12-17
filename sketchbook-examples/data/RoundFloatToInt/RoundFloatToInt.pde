/**
 * Round Float to Int
 * 2016-10-24 Processing 3.2.1
 * https:// forum.processing.org/two/discussion/18679/convert-float-string-to-string
 **/
 
float f5_1 = 5.123;
float f5_9 = 5.987;

// round() function
println ( f5_1, "round()", round(f5_1) ); // 5.1 = 5
println ( f5_9, "round()", round(f5_9) ); // 5.9 = 6

// int() function
println ( f5_1, "int()  ", int(f5_1) );   // 5.1 = 5
println ( f5_9, "int()  ", int(f5_9) );   // 5.9 = 5

// (int) cast
println ( f5_1, "(int)  ", (int)f5_1 );   // 5.1 = 5
println ( f5_9, "(int)  ", (int)f5_9 );   // 5.9 = 5

// floor() function
println ( f5_9, "floor()", floor(f5_1) ); // 5.1 = 5
println ( f5_9, "floor()", floor(f5_9) ); // 5.9 = 5

// ceil() function
println ( f5_1, "ceil() ", ceil(f5_1) );  // 5.1 = 6
println ( f5_9, "ceil() ", ceil(f5_9) );  // 5.9 = 6

// ...convert rounded float to string
println ( f5_9, "str(round())", str(round(f5_9)) ); // 5.9 = "6"