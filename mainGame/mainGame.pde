ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();


String SCORE_FILE = "HighScores.csv";

Player player;
Gun gun;
Score highScore;

boolean[] keys = new boolean[512];
PImage startScreen;
PImage bloodSplat;
int score = 0;
int gameState = 0;


void setup()
{
  size(1000, 1000);
  player = new Player();
  gun = new Gun();
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
  mainMenu();
  gameOver();
  highScores();
  

  if(gameState == 2)
  { 
    background(150);
    textSize(32);
    fill(0);
    text("Score: " + score, width/10, height/10);
   
    player.showStats();
    player.render();
    player.update();
    gun.currentGun();
    
    if(keys[' '])
    {
      Enemy enemy= new Enemy();
      enemies.add(enemy);
    }
    
    for(Enemy e: enemies)
    {
      e.render();
      e.update();
    }
        
    for(int i = 0 ; i<enemies.size() ; i++)
    {
      Enemy e = (Enemy) enemies.get(i);
      
      if(!e.enemyAlive())
      {
        enemies.remove(i);
        score = score + 1;
      }
      
      if(e.touchingPlayer())
      {
        player.health--;
      }
    }
    
    if(keys['I'])
    {
      SecondEnemy secondenemy= new SecondEnemy();
      enemies.add(secondenemy);
      secondenemy.render();
      secondenemy.update();
    }
    
    
    for(Bullet b: bullets)
    {
      
      b.update();
      b.render();
    }

    
    if(!player.playerAlive())
    {
      gameState = 1;
    }
  }
}


void mainMenu()
{
  if(gameState == 0)
  {
    startScreen = loadImage("startScreen.jpg");
    background(startScreen);
    fill(250);
    textSize(50);
    textAlign(CENTER);
    text("Press G to start", width/2, height/2);
    text("Press H for High Scores", width/2, height *0.6);
    
    if(keys['G'])
    {
      gameState = 2;
    }  
    
    if(keys['H'])
    {
      gameState = 3;
    } 
  }
}


void gameOver()
{
  if(gameState == 1)
  {
    background(startScreen);
    fill(250);
    textSize(70);
    text("GAME OVER", width/2, height/2);
    text("Press C to continue", width/2, height * 0.6);
    //resetting the game 
    score = 0;
    
    for(int i = 0 ; i<enemies.size() ; i++)
    {
      enemies.remove(i);
    }
    setup();
    
    if(keys['C'])
    {
      gameState = 0;
    }
  }
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
    
//void blood()
//{
//  bloodSplat = loadImage("blood_splat1.png");
//}