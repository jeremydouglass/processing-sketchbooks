boolean exitWhenDone;

void setup() {
  // detect command line invocation if args present
  if (args != null) {
    // default command line behavior
    exitWhenDone = true;
    // override with arguments
    for (String arg : args) {
      if ("noexit".equals(arg)) {
        exitWhenDone=false;
      }
    }
  }
}

void draw() {
  if (exitWhenDone) {
    exit();
  }
}