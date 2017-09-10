JSONObject services;
JSONArray trackers;
String[] companyNames = {"33Across", "LoremIpsum"};

void setup() {
  services = loadJSONObject("data/services.json"); 
  trackers = services.getJSONObject("categories").getJSONArray("Advertising");
  String[] missing = untracked(trackers, companyNames);
  for(String s : missing){
    println("Missing:", s);
  }
}


String[] untracked(JSONArray json, String[] names) {
  String[] results = {};
  for (String s : names) {
    if (!isTracked(json, s)) {
      results = append(results, s);
    }
  }
  return results;
}

boolean isTracked(JSONArray json, String name) {
  for (int i=0; i<json.size(); i++) {
    if (json.getJSONObject(i).hasKey(name)) { 
      return true;
    }
  }
  return false;
}



//try 
//{ 
//  url = url.getJSONObject("http:/" + name + "/");
//  // process_result(job.getJSONObject("result"));
//} 
//catch (Exception e) 
//{ 
//  println(e);
//} 

//JSONArray trackers = values.getJSONArray("Advertising");

// JSONObject test = trackers.getJSONObject(0); 
// test = test.getJSONObject(0); 
// println(test);  