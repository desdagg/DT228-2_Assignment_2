import javax.swing.*;
import ddf.minim.*;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<AmmoPickup> pickups = new ArrayList<AmmoPickup>();




String SCORE_FILE = "HighScores.csv";
//String PISTOLSHOT = "pew.mp3";
String MENU_MUSIC = "game_menu_cut.wav";

Player player;
Gun gun;
Minim minim;
Score highScore;
Input input;
AudioPlayer menuMusic;
AudioPlayer myMan;

boolean[] keys = new boolean[512];
PImage startScreen;
PImage bloodSplat;
int score;
int finalScore;
int readFile = 0;
int gameState = 0;
boolean canSpawn = true;
boolean bossSpawn = false;
boolean canPlay = true;
int spawnDelay = 0;
int bossDelay = 0;
int delayMin = 0;
int bSpn = 0;



void setup()
{
  size(1000, 1000);
  player = new Player();
  minim = new Minim(this);
  gun = new Gun();
  

  canPlay = true;
  println("can play is " + canPlay);
  bossSpawn = false;
  spawnDelay = 0;
  bossDelay = 0;
  delayMin = 0;
  bSpn = 0;
}


void keyPressed()
{
  keys[keyCode] = true;
}


void keyReleased()
{
  keys[keyCode] = false;
}


void draw()
{
  mainMenu();
  gameOver();
  highScores();


  if (gameState == 2)
  { 
    //stop the menu music
    menuMusic.pause();
    background(150);
    textSize(32);
    fill(0);
    
    text("Score: " + score, width/10, height/10);

    player.showStats();
    player.render();
    player.update();
    gun.currentGun();

    ////////////////////////////////////////////////////////////////
    //enemy spawning
    ///////////////////////////////////////////////////////////////


    //println("wave; " + wave + "and j is;" + j);

    if (canSpawn)
    {
      Enemy enemy= new Enemy();
      enemies.add(enemy);
      canSpawn = false;
      spawnDelay = 100;
    }
    spawnDelay--;

    //println("spawn delay is; " + spawnDelay);
    if (spawnDelay <= delayMin)
    {
      canSpawn = true;
    }

    if (bossSpawn)
    {
      SecondEnemy secondenemy= new SecondEnemy();
      enemies.add(secondenemy);
      myMan = minim.loadFile("myMan.wav");
      myMan.rewind();
      myMan.play();
      bossSpawn = false;
      bossDelay = 200;
    }
    bossDelay--;

    if (bossDelay <= delayMin && bSpn == 1)
    {
      bossSpawn = true;
    }

    for (int i = 0; i<enemies.size(); i++)
    {
      Enemy e = (Enemy) enemies.get(i);

      if (!e.enemyAlive())
      {
        //death();
        //float x = e.getXLocation();
        //float y = e.getYLocation();
        enemies.remove(i);
        //death(x, y);
        score = score + 1;
        finalScore = score;

        float mark = score % 5;
        if (mark == 1 && delayMin < 80)
        {
          //float mark = score % 10;
          println("mark is " + mark);
          println("score is " + score);
          delayMin+=5;
          println("delay min is: " + delayMin);
        }

        if (score == 100)
        {
          bSpn = 1;
        }

        //add new enemy later
        //if (score == 250)
        //{
        //  sSpn = 1;
        //}
      }

      if (e.touchingPlayer())
      {
        player.health--;
      }
    }//end for loop

    //ammo spawning
    //
    //adding the pickups
    //they need to be created and then colision detected
    if(frameCount % 1200 == 0)
    {
      AmmoPickup ammoPickup = null;
      ammoPickup = new AmmoPickup();
      pickups.add(ammoPickup);
      
      
    }


    for (Enemy e : enemies)
    {
      e.render();
      e.update();
    }


    for (Bullet b : bullets)
    {

      b.update();
      b.render();
    }


    if (!player.playerAlive())
    {
      gameState = 1;
    }
    
    
    if(keys['P'])
    {
      gun.rifleAmmo = 50;
      gun.shotgunAmmo = 25;
    }
  }//end gamestate if
}//end draw

/////////////////////////////////////////////////////////////////////////
//the main menu 

void mainMenu()
{
  if (gameState == 0)
  {
    startScreen = loadImage("startScreen.jpg");
    //
    println("can play check" + canPlay);
    if (canPlay)
    {
      menuMusic = minim.loadFile(MENU_MUSIC);
      menuMusic.play();
      canPlay = false;
    }
    //menuMusic.loop();
    //
    background(startScreen);
    fill(250);
    textSize(50);
    textAlign(CENTER);
    text("Press G to start", width/2, height/2);
    text("Press H for High Scores", width/2, height *0.6);

    readFile = 0;

    if (keys['G'])
    {
      gameState = 2;
    }  

    if (keys['H'])
    {
      gameState = 3;
    }
  }
}

///////////////////////////////////////////////////////////////////////////////
//game over screen
void gameOver()
{
  if (gameState == 1)
  {
    //finalScore = score;
    //load the background and text
    background(startScreen);
    fill(250);
    textSize(70);
    text("GAME OVER", width/2, height/2);
    text("Score: " + finalScore, width/2, height * 0.6);
    text("Press C to continue", width/2, height * 0.8);

    //got to the score handeling 
    if (readFile == 0)
    {
      input = new Input();
      readFile = input.scoreCheck(finalScore, SCORE_FILE, readFile);
    }

    //resetting the game 
    score = 0;

    for (int i = 0; i<enemies.size(); i++)
    {
      enemies.remove(i);
    }
    mainMenu();
    setup();
    
    if (keys['C'])
    {
      gameState = 0;
    }
  }
}

//////////////////////////////////////////////////////////////////////////////////
//high score screen
void highScores()
{
  //load the hich score class to load the file
  if (gameState == 3)
  {
    highScore = new Score();
    highScore.displayScores(SCORE_FILE);
    //this works
    //readFile = 0;
  }

  if (keys['C'])
  {
    gameState = 0;
  }
}


//void death(float x, float y)
//  {
//    PImage bloodImg;
//    bloodImg = loadImage("blood_splat1.png");
//    image(bloodImg, x, y);
//  }

//void blood()
//{
//  bloodSplat = loadImage("blood_splat1.png");
//}