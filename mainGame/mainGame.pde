void setup()
{
  size(1000, 1000);
  player = new Player();
  textSize(32);
  text("Zombi33z", width/2, height/2);
}

Player player;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

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
  
  player.render();
  player.update();
  
  
  if(keys['P'])
  {
    Enemy enemy= new Enemy();
    enemies.add(enemy);
    /*for (i = 0 ; i<20 ; i++)
    {
      if(i < 20)
      {
        Enemy enemy= new Enemy();
        enemies.add(enemy);
      }
    }*/
  }
  
  
for(Enemy e: enemies)
      {
        e.render();
        e.update();
      }

  
    for(Bullet b: bullets)
  {
    
    b.update();
    b.render();
  }
  
}