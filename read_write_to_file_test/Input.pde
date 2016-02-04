class Input
{
  Input()
  {
    
  }
  String playerName = "";
  int score = 99;
  //newScore is a string that wll be written to the file
  //String newScore = (playerName + "," + str(score));
  
  //scoreArray is the array of scores and names.
  String[] scoreArray = new String[7];
  
  int scoreChk;
  int temp;
  
  
  int inputRead(String Score_File, int score, int readFile)
  {

    println("input read");
    //reading the data in to the array lines[]
    String lines[] = loadStrings(Score_File);
    //duplicating the array into scoreArray
    arrayCopy(lines, scoreArray);
    
    //looping through the lines of the array
    for(int i = 0 ; i < 7 ; i++)
    {
      //splitting up each line 
      String data[] = lines[i].split(","); 
      
      //setting the scoreChk integer to the second element in the data array which is that players score
      scoreChk = Integer.parseInt(data[1]);
      
      println("readFile is " + readFile);
      //checking if the current users score is greater than the score in the file "scoreChk"
     
      //if the readFile value is 0 let the program read he file
      if(readFile == 0 && score>scoreChk)
      {
        playerName = enterName(playerName);
        String newScore = (playerName + "," + str(score));
        //splice the newScore string into the array
        scoreArray = splice(scoreArray, newScore, i);
        //remove the last element so there are only 7 highscores
        scoreArray = shorten(scoreArray);
        //set the read file value to 1 so the program wont read it again
        readFile = 1;
        println("break " + i);
      }
    }
    //overwrite the old high scores with the updated highscore file
    saveStrings(dataPath(Score_File), scoreArray);
     //score = 0;
    // Create a new file in the sketch directory
    println("write complete");
    return readFile;
  }


  String enterName(String userName)
  {
    try 
    { 
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    } 
    
    catch (Exception e)
    { 
      e.printStackTrace();
    }
    
    String preset="Enter name";
    userName = JOptionPane.showInputDialog(frame, "Enter your name", preset);
    
    if(userName != null)
    {
      text("your name is ", width/2, height/2);
    }
    return userName;
  }
  
}