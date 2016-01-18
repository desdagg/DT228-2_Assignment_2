class Player extends GameCharacter
{
  
  Player()
  {
    super(width * 0.5f, height  * 0.5f, 50);     
    println("In Player Default Constructor");
  }
  
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    //float x = mouseX;
    //float y = mouseY;
    stroke(0);
    fill(255, 0, 0);
    rect(p-7, p+10, 14, 15);
    rect(p-7, p-10, 14, -15);
    fill(0);
    rect(p-21, p-10, 14, -15);
    fill(180,150,0);
    ellipse(p,p,28,28);
    popMatrix();
  }
}