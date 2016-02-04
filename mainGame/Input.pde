class Input
{  
  int scoreChk;
  int temp;
  String playerName = "";
  
  //scoreArray is the array of scores and names.
  String[] scoreArray = new String[7];
  
  Input()
  {
    
  }
  
  int scoreCheck(int score, String Score_File, int readFile)
  {
    println("your score was: " + score);
    //reading the data in to the array lines[]
    String lines[] = loadStrings(Score_File);
    
    //duplicating the array into scoreArray
    arrayCopy(lines, scoreArray);
    
    //looping through the lines of the array
    for(int i = 0 ; i < 7 ; i++)
    {
      //splitting up each line 
      String data[] = lines[i].split(","); 
      
      //converting the string in the file to an int 
      scoreChk = Integer.parseInt(data[1]);
      
      //checking if the current users score is greater than the score in the file "scoreChk"
      //and if the readFile value is 0
      if(score > scoreChk && readFile == 0)
      {
        //run the function to get the players name
        playerName = enterName(playerName);
        //creating a string with the players name and score
        String newScore = (playerName + "," + str(score));
        //splice the newScore string into the array
        scoreArray = splice(scoreArray, newScore, i);
        //remove the last element so there are only 7 highscores
        scoreArray = shorten(scoreArray);
        //set the read file value to 1 so the program wont read it again
        readFile = 1;
        println("you got a high score!!");
        break;
      }
    }
    //overwrite the old high scores with the updated highscore file
    saveStrings(dataPath(Score_File), scoreArray);
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







/*
import javax.swing.*; 
String userName = "aa";

void setup()
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
  size(500,500);

}

void draw()
{
      background(0);
      text(userName, width/2, height/2);
      
}
*/