import javax.swing.*;
import ddf.minim.*;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<AmmoPickup> pickups = new ArrayList<AmmoPickup>();




String SCORE_FILE = "HighScores.csv";
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
PImage InstructionsScreen;
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
  //println("can play is " + canPlay);
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
  instructions();

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
    player.gotAmmo();
    gun.currentGun();

    ////////////////////////////////////////////////////////////////
    //enemy spawning
    ///////////////////////////////////////////////////////////////

    if (canSpawn)
    {
      Enemy enemy= new Enemy();
      enemies.add(enemy);
      canSpawn = false;
      spawnDelay = 100;
    }
    spawnDelay--;

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
        enemies.remove(i);
        score = score + 1;
        finalScore = score;

        float mark = score % 5;
        if (mark == 1 && delayMin < 80)
        {
          //adding 10 to the minimum delay to increase the spawn rate
          delayMin+=10;
          //println("delay min is: " + delayMin);
        }

        //checking if the score is high enough and allowing secondEnemy to spawn
        if (score == 50)
        {
          bSpn = 1;
        }
      }

      if (e.touchingPlayer())
      {
        player.health--;
      }
    }//end for loop
    
    ////////////////////////////////////////////////////////////////
    //ammo spawning
    if(frameCount % 1200 == 0)
    {
      //println("ammo drop");
      AmmoPickup ammoPickup = null;
      ammoPickup = new AmmoPickup();
      pickups.add(ammoPickup);      
    }
    
    for(AmmoPickup a : pickups)
    {
      a.render();
      a.update();
    }
    
    if(keys['P'])
    {
      gun.rifleAmmo = 50;
      gun.shotgunAmmo = 25;
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
  }//end gamestate if
}//end draw

/////////////////////////////////////////////////////////////////////////
//the main menu 
////////////////////////////////////////////////////////////////////////
void mainMenu()
{
  if (gameState == 0)
  {
    startScreen = loadImage("startScreen.jpg");
    
    //playing the main menu music
    if (canPlay)
    {
      menuMusic = minim.loadFile(MENU_MUSIC);
      menuMusic.setGain(-20.0);
      menuMusic.play();
      menuMusic.loop();
      canPlay = false;
    }

    background(startScreen);
    fill(250);
    textSize(50);
    textAlign(CENTER);
    text("Press G to start", width/2, height/2);
    text("Press H for High Scores", width/2, height *0.6);
    text("Press P for Instructions", width/2, height *0.7);
    readFile = 0;

    if (keys['G'])
    {
      gameState = 2;
    }  

    if (keys['H'])
    {
      gameState = 3;
    }
    
    if (keys['P'])
    {
      gameState = 4;
    }
  }
}

////////////////////////////////////////////////////////////////////////
//game over screen
////////////////////////////////////////////////////////////////////////
void gameOver()
{
  if (gameState == 1)
  {
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
    for (int i = 0; i<pickups.size(); i++)
    {
      pickups.remove(i);
    }
    mainMenu();
    setup();
    
    if (keys['C'])
    {
      gameState = 0;
    }
  }
}

////////////////////////////////////////////////////////////////////////
//high score screen
////////////////////////////////////////////////////////////////////////
void highScores()
{
  //load the hich score class to load the file
  if (gameState == 3)
  {
    highScore = new Score();
    highScore.displayScores(SCORE_FILE);
  }

  if (keys['C'])
  {
    gameState = 0;
  }
}

////////////////////////////////////////////////////////////////////////
//show the instructions
////////////////////////////////////////////////////////////////////////
void instructions()
{
  
  if(gameState == 4)
  {
    InstructionsScreen = loadImage("Instructions.jpg");
    background(InstructionsScreen);
    text("Press C to go back", width/2, height * 0.9);
    if (keys['C'])
    {
      gameState = 0;
    }
  }
}