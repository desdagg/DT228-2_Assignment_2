class Player extends GameCharacter
{

  float angle = 0;
  float targetAngle = 0;
  float easing = 0.5f;
  //boolean canShoot = true;
  //int delay = 0;
  //int gunType = 1;
  //int toggle = 1;
  int totalHealth = 300;
  float health = totalHealth;

  Player()
  {
    super(width * 0.5f, height  * 0.5f);   
    // println("p is " + p);
    println("In Player Default Constructor");
  }

  void update()
  {
    //textSize(32);
    //noFill();
    //stroke(0);
    //rect(width *0.60, height/15, map(totalHealth, 0, totalHealth, 0, width/3), height/40);
    //fill(255,0,0);
    //text("Health", width * 0.65, height/17);
    //rect(width *0.60, height/15, map(health, 0, totalHealth, 0, width/3), height/40);

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
      if (pos.y > 0)
      {
        pos.add(forward);
      }
    }
    if (keys['S'])
    {
      if (pos.y < height)
      {
        pos.add(backward);
      }
    }
    if (keys['A'])
    {
      if (pos.x > 0)
      {
        pos.add(left);
      }
    }
    if (keys['D'])
    {
      if (pos.x < width)
      {
        pos.add(right);
      }
    }
    

    
    
    //iterating through the arrayList of the bullets
    for (int i = 0 ; i<bullets.size() ; i++)
    {
      //accessing each individual bullet
      Bullet b = (Bullet) bullets.get(i);
      //running a function to display the x value of the bullet.
      float blltX, blltY;
      blltX = b.displayx();
      blltY = b.displayy();
      //
      if(blltX > width+10 || blltX < -10 || blltY > height +10 || blltY < -10)
      {
        bullets.remove(i);        
      }
        //println("bullet x pos is" + blltX);
    }
  }




  void render()
  {
    //println("rendering");
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
    triangle(p+7, p+25, p+23, p-3, p, p+20);
    fill(0);
    //player gun
    rect(p+18, p-3, 15, 6);
    //gun muzzel
    fill(80);
    rect(p+33, p-2, 5, 4);

    //rect(p+7, p+10, 14, 15);
    fill(180, 150, 0);
    //player head
    ellipse(p, p, 28, 28);
    popMatrix();
  }
  
  void showStats()
  {
    textSize(32);
    noFill();
    stroke(0);
    rect(width *0.60, height/15, map(totalHealth, 0, totalHealth, 0, width/3), height/40);
    fill(255,0,0);
    text("Health", width * 0.65, height/17);
    rect(width *0.60, height/15, map(health, 0, totalHealth, 0, width/3), height/40);
  }
  
  boolean playerAlive()
  {
    if(health <= 0)
    {
      return false;
    }
    return true;
  }
  

}