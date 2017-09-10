/**
 * Reverse CSV
 * 2016-10-28 Processing 3.2.1
 * based on the loadTable() example
 *
 * The following short CSV file called "mammals.csv" is parsed 
 * in the code below. It must be in the project's "data" folder.
 *
 *    id,species,name
 *    0,Capra hircus,Goat
 *    1,Panthera pardus,Leopard
 *    2,Equus zebra,Zebra
 *
 * Output:
 *
 * 2 Equus zebra
 * 1 Panthera pardus
 * 0 Capra hircus
 **/


Table table;
void setup() {
  table = loadTable("mammals.csv", "header");
  TableRow row;
  for (int i = table.getRowCount()-1; i>=0; i--){
    row = table.getRow(i);
    println(row.getString("id"),row.getString("species"));
  }
}