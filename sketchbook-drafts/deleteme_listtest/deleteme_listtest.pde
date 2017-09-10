String lines[] = loadStrings("list.txt");
// change a specific line
if(lines.length>1){
  lines[1] = "REPLACED";
}
// find a line and change it
for (int i = 0 ; i < lines.length; i++) {
  if(lines[i].equals("dolor")==true){
    println("true");
    lines[i] = "MODIFIED " + lines[i];
  }
}
saveStrings("list-out.txt", lines);