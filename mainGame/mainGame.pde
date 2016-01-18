void setup()
{
  size(1000, 1000);
  player = new Player();
  textSize(32);
  text("Zombi33z", width/2, height/2);
}

Player player;

void draw()
{
  background(150);
  
  player.render();
  
}