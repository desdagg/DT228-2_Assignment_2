
class Bullet extends GameCharacter
{
  float xCor;
  float yCor;
    
  void render()
  {
    // draw the bullet
    stroke(255);
    pushMatrix();
    translate(pos.x, pos.y);
    //println(player.p);
    rotate(theta);
    line(0, -5, 0, 5);
    popMatrix();    
  }
  
  void update()
  {
  xCor = pos.x;
  yCor = pos.y;
  //println(xCor);
    forward.x = sin(theta);
    forward.y = - cos(theta);
      
    forward.mult(speed*2);
    pos.add(forward);
  }
  
  void display()
  {
    println("bullet x pos is" + pos.x);
  }
}