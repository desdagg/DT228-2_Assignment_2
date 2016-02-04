String SCORE_FILE = "HighScores.csv";
Score highScore;
Input input;
boolean[] keys = new boolean[512];
int gameState = 0;
int readFile = 0;
import javax.swing.*;



void setup()
{
  size(1000, 1000);
  println(sketchPath());
  println(dataPath(SCORE_FILE));
}

void keyPressed()
{
  keys[keyCode] = true;
}


void keyReleased()
{
  keys[keyCode] = false;
}


void draw()
{
   input = new Input();
  if(gameState == 0)
  {
    background(50, 50, 50);
    text("menue, h for scores\n i for input", width/2, height/2);
    
  }
  
  if(keys['H'])
    {
      gameState = 3;
    } 
    
  if(keys['I'])
    {
      gameState = 1;
    } 
  inputScores();
  highScores();
}

void highScores()
{
    if(gameState == 3)
  {
    highScore = new Score();
    highScore.displayScores(SCORE_FILE);
  }
    if(keys['C'])
    {
      gameState = 0;
    }
}

void inputScores()
{
  
   if(gameState == 1 && readFile == 0)
   {
    readFile = input.inputRead(SCORE_FILE, 99, readFile);
    gameState = 0;
   }
    
  
}