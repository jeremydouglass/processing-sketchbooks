# incomplete draft for:
# https://forum.processing.org/two/discussion/24026/how-can-i-save-the-previous-state-of-an-array-to-recall-in-the-next-loop#latest

int peopleNum;
int maxPeople = 6;
float[] newX;
float[] newY;
float[] oldX;
float[] oldY;

void setup() { 
  size(200, 400);
  frameRate(1);
  oldX = new float[maxPeople];
  oldY = new float[maxPeople];
  newX = new float[maxPeople];
  newY = new float[maxPeople];
}

void draw() {
  for(float f : newVals){
    line(
  }
  arrayCopy(oldVals, newVals);
}

void newData(float[] x){
  peopleNum = int(random(1, 6));
  //for the amount of people present, DO THIS 
  for (int i = 0; i < peopleNum; i++) {    
    //create a random number
    x = int(random(500));
    //put that random number into the array corresponding to people no
    newVals[i] = x;
  }
}