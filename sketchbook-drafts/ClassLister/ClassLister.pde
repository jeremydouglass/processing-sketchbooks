import java.lang.reflect.Field;

ClassList pcList = new ClassList(PSurface.class);

void setup() {
  for(String s: pcList.list()){
    println(s);
  }
 exit();
}

class ClassList {
  Field[] classFields; 
  ClassList(Class c){
    classFields = c.getFields();
  }
  ArrayList<String> list() {
    ArrayList<String> slist = new ArrayList();
    // for each constant
    for (Field f : classFields) {
      String s = "";
      // object type
      s = s + f.getType();
      // field name
      s = s + " " + f.getName();
      // value
      try {
        s = s + " = " + f.get(null);
      }
      catch (IllegalAccessException e) {
      }
      // Optional special handling for field types:
      if (f.getType().equals(int.class)) {
        // ...
      }
      if (f.getType().equals(float.class)) {
        // ...
      }
      s = s + ";";
      slist.add(s);
    }
    return(slist);
  }
}