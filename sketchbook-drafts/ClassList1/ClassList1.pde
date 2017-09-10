import java.lang.reflect.Field;

InterfaceList cl = new InterfaceList();

void setup() {
  for(String s: cl.list()){
    println(s);
  }
  exit();
}

class InterfaceList {
  Field[] interfaceFields = PConstants.class.getFields(); 
  ArrayList<String> list() {
    ArrayList<String> slist = new ArrayList();
    // for each constant
    for (Field f : interfaceFields) {
      String s = "";
      // display object type
      s = s + "(" + f.getType() + ")";
      // display field name
      s = s + " " + f.getName();
      // display value
      try {
        s = s + ": " + f.get(null);
      } 
      catch (IllegalAccessException e) {
      }
      // Optionally include special display handling for different field types:
      if (f.getType().equals(int.class)) {
        // ...
      }
      if (f.getType().equals(float.class)) {
        // ...
      }
      slist.add(s);
    }
    return(slist);
  }
}