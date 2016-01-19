class Enemy extends GameCharacter
{
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.5f;
  
  Enemy()
  {
    
    super(width * 0.5f, height  * 0.5f, 50);     
    println("In Enemy Default Constructor");
  }
  
}