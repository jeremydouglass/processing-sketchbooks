println(X); // int X = 0;
println(Y); // int Y = 1;
println(Z); // int Z = 2;

println(JAVA2D ); // String JAVA2D = "processing.awt.PGraphicsJava2D";
println(P2D    ); // String P2D = "processing.opengl.PGraphics2D";
println(P3D    ); // String P3D = "processing.opengl.PGraphics3D";
// @Deprecated String OPENGL = P3D;
println(FX2D   ); // String FX2D = "processing.javafx.PGraphicsFX2D";
println(PDF    ); // String PDF = "processing.pdf.PGraphicsPDF";
println(SVG    ); // String SVG = "processing.svg.PGraphicsSVG";
println(DXF    ); // String DXF = "processing.dxf.RawDXF";

println(OTHER   ); // int OTHER   = 0;
println(WINDOWS ); // int WINDOWS = 1;
println(MACOSX  ); // int MACOSX  = 2;
println(LINUX   ); // int LINUX   = 3;

println(EPSILON  ); // float EPSILON = 0.0001f;
for(String s:platformNames){ println(s); } // String[] platformNames = { "other", "windows", "macosx", "linux" };

println(MAX_FLOAT ); // float MAX_FLOAT = Float.MAX_VALUE;
println(MIN_FLOAT ); // float MIN_FLOAT = -Float.MAX_VALUE;
println(MAX_INT   ); // int MAX_INT = Integer.MAX_VALUE;
println(MIN_INT   ); // int MIN_INT = Integer.MIN_VALUE;

println(VERTEX           ); // int VERTEX = 0;
println(BEZIER_VERTEX    ); // int BEZIER_VERTEX = 1;
println(QUADRATIC_VERTEX ); // int QUADRATIC_VERTEX = 2;
println(CURVE_VERTEX     ); // int CURVE_VERTEX = 3;
println(BREAK            ); // int BREAK = 4;
// @Deprecated int QUAD_BEZIER_VERTEX = 2;  // should not have been exposed

println(PI         ); // float PI = (float) Math.PI;
println(HALF_PI    ); // float HALF_PI = (float) (Math.PI / 2.0);
println(THIRD_PI   ); // float THIRD_PI = (float) (Math.PI / 3.0);
println(QUARTER_PI ); // float QUARTER_PI = (float) (Math.PI / 4.0);
println(TWO_PI     ); // float TWO_PI = (float) (2.0 * Math.PI);
println(TAU        ); // float TAU = (float) (2.0 * Math.PI);

println(DEG_TO_RAD ); // float DEG_TO_RAD = PI/180.0f;
println(RAD_TO_DEG ); // float RAD_TO_DEG = 180.0f/PI;

println(WHITESPACE ); // String WHITESPACE = " \t\n\r\f\u00A0";

println(RGB   ); // int RGB   = 1;  // image & color
println(ARGB  ); // int ARGB  = 2;  // image
println(HSB   ); // int HSB   = 3;  // color
println(ALPHA ); // int ALPHA = 4;  // image

println(TIFF  ); // int TIFF  = 0;
println(TARGA ); // int TARGA = 1;
println(JPEG  ); // int JPEG  = 2;
println(GIF   ); // int GIF   = 3;

println(BLUR      ); // int BLUR      = 11;
println(GRAY      ); // int GRAY      = 12;
println(INVERT    ); // int INVERT    = 13;
println(OPAQUE    ); // int OPAQUE    = 14;
println(POSTERIZE ); // int POSTERIZE = 15;
println(THRESHOLD ); // int THRESHOLD = 16;
println(ERODE     ); // int ERODE     = 17;
println(DILATE    ); // int DILATE    = 18;

println(REPLACE    ); //   public final static int REPLACE    = 0;
println(BLEND      ); //   public final static int BLEND      = 1 << 0;
println(ADD        ); //   public final static int ADD        = 1 << 1;
println(SUBTRACT   ); //   public final static int SUBTRACT   = 1 << 2;
println(LIGHTEST   ); //   public final static int LIGHTEST   = 1 << 3;
println(DARKEST    ); //   public final static int DARKEST    = 1 << 4;
println(DIFFERENCE ); //   public final static int DIFFERENCE = 1 << 5;
println(EXCLUSION  ); //   public final static int EXCLUSION  = 1 << 6;
println(MULTIPLY   ); //   public final static int MULTIPLY   = 1 << 7;
println(SCREEN     ); //   public final static int SCREEN     = 1 << 8;
println(OVERLAY    ); //   public final static int OVERLAY    = 1 << 9;
println(HARD_LIGHT ); //   public final static int HARD_LIGHT = 1 << 10;
println(SOFT_LIGHT ); //   public final static int SOFT_LIGHT = 1 << 11;
println(DODGE      ); //   public final static int DODGE      = 1 << 12;
println(BURN       ); //   public final static int BURN       = 1 << 13;

