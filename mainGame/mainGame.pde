ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<BossEnemy> bosses = new ArrayList<BossEnemy>();

void setup()
{
  size(1000, 1000);
  player = new Player();
  textSize(32);
  text("Zombi33z", width/2, height/2);

}

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
  background(150);
  textSize(32);
  text("Zombi33z", width/2, height/2);
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
  
    for(Bullet b: bullets)
  {
    float blltX, blltY;
    b.update();
    b.render();
    //running a function to display the x value of the bullet.
    blltX = b.displayx();
    blltY = b.displayy();
    //println("x cor of bullet: " + blltX);
    if(blltX > width+10 || blltX < -10 || blltY > height +10 || blltY < -10)
    {
      b.removebullet();
      //bullets.remove(bullets b);
    }
  }

//  println("bullet x pos is" + bullets.get(b.xCor));
}

void reset()
{
  

    setup();
    //draw();
  
}