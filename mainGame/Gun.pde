class Gun
{
  int delay = 0;
  int swapDelay = 0;
  boolean canShoot = true;
  int gunType = 0;
  boolean canSwap = true;
  boolean hasRifleAmmo = false;
  boolean hasShtgunAmmo = false;
  
  int rifleAmmo = 0;
  int shotgunAmmo = 0;
  
  AudioPlayer pistolShot;
  AudioPlayer shotgunShot;
  AudioPlayer rifleShot;
  
  Gun()
  {
   
    pistolShot = minim.loadFile("pew.wav");
    shotgunShot = minim.loadFile("shotGunSound.wav");
    rifleShot = minim.loadFile("rifleSound.wav");
  }
  
  void currentGun()
  {
    if(keys['R'] && canSwap)
    {
      //println("guntype is " + gunType);
      gunType++;
      if(gunType == 3)
      {
        gunType = 0;
      }
      canSwap = false;
      swapDelay = 0;
    }
      swapDelay++;
    
    if (swapDelay >= 20)
    {
      canSwap = true;
    }
    
    if (gunType == 0)
    {
      pistol();
    }
    if (gunType == 1)
    {
      shotGun();
    }
    if (gunType == 2)
    {
      rifle();
    }
  }
  
  void pistol()
  {
    fill(255,0,0);
    text("pistol", width/2, height/9);
    if (mousePressed && canShoot)
      {
        pistolShot.rewind();
        pistolShot.play();;

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
      if (delay >= 25)
      {
        canShoot = true;
      }
  }
  
  
 void shotGun()
 {
   fill(255,0,0);
   text("shotgun", width/2, height/9);
   
   fill(217,217,91);
    
    text("Ammo", width/10, height*0.85);
    rect(width/10, height*0.8, width/40, -shotgunAmmo*20);
    if(shotgunAmmo > 0)
    {
      hasShtgunAmmo = true;
    }
    
   if (mousePressed && canShoot && hasShtgunAmmo)
    {
      shotgunShot.rewind();
      shotgunShot.play();
      float a = 1.57;
      float b = 1.43;
      float c = 1.29;
      float d = 1.71;
      float e = 1.85;

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
      shotgunAmmo--;
        if(shotgunAmmo <= 0)
        {
          hasShtgunAmmo = false;
        }
    }     
    delay++; 
    if (delay >= 34)
    {
      canShoot = true;
    }
  
 }
 
 
 void rifle()
  {
    fill(255,0,0);
    text("Rifle", width/2, height/9);
    fill(255,200,0);
    
    text("Ammo", width/10, height*0.85);
    rect(width/10, height*0.8, width/40, -rifleAmmo*10);
    if(rifleAmmo > 0)
    {
      hasRifleAmmo = true;
    }
    
    if (mousePressed && canShoot && hasRifleAmmo)
    {
        rifleShot.rewind();
        rifleShot.play();

        Bullet bullet = new Bullet();
        bullet.pos.x = player.pos.x;
        bullet.pos.y = player.pos.y;
        //angling the bullet toward the mouse
        bullet.theta = player.angle+1.57;
        bullets.add(bullet);
        canShoot = false;
        delay = 0;
        rifleAmmo--;
        if(rifleAmmo <= 0)
        {
          hasRifleAmmo = false;
        }
    } 
    
    delay++; 
    if (delay >= 5)
    {
      canShoot = true;
    }
  }
}