class Player extends GameCharacter
{
  
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.5f;
  
  Player()
  {
    super(width * 0.5f, height  * 0.5f);   
   // println("p is " + p);
    println("In Player Default Constructor");
  }
  
  void update()
  {
    //movement direcions
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    
    backward.x = -sin(theta);
    backward.y =  cos(theta);
    backward.mult(speed);
    
    left.x = -cos(theta);
    left.y = sin(theta);
    left.mult(speed);
    
    right.x = cos(theta);
    right.y = sin(theta);
    right.mult(speed);
    
    
    //key bindings for movement
    if (keys['W'])
    {
      if(pos.y > 0)
      {
        pos.add(forward);
      }
    }
    if (keys['S'])
    {
      if(pos.y < height)
      {
        pos.add(backward);
      }
    }
    if (keys['A'])
    {
      if(pos.x > 0)
      {
      pos.add(left);
      }
    }
    if (keys['D'])
    {
      if(pos.x < width)
      {
      pos.add(right);
      }
    }
    
    if(keys['P'])
    {
      Enemy enemy= new Enemy();
      enemies.add(enemy);
    }
    
    
    if (mousePressed)
    {
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.theta = angle+1.57;
      bullets.add(bullet);
      
    }
    
  }
  
  
  void render()
  {
    println("rendering");
    //player angle facing the mouse position
    angle = atan2( mouseY - pos.y, mouseX - pos.x );
    
    float dir = (angle - targetAngle) / TWO_PI;
    dir -= round( dir );
    dir *= TWO_PI;
   
    targetAngle += dir * easing;
   
    //drawing the player
    pushMatrix();
    translate(pos.x, pos.y);

    rotate( targetAngle );

    
    //println(pos);
    stroke(0);
    fill(255, 0, 0);
    //player shoulders
    rect(p-7, p+10, 14, 15);
    rect(p-7, p-10, 14, -15);
    //player hand
    triangle(p+7, p+25, p+23, p-3, p,p+20);
    fill(0);
    //player gun
    rect(p+18, p-3, 15, 6);
    //gun muzzel
    fill(80);
    rect(p+33, p-2, 5, 4);
    
    //rect(p+7, p+10, 14, 15);
    fill(180,150,0);
    //player head
    ellipse(p,p,28,28);
    popMatrix();
  }
}