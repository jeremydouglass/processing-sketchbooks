
// https://processing.org/examples/loadsavejson.html

JSONObject json = loadJSONObject("styles.json");
String graph = join( json.getJSONObject("all").getJSONArray("graph").getStringArray(), ' ');
String node  = join( json.getJSONObject("all").getJSONArray("node").getStringArray(),  ' ');
String edge  = join( json.getJSONObject("all").getJSONArray("edge").getStringArray(),  ' ');
String edgeLabeled = join( json.getJSONObject("conditions").getJSONArray("edgeLabeled").getStringArray(), ' ');
String nodeLabeled = join( json.getJSONObject("conditions").getJSONArray("nodeLabeled").getStringArray(), ' ');
String edgeTagged  = join( json.getJSONObject("conditions").getJSONArray("edgeTagged").getStringArray(),  ' ');
String nodeTagged  = join( json.getJSONObject("conditions").getJSONArray("nodeTagged").getStringArray(),  ' ');


JSONObject tagjson = json.getJSONObject("tags");
String[] tags = (String[]) tagjson.keys().toArray(new String[json.size()]); // https://forum.processing.org/two/discussion/5344/how-can-i-access-a-jsonobject-keys-set
String allTagProperties = "";
String myTagString = "REF";
for (String tag : tags){
  if(myTagString.equals(tag)){
    allTagProperties = allTagProperties + join( json.getJSONObject("tags").getJSONArray(tag).getStringArray(), ' ');
  }
}

println("graph:       ", graph);
println("node:        ", node );
println("edge:        ", edge );
println("edgeLabeled: ", edgeLabeled);
println("nodeLabeled: ", nodeLabeled);
println("edgeTagged:  ",  edgeTagged);
println("nodeTagged:  ",  nodeTagged);
println("\nall tag properties:\n             ", allTagProperties);