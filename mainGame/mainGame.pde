ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<BossEnemy> bosses = new ArrayList<BossEnemy>();
int score = 0;
int totalHealth = 10;
float health = 1;
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
int i;
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
  
  //
  //fix the health system...
  //
  
  background(150);
  rect(width/10, height*0.9, width/10, height * (-health));
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
  
  if(keys['P'])
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
      textSize(50);
      text("Game Over", width/2, height/3);
      totalHealth++;
      health = totalHealth /10;
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
    //float blltX, blltY;
    b.update();
    b.render();
    //running a function to display the x value of the bullet.
    /*blltX = b.displayx();
    blltY = b.displayy();
    //println("x cor of bullet: " + blltX);
    //
    //this is kind of redundant now...
    //
    if(blltX > width+10 || blltX < -10 || blltY > height +10 || blltY < -10)
    {
      b.removebullet();
      //bullets.remove(bullets b);
    }*/
  }

//  println("bullet x pos is" + bullets.get(b.xCor));
}

void reset()
{
  

    setup();
    //draw();
  
}