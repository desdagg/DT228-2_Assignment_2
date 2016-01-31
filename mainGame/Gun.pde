class Gun
{
  int delay = 0;
  int swapDelay = 0;
  boolean canShoot = true;
  int gunType = 1;
  boolean canSwap = true;
  
  Gun()
  {

  }
  
  void currentGun()
  {
    if(keys['R'] && canSwap)
    {
      gunType = gunType * -1;
      canSwap = false;
      swapDelay = 0;
    }
    swapDelay++;
    
    if (swapDelay >= 20)
    {
      canSwap = true;
    }
    
    if (gunType == 1)
    {
      pistol();
    }
    if (gunType == -1)
    {
      shotGun();
    }
  }
  
  void pistol()
  {
    fill(255,0,0);
    text("pistol", width/2, height/9);
    if (mousePressed && canShoot)
      {
        //ad a limit to amount of bullets creatable
        Bullet bullet = new Bullet();
        bullet.pos.x = player.pos.x;
        bullet.pos.y = player.pos.y;
        //angling the bullet toward the mouse
        bullet.theta = player.angle+1.57;
        bullets.add(bullet);
        canShoot = false;
        delay = 0;
      }     
      delay++; 
      if (delay >= 10)
      {
        canShoot = true;
      }
  }
  
  
 void shotGun()
 {
   fill(255,0,0);
   text("shotgun", width/2, height/9);
   if (mousePressed && canShoot)
    {
      float a = 1.57;
      float b = 1.43;
      float c = 1.29;
      float d = 1.71;
      float e = 1.85;
      //ad a limit to amount of bullets creatable
      Bullet bullet1 = new Bullet();
      bullet1.pos.x = player.pos.x;
      bullet1.pos.y = player.pos.y;
      //angling the bullet toward the mouse
      bullet1.theta = player.angle+a;
      bullets.add(bullet1);
      
      Bullet bullet2 = new Bullet();
      bullet2.pos.x = player.pos.x;
      bullet2.pos.y = player.pos.y;
      //angling the bullet toward the mouse
      bullet2.theta = player.angle+b;
      bullets.add(bullet2);
      
      Bullet bullet3 = new Bullet();
      bullet3.pos.x = player.pos.x;
      bullet3.pos.y = player.pos.y;
      //angling the bullet toward the mouse
      bullet3.theta = player.angle+c;
      bullets.add(bullet3);
      
      Bullet bullet4 = new Bullet();
      bullet4.pos.x = player.pos.x;
      bullet4.pos.y = player.pos.y;
      //angling the bullet toward the mouse
      bullet4.theta = player.angle+d;
      bullets.add(bullet4);
      
      Bullet bullet5 = new Bullet();
      bullet5.pos.x = player.pos.x;
      bullet5.pos.y = player.pos.y;
      //angling the bullet toward the mouse
      bullet5.theta = player.angle+e;
      bullets.add(bullet5);      
      canShoot = false;
      delay = 0;  
    }     
    delay++; 
    if (delay >= 30)
    {
      canShoot = true;
    }
  
}
  
  
}