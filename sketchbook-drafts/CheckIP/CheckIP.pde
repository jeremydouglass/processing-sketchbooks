String[] IPs = { "a", "b", "c" };
int currentIP = -1;
int checkIP = 5000;
int checkPing = 750;
int nextIP;
int nextPing;

void draw() {
  // next IP
  if (millis() > nextIP){
    nextIP = millis() + checkIP;
    nextPing = millis()+ checkPing;
    currentIP = (currentIP+1)%(IPs.length);
  }
  // next ping
  if(millis() > nextPing){
    println("Pinging " +  IPs[currentIP] + " " + millis());
    nextPing = millis()+checkPing;
  }
}