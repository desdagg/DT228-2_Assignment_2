class GameCharacter
{
  PVector pos;
  PVector forward;
  float theta = 0.0f;
  float p;
  float halfp;
  float speed = 5.0f;
  
  
  GameCharacter()  //constructor
  {
    this(width * 0.5f, height  * 0.5f, 50);   
    
  }
  
  GameCharacter(float x, float y, float w)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.p = p; 
    this.halfp = p * 0.5f;
    this.theta = 0.0f;
  }
}