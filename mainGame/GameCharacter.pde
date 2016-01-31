class GameCharacter
{
  PVector pos;
  PVector forward;
  PVector backward;
  PVector left;
  PVector right;
  float theta = 0.0f;
  float p = 0;
  float speed = 7.0f;
  
  
  GameCharacter()  //constructor
  {
    this(width * 0.5f, height  * 0.5f);   
    
  }
  
  GameCharacter(float x, float y)
  {
    this.pos = new PVector(x, y);
    forward = new PVector(0, -1);
    backward = new PVector(0, 1);
    left = new PVector(-1, 0);
    right = new PVector(1, 0);
    
  }
  
  void update()
  {
  }
  
  void render()
  {
  }
  
}