println(CHATTER   ); //   int CHATTER   = 0;
println(COMPLAINT ); //   int COMPLAINT = 1;
println(PROBLEM   ); //   int PROBLEM   = 2;

  // types of transformation matrices

println(PROJECTION ); //   int PROJECTION = 0;
println(MODELVIEW  ); //   int MODELVIEW  = 1;

  // types of projection matrices

println( ); //   int CUSTOM       = 0; // user-specified fanciness
println( ); //   int ORTHOGRAPHIC = 2; // 2D isometric projection
println( ); //   int PERSPECTIVE  = 3; // perspective matrix

  // shapes

println(GROUP          ); //   int GROUP           = 0;   // createShape()
println(POINT          ); //   int POINT           = 2;   // primitive
println(POINTS         ); //   int POINTS          = 3;   // vertices
println(LINE           ); //   int LINE            = 4;   // primitive
println(LINES          ); //   int LINES           = 5;   // beginShape(), createShape()
println(LINE_STRIP     ); //   int LINE_STRIP      = 50;  // beginShape()
println(LINE_LOOP      ); //   int LINE_LOOP       = 51;
println(TRIANGLE       ); //   int TRIANGLE        = 8;   // primitive
println(TRIANGLES      ); //   int TRIANGLES       = 9;   // vertices
println(TRIANGLE_STRIP ); //   int TRIANGLE_STRIP  = 10;  // vertices
println(TRIANGLE_FAN   ); //   int TRIANGLE_FAN    = 11;  // vertices
println(QUAD           ); //   int QUAD            = 16;  // primitive
println(QUADS          ); //   int QUADS           = 17;  // vertices
println(QUAD_STRIP     ); //   int QUAD_STRIP      = 18;  // vertices
println(POLYGON        ); //   int POLYGON         = 20;  // in the end, probably cannot
println(PATH           ); //   int PATH            = 21;  // separate these two
println(RECT           ); //   int RECT            = 30;  // primitive
println(ELLIPSE        ); //   int ELLIPSE         = 31;  // primitive
println(ARC            ); //   int ARC             = 32;  // primitive
println(SPHERE         ); //   int SPHERE          = 40;  // primitive
println(BOX            ); //   int BOX             = 41;  // primitive

  // shape closing modes

println(OPEN  ); //   int OPEN  = 1;
println(CLOSE ); //   int CLOSE = 2;

  // shape drawing modes

println(CORNER   ); //   int CORNER   = 0;
println(CORNERS  ); //   int CORNERS  = 1;
println(RADIUS   ); //   int RADIUS   = 2;
println(CENTER   ); //   int CENTER   = 3;
println(DIAMETER ); //   int DIAMETER = 3;

  // arc drawing modes

println(CHORD ); //   int CHORD  = 2;
println(PIE   ); //   int PIE    = 3;

  // vertically alignment modes for text

println(BASELINE ); //   int BASELINE = 0;
println(TOP      ); //   int TOP      = 101;
println(BOTTOM   ); //   int BOTTOM   = 102;

  // uv texture orientation modes

println(NORMAL ); //   int NORMAL     = 1;
println(IMAGE  ); //   int IMAGE      = 2;

  // texture wrapping modes

println(CLAMP  ); //     int CLAMP = 0;
println(REPEAT ); //     int REPEAT = 1;

  // text placement modes

println(MODEL ); //   int MODEL = 4;
println(SHAPE ); //   int SHAPE = 5;

  // stroke modes

println(SQUARE  ); //   int SQUARE  = 1 << 0;  // called 'butt' in the svg spec
println(ROUND   ); //   int ROUND   = 1 << 1;
println(PROJECT ); //   int PROJECT = 1 << 2;  // called 'square' in the svg spec
println(MITER   ); //   int MITER   = 1 << 3;
println(BEVEL   ); //   int BEVEL   = 1 << 5;

  // lighting

println(AMBIENT     ); //   int AMBIENT     = 0;
println(DIRECTIONAL ); //   int DIRECTIONAL = 1;
println(SPOT        ); //   int SPOT        = 3;

  // key constants

