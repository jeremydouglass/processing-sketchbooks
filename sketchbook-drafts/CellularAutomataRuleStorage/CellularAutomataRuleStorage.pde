// https://forum.processing.org/two/discussion/comment/90825/#Comment_90825
// Cellular automaton's rules storage

// ArrayList<Rule> rules;

RuleList r1;
RuleList r2;

void setup(){
  noLoop();
  r1 = new RuleList();
  r1.put(0, 1, "1", "1", "1");
  r1.put(1, 2, "3", "2", "1");
  r1.put(2, 3, "1", "2", "3");
}

void draw(){
  println(r1.get(1, "3", "2", "1"));
  println(r1.get(2, "1", "2", "3"));
  println(r1.get(3, "2", "0", "0"));
}

class RuleList {
  HashMap<String, Integer> rules = new HashMap<String, Integer>();
  RuleList(){}
  int get(int cellState, String... neighborCounts){
    return rules.get(str(cellState) + ',' + join(neighborCounts, ','));
  }
  void put(int cellState, int newState, String... neighborCounts){
    rules.put(str(cellState) + ',' + join(neighborCounts, ','), newState);
  }
  int remove(int cellState, String... neighborCounts){
    return rules.remove(str(cellState) + ',' + join(neighborCounts, ','));
  }
}



int cellUpdate (int cellState, int[] neighborStateCounts, RuleList rules) {
  int newState = 0;
  // ... do something with rules ...
  return newState;
}