class Enemy extends GameCharacter
{
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.05f;
  int ran = int(random(1,5));
  float xVal = 0;
  float yVal = 0;
  color headColour = color(145, 155, 0);
  color bodyColour = color(145,200,0);
  int enemyHealth = 1;


  
  
  Enemy()
  {
    super(width * 0.5f, height  * 0.5f);  
    if (ran == 1)
    {
      xVal = random(-70, 20);
      yVal = random(0, height);
    }
    if (ran == 2)
    {
      xVal = random(0, width);
      yVal = random(-70, 20);
    }
    if (ran ==3)
    {
      xVal = random(width +20, width +70);
      yVal = random(0, height);
    }
    if (ran == 4)
    {
      xVal = random(0, width);
      yVal = random(height +20, height +70);
    }
    pos.x = xVal;
    pos.y = yVal;
    println("In Enemy Default Constructor");
  }
  
  
  void update()
  {
    forward.x = -cos(angle);
    forward.y = -sin(angle);
    forward.mult(speed*0.3);
    pos.add(forward); 
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
    stroke(0);
    fill(bodyColour);
    rect(p-7, p+10, 14, 15);
    rect(p-7, p-10, 14, -15);
    
    //enemy hands
    rect(p-27, p+25, 20, -15);
    rect(p-27, p-10, 20, -15);
    
    //enemy head
    fill(headColour);
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
    //iterating through the arrayList of the bullets
    for (int i = 0 ; i<bullets.size() ; i++)
    {
      //accessing each individual bullet
      Bullet b = (Bullet) bullets.get(i);
      //checking the coordinates of the bullet
      if(b.xCor > (pos.x -17) && b.xCor < (pos.x +17) && b.yCor > (pos.y -25) && b.yCor < (pos.y + 25))
      {
        
        //removing the bullet from the arraylist
        bullets.remove(i);
        enemyHealth--;
        //return false;
      }
      
      if(enemyHealth <= 0)
      {
        return false;
      }
    }
    return true;
  }
  
  
  boolean touchingPlayer()
  {
    if((player.pos.x + 40) > (pos.x - 25) && player.pos.x < (pos.x +50) && player.pos.y > (pos.y - 20) && player.pos.y < (pos.y+20))
    {
      return true;
    }
    
    return false;
  }
}