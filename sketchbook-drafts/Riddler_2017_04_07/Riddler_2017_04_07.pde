// https://fivethirtyeight.com/features/can-you-outsmart-our-elementary-school-math-problems/
// about 1245 better

IntList deck;
IntList oAnswers;
IntList rAnswers;
int TESTS;

void setup() {
  deck = new IntList(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
  TESTS = 500000;
  oAnswers = new IntList();
  rAnswers = new IntList();
  noLoop();
}

void draw() {
  for (int reps=0; reps<TESTS; reps++) {
    deck.shuffle();
    oAnswers.append(optimal(deck));
    rAnswers.append(rand(deck));
  }
  int oSum = arrSum(oAnswers.array());
  float oAvg = oSum/(float)TESTS;
  int rSum = arrSum(rAnswers.array());
  float rAvg = rSum/(float)TESTS;
  
  println(TESTS);
  println(oAvg, rAvg);
  println((int)(oAvg-rAvg));
}

int arrSum(int... arr) {
  int sum = 0;
  for (int i : arr)  sum += i;
  return sum;
}

int rand(IntList ilist) {  
  // println(ilist.get(0), ilist.get(1));
  // println(ilist.get(2), ilist.get(3), '\n');
  return((ilist.get(0)*10+ilist.get(1))*(ilist.get(3)*10+ilist.get(4)));
}

int optimal(IntList ilist) {
  ilist.shuffle();
  IntList order = new IntList(-1, -1, -1, -1);
  for (int i=0; i<4; i++) {
    if (ilist.get(i)<5) {
      for (int s=0; s<4; s++) { 
        if (order.get(s)<0) {
          order.set(s, ilist.get(i));
          break;
        }
      }
    } else {
      for (int s=3; s>-1; s--) { 
        if (order.get(s)<0) {
          order.set(s, ilist.get(i));
          break;
        }
      }
    }
  }
  // println(order.get(0), order.get(2));
  // println(order.get(1), order.get(3), '\n');
  return((order.get(0)*10+order.get(2))*(order.get(1)*10+order.get(3)));
}