/**
 * String Saving and Loading
 * 2016-09-10 Jeremy Douglass
 * Processing 3.2.1 -- tested on OS X 10.10.5
 * 
 */

String lineData1[] = {"apple banana", "cherry"};
String lineData2[] = {"foo bar", "baz"};
String lineData3[] = {"lorem ipsum", "sit"};
String lineData4[] = {"head shoulders", "knees"};
String sketchPathData[] = {"I'm text in the sketch path", ""};
String dataPathData[]   = {"I'm text in the data path", ""};

void setup(){
  println("** Save and load a bare filename: **");
  saveAndLoadStrings("fileNameOnly.txt", lineData1);

  println("** Save and load using dataPath:* *");
  saveAndLoadStrings(dataPath("fileInDataPath.txt"), lineData2);

  println("** Save and load using a relative path prefix (data): **");
  saveAndLoadStrings("data/fileWithDataPrefix.txt", lineData3);

  println("** Save and load using a relative path prefix ** \n(anything other than data, even if folder doesn't exist):");
  saveAndLoadStrings("other/fileWithDataPrefix.txt", lineData4);

  println("** What if a filename 'duplicate.txt' is saved in both sketch folder and /data? **");
  saveStrings("duplicate.txt", new String[]{"I'm in the sketch path", ""});
  saveStrings(dataPath("duplicate.txt"), new String[]{"I'm in the data path", ""}); 
  String[] duplicateResults = loadStrings("duplicate.txt"); //// THIS LOADS FROM DATA, NOT SKETCH
  print("Loading 'duplicate.txt' shows:\n     "); println(duplicateResults);
}

String[] saveAndLoadStrings (String filename, String[] fileData){
  saveStrings(filename, fileData);
  String[] loaded = loadStrings(filename);
  print("Save/Loading: "); println(filename);
  print("     Saving:  "); println(fileData[0]);
  print("     Loading: "); println(loaded[0]);
  println();
  return loaded;
}