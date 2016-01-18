void setup()
{
  size(1000, 1000);
  player = new Player();
  textSize(32);
  text("Zombi33z", width/2, height/2);
}

Player player;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();

boolean[] keys = new boolean[512];

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
  
    for(Bullet b: bullets)
  {
    
    b.update();
    b.render();
  }
  
}