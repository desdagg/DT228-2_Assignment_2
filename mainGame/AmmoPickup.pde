class AmmoPickup
{
 
  float x = random(0, width);
  float y = random(0, height);
  float w = width/40;
  float h = x + (width/20);
  AmmoPickup()
  {
    
  }
  
  void render()
  {
    fill(0,0,255);
    rect(x,y,width/20, height/20);
    fill(0);
    ellipse(x+w,y+w, width/40, height/40);
  
  }
  
  void update()
  {
    
    
  }
  
  
  
  
  
}