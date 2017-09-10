// https://forum.processing.org/two/discussion/6457/how-to-use-arguments-with-an-application-built-with-processing

void setup() {
  // detect command line invocation
  if (args != null) {
    if (args.length != 0) {
      println("args!");
    }
  }
}