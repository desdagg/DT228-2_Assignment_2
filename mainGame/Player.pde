class Player extends GameCharacter
{
  
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.5f;
  
  Player()
  {
    super(width * 0.5f, height  * 0.5f, 50);     
    println("In Player Default Constructor");
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    
    if (keys['W'])
    {
      pos.add(forward);
    }
    
  }
  
  
  void render()
  {
    
    angle = atan2( mouseY - height/2, mouseX - width/2 );
    float dir = (angle - targetAngle) / TWO_PI;
    dir -= round( dir );
    dir *= TWO_PI;
    
    targetAngle += dir * easing;
    
    pushMatrix();
    translate(pos.x, pos.y);
    //float x = mouseX;
    //float y = mouseY;
    rotate( targetAngle );
    stroke(0);
    fill(255, 0, 0);
    //player shoulders
    rect(p-7, p+10, 14, 15);
    rect(p-7, p-10, 14, -15);
    fill(0);
    //player hand
    rect(p+7, p+10, 14, 15);
    fill(180,150,0);
    //player head
    ellipse(p,p,28,28);
    popMatrix();
  }
}