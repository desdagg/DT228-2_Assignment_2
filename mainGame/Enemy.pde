class Enemy extends GameCharacter
{
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.05f;
  float xVal = random(0, width);
  float yVal = random(0, height);

  //
  //you need to make a hitbox
  //
  
  
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
    forward.x = -cos(angle);
    forward.y = -sin(angle);
    forward.mult(speed*0.3);

         if (keys['L'])
    {
      println("value of enemy" + xVal +pos);
      if(pos.y > 0)
      {
        
        //pos.add(forward);
      }
    }
      pos.add(forward);


   /* if(pos.x == bullet.pos.x || pos.y == Bullet.pos.y)
    {
      println("thats a hit");
    }*/
    
  }
  
  void render()
  {
    //println(pos.x);
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
    
    
    
    //hitbox
    noFill();
    //rect(p-27, p-25, 34, 50);
    popMatrix();
  }
  
  //using a boolean this will iterate through all the bullets in its arraylist
  //and check if any are touching an enemy, if they are the function will return false
  boolean enemyAlive()
  {
    for (int i = 0 ; i<bullets.size() ; i++)
    {
      Bullet b = (Bullet) bullets.get(i);
      //checking the coordinates of the bullet
      if(b.xCor > (pos.x -17) && b.xCor < (pos.x +17) && b.yCor > (pos.y -25) && b.yCor < (pos.y + 25))
      {
        //removing the bullet from the arraylist
        bullets.remove(i);
        return false;
      }
    }
    return true;
  }
  
  void removeEnemy()
  {
    
    
    
  }

}