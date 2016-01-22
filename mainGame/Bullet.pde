
class Bullet extends GameCharacter
{
  float xCor;
  float yCor;
  int col = 255;
    
  void render()
  {
    // draw the bullet
    
    stroke(col);
    pushMatrix();
    translate(pos.x, pos.y);
    //println(player.p);
    rotate(theta);
    line(0, -30, 0, -5);
    popMatrix();    
  }
  
  void update()
  {
  xCor = pos.x;
  yCor = pos.y;
  
    forward.x = sin(theta);
    forward.y = - cos(theta);
      
    forward.mult(speed*5);
    pos.add(forward);
  }
  
  float displayx()
  {
    //println("bullet x pos is" + pos.x);
    return (xCor);
  }
  
  float displayy()
  {
    return (yCor);
  }
  
  //
  //dont really need this anymore
  //
  void removebullet()
  {
    col = 150;
   // pos.x = 0;
   // pos.y = 0;
    
  }
}