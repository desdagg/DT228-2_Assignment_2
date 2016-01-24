class Player extends GameCharacter
{

  float angle = 0;
  float targetAngle = 0;
  float easing = 0.5f;
  boolean canShoot = true;
  int delay = 0;

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



    //create bullets when mouse pressed
    /*if (mousePressed)
     {
     //ad a limit to amount of bullets creatable
     int b = 0;
     if(bullets.size() < 10)
     {
     Bullet bullet = new Bullet();
     bullet.pos.x = pos.x;
     bullet.pos.y = pos.y;
     //angling the bullet toward the mouse
     bullet.theta = angle+1.57;
     bullets.add(bullet);
     b++;
     }
     else
     {
     //remove bullets from arraylist if too many
     bullets.remove(b);
     }
     }*/
     
     //attempt at different type of fireing
     //
    if (mousePressed && canShoot)
    {
      float a = 1.57;
      float b = 1.43;
      float c = 1.29;
      float d = 1.71;
      float e = 1.85;
      //ad a limit to amount of bullets creatable
      Bullet bullet1 = new Bullet();
      bullet1.pos.x = pos.x;
      bullet1.pos.y = pos.y;
      //angling the bullet toward the mouse
      bullet1.theta = angle+a;
      bullets.add(bullet1);
      
      Bullet bullet2 = new Bullet();
      bullet2.pos.x = pos.x;
      bullet2.pos.y = pos.y;
      //angling the bullet toward the mouse
      bullet2.theta = angle+b;
      bullets.add(bullet2);
      
      Bullet bullet3 = new Bullet();
      bullet3.pos.x = pos.x;
      bullet3.pos.y = pos.y;
      //angling the bullet toward the mouse
      bullet3.theta = angle+c;
      bullets.add(bullet3);
      
      Bullet bullet4 = new Bullet();
      bullet4.pos.x = pos.x;
      bullet4.pos.y = pos.y;
      //angling the bullet toward the mouse
      bullet4.theta = angle+d;
      bullets.add(bullet4);
      
      Bullet bullet5 = new Bullet();
      bullet5.pos.x = pos.x;
      bullet5.pos.y = pos.y;
      //angling the bullet toward the mouse
      bullet5.theta = angle+e;
      bullets.add(bullet5);      
      canShoot = false;
      delay = 0;
    }
    //test shooting version
    //
    //hand gun implementation --- hopefully more guns in future updates
    //
    
    /*
    if (mousePressed && canShoot)
    {
      //ad a limit to amount of bullets creatable
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      //angling the bullet toward the mouse
      bullet.theta = angle+1.57;
      bullets.add(bullet);
      canShoot = false;
      delay = 0;
    }
    */
    
    delay++;
    if (delay >= 20)
    {
      canShoot = true;
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
        println("bullet x pos is" + blltX);
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
  

}