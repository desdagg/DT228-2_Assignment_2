ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<BossEnemy> bosses = new ArrayList<BossEnemy>();
PImage startScreen;
PImage bloodSplat;
int score = 0;
int totalHealth = 300;
float health = totalHealth;
int gameState = 0;
void setup()
{
  size(1000, 1000);
  player = new Player();
  gun = new Gun();
  //textSize(32);
  //text("Zombi33z", width/2, height/2);

}

//
//you need to make a menue
//

Player player;

Gun gun;


boolean[] keys = new boolean[512];
//int i;
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
    noFill();
    stroke(0);
    rect(width *0.60, height/15, map(totalHealth, 0, totalHealth, 0, width/3), height/40);
    fill(255,0,0);
    text("Health", width * 0.65, height/17);
    rect(width *0.60, height/15, map(health, 0, totalHealth, 0, width/3), height/40);/*height * -0.9(-health)*/
    textSize(32);
    //text("Zombi33z", width/2, height/2);
    fill(0);
    //text("health: " + health, (width/10) * 3, height/10);
    text("Score: " + score, width/10, height/10);
   
    player.render();
    player.update();
    
    
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
      
      if(!e.playerAlive())
      {
        health--;
      }
    }
    
  
    if(keys['O'])
    {
      BossEnemy bossenemy = new BossEnemy();
      bosses.add(bossenemy);
    }
    
    for(BossEnemy boss: bosses)
    {
      
      boss.render();
      boss.update();
    }
    
    for(int i = 0 ; i<bosses.size() ; i++)
    {
      BossEnemy boss = (BossEnemy) bosses.get(i);
      if(!boss.enemyAlive())
      {
        bosses.remove(i);
        score = score + 2;
      }
      if(!boss.playerAlive())
      {
        health--;
      }
    }
    
    for(Bullet b: bullets)
    {
      
      b.update();
      b.render();
    }
    
    if(health <= 0)
    {
      gameState = 1;
    }
  }
}

void mainMenu()
{
  if(gameState == 0)
  {
    //background(60,190,0);
    startScreen = loadImage("startScreen.jpg");
    background(startScreen);
    //stroke(255);
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
    //resetting the game variables
    health = totalHealth;
    score = 0;
    for(int i = 0 ; i<enemies.size() ; i++)
    {
      enemies.remove(i);
    }
    for(int i = 0 ; i<bosses.size() ; i++)
    {
      bosses.remove(i);
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
    background(0);
    textAlign(CENTER);
    fill(255);
    text("high scores will go here", width/2, height/2);
    text("Press C to go back", width/2, height * 0.6);
  }
  if(keys['C'])
  {
    gameState = 0;
  }
}
    
void blood()
{
  bloodSplat = loadImage("blood_splat1.png");
}

void reset()
{
  

    setup();
    //draw();
  
}