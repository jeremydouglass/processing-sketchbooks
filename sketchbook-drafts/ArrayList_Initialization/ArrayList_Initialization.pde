/**
 * ArrayList Initialization
 * 2016-10-06 Jeremy Douglass
 * https:// forum.processing.org/two/discussion/18439/is-there-a-more-efficient-way-to-set-up-a-large-arraylist-than-adding-one-item-at-a-time#latest
 * For discussion see http:// stackoverflow.com/questions/1005073/initialization-of-an-arraylist-in-one-line/3676539#3676539
 **/

ArrayList<String> strings = new ArrayList<String>(java.util.Arrays.asList(
  "Lorem", "ipsum", "dolor", "sit", "amet", "consectetur",
  "adipiscing", "elit", "sed", "do", "eiusmod", "tempor",
  "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua."
));

void setup(){
  size(200,200);
  for(String s : strings){
    print(s+' ');
  }
}
void draw(){
  background(0);
  text("ArrayList Initialization",10,20);
  text(strings.get(second()%strings.size()),10,height/2);
}