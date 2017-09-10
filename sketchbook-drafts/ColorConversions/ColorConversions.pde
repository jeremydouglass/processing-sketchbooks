/**
 * Color Conversions 
 * using Processing built-ins and java.awt.Color
 * 2017-06-10 Processing 3.3.3
 */

translate(30,30);
// default RGB color mode
colorMode(RGB);
// create a standard color
color crgb = color(255, 127, 63);
// draw it
fill(crgb);
rect(0,0,10,10);
// extract either RGB or HSB values while in RGB colorMode
// note that hue precision involves rounding
println(red(crgb), green(crgb), blue(crgb));
println(hue(crgb), saturation(crgb), brightness(crgb));

// switch to HSB -- keep the units (255) the same, this matters
colorMode(HSB); // colorMode(HSB, 255, 255, 255);
// define the same color (almost) using HSB values
// note that this is stored as RGB
color chsb = color(14.166, 192, 255);
// draw it
fill(chsb);
rect(10,0,10,10);
// extract either RGB or HSB values while in HSB colorMode
println(red(chsb), green(chsb), blue(chsb));
println(hue(chsb), saturation(chsb), brightness(chsb));

// import java color conversion methods
import java.awt.Color;
// switch to HSB using Java normal units
colorMode(HSB, 1.0, 1.0, 1.0);
// define almost the same color in normal units
// note that this is stored as RGB
color chsb2 = color(0.055, 0.753, 1.0);
// draw it
fill(chsb2);
rect(0,20,10,10);
// use processing built-ins to extract the HSB values
println(hue(chsb2), saturation(chsb2), brightness(chsb2));
// convert those values back into an RGB color int
// note that the java.awt.Color method ignores Processing colorMode
// ...it always takes HSB(1.0) and always returns RGB(255)
int crgb2 = Color.HSBtoRGB(hue(chsb2), saturation(chsb2), brightness(chsb2));
//draw it
fill(crgb2);
rect(10,20,10,10);

// switch to RGB(255) (explicitly reset to default)
colorMode(RGB, 255, 255, 255);
// extract an array of normalized HSB(1.0) values
float hsbvals[] = Color.RGBtoHSB(255, 127, 63, null); // https://docs.oracle.com/javase/7/docs/api/java/awt/Color.html#RGBtoHSB(int,%20int,%20int,%20float[])
println(hsbvals[0], hsbvals[1], hsbvals[2]);
// switch to HSB(1.0)
colorMode(HSB, 1.0, 1.0, 1.0);
// create a new HSB color with normal values
// note that this is stored as RGB
color chsb3 = color(hsbvals[0], hsbvals[1], hsbvals[2]);
// draw it
fill(chsb3);
rect(30,20,10,10);