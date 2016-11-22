/**
 * Numeric Types in Processing
 * 2016-09-28 Jeremy Douglass
 * Processing 3.2.1
 * Some basic properties of Java numeric types.
 * based on http:// stackoverflow.com/questions/4097694/float-int-implicit-conversion
 **/
float f;
float fout;
int i;
int iout;
 
void setup(){
  f = 10.0;
  i = 3;
 
  fout = f;   println(fout); //// 10.0      = 10.0
  fout = i;   println(fout); ////  3        =  3.0
  fout = i/f; println(fout); ////  3 / 10.0 =  0.3
  fout = f/i; println(fout); ////  10.0 / 3 =  3.3333333
 
  iout = i/i; println(iout); ////  3 / 3    =  1
  //// Type mismatch, "float" does not match with "int"
  // iout = f;
  // iout = i/f;
  // iout = f/i;
 
  println(8.0 / 5.0); //// 1.6
  println(8.0 / 5);   //// 1.6
  println(8   / 5.0); //// 1.6
  /// BUT, an int divided by an int is an int -- decimal is truncated
  println(8   / 5);   //// 8/5 = 1 instead of 1.6
}