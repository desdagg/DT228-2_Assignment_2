ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<BossEnemy> bosses = new ArrayList<BossEnemy>();
int score = 0;
int totalHealth = 300;
float health = totalHealth;
int gameState = 0;
void setup()
{
  size(1000, 1000);
  player = new Player();
  textSize(32);
  text("Zombi33z", width/2, height/2);

}

//
//you need to make a menue
//

Player player;



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

  if(gameState == 2)
  { 
    background(150);
    noFill();
    stroke(0);
    rect(width *0.60, height/15, map(totalHealth, 0, totalHealth, 0, width/3), height/40);
    fill(255,0,0);
    rect(width *0.60, height/15, map(health, 0, totalHealth, 0, width/3), height/40);/*height * -0.9(-health)*/
    textSize(32);
    text("Zombi33z", width/2, height/2);
    fill(0);
    text("health: " + health, (width/10) * 3, height/10);
    text("Score: " + score, width/10, height/10);
   
    player.render();
    player.update();
    
    if(keys['M'])
    {
      reset();
    }
    
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
    }
    
    for(Bullet b: bullets)
    {
      
      b.update();
      b.render();
    }
  }
}

void mainMenu()
{
  if(gameState == 0)
  {
    background(60,190,0);
    stroke(0);
    text("Press G to start", width/3, height/2);
    if(keys['G'])
    {
      gameState = 2;
    }  
  }
}


void reset()
{
  

    setup();
    //draw();
  
}