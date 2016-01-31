class Score
{
  int i;
  
  Score()
  {
    
    //String[] lines = loadStrings(Score_File);
    
    //for(int i = 0 ; i < lines.length ; i++);
    //{
    //  String[] data = lines[i].split(","); 
      
    //  for(int j = 0 ; j < data.length ; j+=2);
    //  {
    //    text("" + data , width, height);
    //  }
    //}
  }
  
  void displayScores(String Score_File)
  {
    String[] lines = loadStrings(Score_File);
    
    for(int i = 0 ; i < lines.length ; i++)
    {
      String[] data = lines[i].split(","); 
      
      for(int j = 0 ; j < data.length ; j+=2)
      {
        text("" + data , width, height);
      }
    }
  }
}