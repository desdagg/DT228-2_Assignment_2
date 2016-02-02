class Input
{
  Input()
  {
    
  }
  String playerName = "HGL";
  int score = 99;
  String newScore = (playerName + "," + str(score));
  String[] scoreArray/*split(newScore, ',')*/ = new String[7];
  int newData;
  int temp;
  
  
  int inputRead(String Score_File, int score, int readFile)
  {

    println("input read");
    String lines[] = loadStrings(Score_File);
    arrayCopy(lines, scoreArray);
    
    for(int i = 0 ; i < 7/*lines.length*/ ; i++)
    {
      String data[] = lines[i].split(","); 
      
      newData = Integer.parseInt(data[1]);
      println("readFile is " + readFile);
      if(score > newData)
      {
        if(readFile == 0)
        {
        scoreArray = splice(scoreArray, newScore, i);
        scoreArray = shorten(scoreArray);
       // saveStrings(dataPath(Score_File), scoreArray);
        readFile = 1;
         println("break " + i);
        }
        //return 0;
         //break;
        //i = 7;

      }
    }
    saveStrings(dataPath(Score_File), scoreArray);
     score = 0;
    // Create a new file in the sketch directory
    println("write complete");
    return readFile;
  }


  
}