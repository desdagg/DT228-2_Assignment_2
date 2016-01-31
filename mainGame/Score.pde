class Score
{
  int i;
  
  Score()
  {
    
  }
  
  void displayScores(String Score_File)
  {
    background(0);
    fill(255);
  
    String lines[] = loadStrings(Score_File);
    
    for(int i = 0 ; i < 7/*lines.length*/ ; i++)
    {
      String data[] = lines[i].split(","); 
      textAlign(LEFT);
      text(i+1 + ". " + data[0] + "          " + data[1] , width*0.3, height * ((i+1.99)/10));
      println(data[0]);
    }
    
    textAlign(CENTER);
    text("High Scores", width/2, height * 0.1);
    text("Press C to go back", width/2, height * 0.9);
  
  }
}