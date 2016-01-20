class Enemy extends GameCharacter
{
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.05f;
  float xVal = random(0, width);
  float yVal = random(0, height);

  Enemy()
  {
    super(width * 0.5f, height  * 0.5f);    
    pos.x = xVal;
    pos.y = yVal;
    println("In Enemy Default Constructor");
  }
  
  void update()
  {

    //println("angle is" + angle);
    forward.x = sin(angle);
    forward.y = -cos(angle);
    forward.mult(speed);

         if (keys['L'])
    {
      println("value of enemy" + xVal +pos);
      if(pos.y > 0)
      {
        
        pos.add(forward);
      }
    }
      

  }
  
  void render()
  {

    //enemy angle facing the player position
    angle = atan2(pos.y - player.pos.y, pos.x - player.pos.x);
    
    float dir = (angle - targetAngle) / TWO_PI;
    dir -= round( dir );
    dir *= TWO_PI;
   
    targetAngle += dir * easing;
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate( targetAngle );
    //translate(pos.x, pos.y);
    //enemy shoulders
    stroke(0);
    fill(145,200,0);
    rect(p-7, p+10, 14, 15);
    rect(p-7, p-10, 14, -15);
    //enemy hands
    rect(p-27, p+25, 20, -15);
    rect(p-27, p-10, 20, -15);
    //enemy head
    fill(145, 155, 0);
    ellipse(p,p,28,28); 
    popMatrix();
  }

}