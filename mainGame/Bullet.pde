
class Bullet extends GameCharacter
{
  float xCor;
  float yCor;
  int col = color(0);
 

  void render()
  {
    // draw the bullet

    stroke(col);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, -30, 0, -5);
    popMatrix();
  }

  void update()
  {
    xCor = pos.x;
    yCor = pos.y;

    forward.x = sin(theta);
    forward.y = - cos(theta);

    forward.mult(speed*5);
    pos.add(forward);
  }

  float displayx()
  {
    return (xCor);
  }

  float displayy()
  {
    return (yCor);
  }


  void removebullet()
  {
    //iterating through the arrayList of the bullets
    for (int i = 0; i<bullets.size(); i++)
    {
      //accessing each individual bullet
      //Bullet b = (Bullet) bullets.get(i);
      bullets.remove(i);
    }
  }
}