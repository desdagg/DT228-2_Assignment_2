class Input
{
  //will get the score of the player at game over and write it to the highscore file
  //
  //will need a way to put it in so that the highscores are still sorted 
  //
  //should probably have it create a file if there isn't one already
  //
  //gonna need a score check function as well to check if a valid high score
  
  int newData;
  int temp;
  
  Input()
  {
    
  }
  
  void scoreCheck(int score, String Score_File)
  {
    println("your score was: " + score);
  
    String lines[] = loadStrings(Score_File);
    
    for(int i = 0 ; i < 7 ; i++)
    {
      String data[] = lines[i].split(","); 
      
      //converting the string in the file to an int
      newData = Integer.parseInt(data[1]);
      
      if(score > newData)
      {
        temp = newData;
        newData = score;
        //data[1] = str(score);
        score = temp;
        println("you got a high score!!");
      }
    }
  }
  
}