println(BACKSPACE ); //   char BACKSPACE = 8;
println(TAB       ); //   char TAB       = 9;
println(ENTER     ); //   char ENTER     = 10;
println(RETURN    ); //   char RETURN    = 13;
println(ESC       ); //   char ESC       = 27;
println(DELETE    ); //   char DELETE    = 127;

println(CODED ); //   int CODED     = 0xffff;

println(UP      ); //   int UP        = KeyEvent.VK_UP;
println(DOWN    ); //   int DOWN      = KeyEvent.VK_DOWN;
println(LEFT    ); //   int LEFT      = KeyEvent.VK_LEFT;
println(RIGHT   ); //   int RIGHT     = KeyEvent.VK_RIGHT;
println(ALT     ); //   int ALT       = KeyEvent.VK_ALT;
println(CONTROL ); //   int CONTROL   = KeyEvent.VK_CONTROL;
println(SHIFT   ); //   int SHIFT     = KeyEvent.VK_SHIFT;

println(PORTRAIT  ); //   int PORTRAIT  = 1;
println(LANDSCAPE ); //   int LANDSCAPE = 2;
println(SPAN      ); //   int SPAN      = 0;

println(ARROW ); //   int ARROW = Cursor.DEFAULT_CURSOR;
println(CROSS ); //   int CROSS = Cursor.CROSSHAIR_CURSOR;
println(HAND  ); //   int HAND  = Cursor.HAND_CURSOR;
println(MOVE  ); //   int MOVE  = Cursor.MOVE_CURSOR;
println(TEXT  ); //   int TEXT  = Cursor.TEXT_CURSOR;
println(WAIT  ); //   int WAIT  = Cursor.WAIT_CURSOR;

// @Deprecated int ENABLE_NATIVE_FONTS        =  1;
// @Deprecated int DISABLE_NATIVE_FONTS       = -1;
println(DISABLE_DEPTH_TEST         ); //   int DISABLE_DEPTH_TEST         =  2;
println(ENABLE_DEPTH_TEST          ); //   int ENABLE_DEPTH_TEST          = -2;
println(ENABLE_DEPTH_SORT          ); //   int ENABLE_DEPTH_SORT          =  3;
println(DISABLE_DEPTH_SORT         ); //   int DISABLE_DEPTH_SORT         = -3;
println(DISABLE_OPENGL_ERRORS      ); //   int DISABLE_OPENGL_ERRORS      =  4;
println(ENABLE_OPENGL_ERRORS       ); //   int ENABLE_OPENGL_ERRORS       = -4;
println(DISABLE_DEPTH_MASK         ); //   int DISABLE_DEPTH_MASK         =  5;
println(ENABLE_DEPTH_MASK          ); //   int ENABLE_DEPTH_MASK          = -5;
println(DISABLE_OPTIMIZED_STROKE   ); //   int DISABLE_OPTIMIZED_STROKE   =  6;
println(ENABLE_OPTIMIZED_STROKE    ); //   int ENABLE_OPTIMIZED_STROKE    = -6;
println(ENABLE_STROKE_PERSPECTIVE  ); //   int ENABLE_STROKE_PERSPECTIVE  =  7;
println(DISABLE_STROKE_PERSPECTIVE ); //   int DISABLE_STROKE_PERSPECTIVE = -7;
println(DISABLE_TEXTURE_MIPMAPS    ); //   int DISABLE_TEXTURE_MIPMAPS    =  8;
println(ENABLE_TEXTURE_MIPMAPS     ); //   int ENABLE_TEXTURE_MIPMAPS     = -8;
println(ENABLE_STROKE_PURE         ); //   int ENABLE_STROKE_PURE         =  9;
println(DISABLE_STROKE_PURE        ); //   int DISABLE_STROKE_PURE        = -9;
println(ENABLE_BUFFER_READING      ); //   int ENABLE_BUFFER_READING      =  10;
println(DISABLE_BUFFER_READING     ); //   int DISABLE_BUFFER_READING     = -10;
println(DISABLE_KEY_REPEAT         ); //   int DISABLE_KEY_REPEAT         =  11;
println(ENABLE_KEY_REPEAT          ); //   int ENABLE_KEY_REPEAT          = -11;
println(DISABLE_ASYNC_SAVEFRAME    ); //   int DISABLE_ASYNC_SAVEFRAME    =  12;
println(ENABLE_ASYNC_SAVEFRAME     ); //   int ENABLE_ASYNC_SAVEFRAME     = -12;
println(HINT_COUNT                 ); //   int HINT_COUNT                 =  13;