/** InsertionSort with no thread
  * 2017-04-02 - Jeremy Douglass - Processing 3.2.3 - based on a sketch by isaac328 
  * forum.processing.org/two/discussion/21696/updating-outside-of-draw
 **/
int N = 10;
boolean pause;
InsertionSorter iSort;
InsertionSorter iSort2;

void setup() {
  size(400, 200);
  iSort = new InsertionSorter(N, width, height/2);
  iSort2 = new InsertionSorter(N, width, height/2);
  frameRate(21);
}

void draw() {
  if (!pause) {
    background(0);
    iSort.step();
    iSort.render(0,0);
    if(iSort2.sorted){ iSort2.reset(); }
    iSort2.step();
    iSort2.render(0,height/2);
    text("Space to pause\nEnter to restart\n+/- speed", 5, 15);
  }
}

void keyReleased() {
  // pause
  if (key==' ') {
    pause = !pause;
  }
  // restart
  if (!pause && keyCode==ENTER) {
    iSort.reset();
    iSort2.reset();
  }
  // adjustable speed
  if (!pause && key=='-' && frameRate > 10) {
    frameRate(frameRate-10);
  }
  if (!pause && key=='=' || key=='+') {
    frameRate(frameRate+10);
  }
}

class Sorter {
  int[] arr;
  int i, j, swap;
  int w, h, size;
  boolean sorted;
  Sorter(int size_, int w_, int h_) {
    size = size_;
    arr = new int[size];
    w = w_/size;
    h = h_/size;
    // values
    for (int i = 0; i < size; i++) {
      arr[i] = i;
    }
    shuffle();
  }
  void render(float x, float y) {
    pushMatrix();
    translate(x,y);
    for (int i = 0; i < arr.length; i++) {
      pushStyle();
      if (i == j) {           // if it is the counter
        fill(255, 0, 0);      // make it red
      }
      else if (arr[i] == i) { // if in the correct spot
        fill(0, 255, 0);      // make it green
      }
      else {                  
        fill(255);            // else make it white
      }
      rect(i * w, (h * size), w, -(arr[i] * h));
      popStyle();
    }
    popMatrix();
  }
  void reset() {
    i = j = swap = 0;
    shuffle();
    sorted = false;
  }
  void shuffle(){
    IntList list = new IntList(arr);
    list.shuffle();
    arr = list.array();
  }
}

class InsertionSorter extends Sorter {
  InsertionSorter(int size, int w_, int h_) {
    super(size, w_, h_);
  }
  void step() {
    if (j>0) { // item unsorted
      if (arr[j-1] > arr[j]) { // item swap
        swap = arr[j];
        arr[j] = arr[j-1];
        arr[j-1] = swap;
        j--; // next item comparison
      } else { // item done
        j=-1;
        return;
      }
    }
    if (j<1) { // need new item
      if (i<arr.length-1) { // next item
        i++;
        j=i;
      } else { // array all sorted
        sorted = true;
        return;
      }
    }
  }
}