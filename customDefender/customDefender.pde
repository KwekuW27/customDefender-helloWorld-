Player player1;
Bullet bullet1;
Enemy1 enemy1;
Enemy2 enemy2;

ArrayList<Bullet>bulletList;
ArrayList<Enemy1>enemy1List;
ArrayList<Enemy2>enemy2List;

Animation playerAnimation;
// Make array of player images
PImage[] playerImages = new PImage[4];

Animation2 firstOpponentAnimation;
Animation3 secondOpponentAnimation;

// Make array of player images
PImage[] firstOpponentImages = new PImage[2];
PImage[] secondOpponentImages = new PImage[2];


int startTime;
int endTime;
int startTime2;
int endTime2;
//60000 = 1 minute
int interval = 2000;
int interval2 = 4000;
int ySpeed = 8;
int xSpeed2 = 6;


int state;
float x = 300;
float y = 200;
float sx = 50;
float sy = 10;

//===========================

//index of the color to show right now
int bgColorIndex = 0;
//===============================

//SCORING
int rightPSCORE;
int leftPSCORE;
int winSCORE;

//sound
import processing.sound.*;
SoundFile diomuda2;
SoundFile zaworld;
SoundFile rainaudio;
boolean haszaworldPlayed = false;

PImage alienInvasionImg;
PImage winImg;
PImage lostImg;
PImage spaceImg;


void setup() {
  PImage background;
  background = loadImage("c:\\data\\alienInvasion.jpeg");
  size(1200, 800);
  state=0;
  bulletList = new ArrayList<Bullet>();

  enemy1List = new ArrayList<Enemy1>();
  enemy2List = new ArrayList<Enemy2>();

  player1 = new Player (x, y, sx, sy, color(200, 0, 255));

  // fill array of player images
  for (int i=0; i<playerImages.length; i++) {
    playerImages[i] = loadImage("player"+i+".png");
  }
  // initialize player object
  playerAnimation = new Animation(playerImages, 0.1, 5);


  for (int i=0; i<firstOpponentImages.length; i++) {
    firstOpponentImages[i] = loadImage("firstOpponent"+i+".png");
  }
  firstOpponentAnimation = new Animation2(firstOpponentImages, 0.5, 5);

  for (int i=0; i<secondOpponentImages.length; i++) {
    secondOpponentImages[i] = loadImage("secondOpponent"+i+".png");
  }
  secondOpponentAnimation = new Animation3(secondOpponentImages, 0.5, 5);

  startTime = millis();

  rightPSCORE = 0;
  leftPSCORE = 0;
  //winSCORE = 7;

  diomuda2 = new SoundFile(this, "diomuda2.wav");
  zaworld = new SoundFile(this, "zaworld.wav");
  rainaudio = new SoundFile(this, "rainaudio.wav");

  alienInvasionImg = loadImage("alienInvasion.jpeg");
  alienInvasionImg.resize(1200, 800);

  spaceImg = loadImage("space.jpeg");
  spaceImg.resize(1200, 800);

  winImg = loadImage("winImg.jpeg");
  winImg.resize(1200, 800);

  lostImg = loadImage("lostImg.jpeg");
  lostImg.resize(1200, 800);
}


void draw() {

  switch(state) {
  case 0:
    //image(alienInvasionImg, width/2, height/2);
    background(alienInvasionImg);
    textSize(50);
    fill(255, 255, 255);
    text("press 's' to start -_O", width - 445, height - 50);
    if (haszaworldPlayed == false) {
      zaworld.play();
      haszaworldPlayed = true;
    }

    break;

  case 1:
    image(spaceImg, width/2, height/2);
    //player1.render();
    player1.move();

    player1.pX = mouseX;
    player1.pY = mouseY;


    for (Bullet bullet1 : bulletList) {
      bullet1.render();
      bullet1.move();
    }
    //==============================
    
    // show the player animation
    playerAnimation.display(mouseX, mouseY);
    //==============================
    
    endTime = millis();
    if (endTime - startTime >= interval) {
      //println("timer triggered! ;)");
      startTime = millis();
      firstOpponentAnimation = new Animation2(firstOpponentImages, 0.5, 5);
      println(ySpeed);
      enemy1List.add(new Enemy1(firstOpponentAnimation, ySpeed));
    }

    endTime2 = millis();
    if (endTime2 - startTime2 >= interval2) {
      //println("timer triggered! ;)");
      startTime2 = millis();
      secondOpponentAnimation = new Animation3(secondOpponentImages, 0.5, 5);

      enemy2List.add(new Enemy2(secondOpponentAnimation, xSpeed2));
    }

    for (Enemy1 aEnemy1 : enemy1List) {
      //aEnemy1.render();
      aEnemy1.move();
      aEnemy1.wallDetect();
      aEnemy1.wallCollide();
      aEnemy1.enemy1Animation.display(aEnemy1.x -8, aEnemy1.y - 6);


      for (Bullet bulletCollide : bulletList) {
        aEnemy1.collision(bulletCollide);
      }
    }

    for (Enemy2 aEnemy2 : enemy2List) {
      //aEnemy2.render();
      aEnemy2.move();
      aEnemy2.wallDetect();
      aEnemy2.wallCollide();
      aEnemy2.enemy2Animation.display(aEnemy2.x2 -8, aEnemy2.y2 - 6);

      for (Bullet bulletCollide : bulletList) {
        aEnemy2.collision(bulletCollide);
      }
    }

    for (int i = enemy1List.size()-1; i>=0; i--) {
      Enemy1 aEnemy1 = enemy1List.get(i);
      if (aEnemy1.isShot == true && aEnemy1.enemy1Animation.isAnimating == false) {
        enemy1List.remove(aEnemy1);
        bulletList.remove(bullet1);
        rightPSCORE = rightPSCORE + 1;
      }

      if (aEnemy1.wallTouch == true) {
        leftPSCORE = leftPSCORE + 1;
        enemy1List.remove(aEnemy1);
      }
    }

    for (int i = enemy2List.size()-1; i>=0; i--) {
      Enemy2 aEnemy2 = enemy2List.get(i);
      if (aEnemy2.isShot2 == true && aEnemy2.enemy2Animation.isAnimating == false) {
        enemy2List.remove(aEnemy2);
        bulletList.remove(bullet1);
        rightPSCORE = rightPSCORE + 1;
      }
      if (aEnemy2.wallTouch2 == true) {
        leftPSCORE = leftPSCORE + 1;
        enemy2List.remove(aEnemy2);
      }
    }

    //scoreboard
    //SCOREBOARD
    fill(0, 100, 0);
    textSize(100);
    text(rightPSCORE, width - 100, height - 25);
    if (rightPSCORE == 2) {
      //state=2;
      state = 2;
    }

    fill(100, 0, 0);
    textSize(100);
    text(leftPSCORE, 0 +  100, height - 25);
    if (leftPSCORE == 10) {
      //state=2;
      state = 3;
    }
    //========================
    if (rainaudio.isPlaying() == false && state == 1) {
      rainaudio.play();
    }

    break;

  case 2:
    image(winImg, width/2, height/2);
    textSize(50);
    fill(0, 175, 0);
    text("press 'c' to continue :)", width - 500, height - 50);
    fill(175, 0, 0);
    text("press 'q' to quit -_-", width - 500, height - 150);
    if (haszaworldPlayed == false) {
      zaworld.play();
      haszaworldPlayed = true;
    }
    if (rainaudio.isPlaying()) {
      rainaudio.stop();
    }
    enemy1List.clear(); // clear the enemy1List
    enemy2List.clear(); // clear the enemy1List

    break;

  case 3:
    image(lostImg, width/2, height/2);
    textSize(50);
    fill(255, 0, 0);
    text("press 'm' for menu", width - 400, height - 50);
    if (haszaworldPlayed == false) {
      zaworld.play();
      haszaworldPlayed = true;
    }
    if (rainaudio.isPlaying()) {
      rainaudio.stop();
    }
    enemy1List.clear(); // clear the enemy1List
    enemy2List.clear(); // clear the enemy1List

    break;
  }
}
//===================================
void mousePressed() {
  bullet1 = new Bullet (player1.pX + sx+1, player1.pY + sy/2, 15, color(175, 175, 255));
  bulletList.add(bullet1);
  playerAnimation.isAnimating = true;


  if (diomuda2.isPlaying() == true) {
    diomuda2.stop();
  }
  if (state == 1) {
    // diomuda2.play();
  } else {
    // diomuda2.stop();
  }
}

void keyPressed() {
  //if (key == CODED) {
  if (key == 'w') {
    player1.isMovingUp = true;
  }
  //}
  //if (key == CODED) {
  if (key == 's') {
    player1.isMovingDown = true;
  }
  //}
  // if (key == CODED) {
  if (key == 'd') {
    player1.isMovingRight = true;
  }
  //}
  if (key == 'a') {
    player1.isMovingLeft = true;
  }
  //CASE BUTTONS
  if (key == 's') {
    //state += 1;
    state = 1;
  }

  if (key == 'm' && state == 3) {
    //state += 1
    state = 0;
    rightPSCORE = 0;
    leftPSCORE = 0;
  }

  if (key == 'c' && state == 2) {
    //state += 1
    rightPSCORE = 0;
    leftPSCORE = 0;
    interval = interval - 200;
    interval2 = interval2 - 200;
    ySpeed = ySpeed + 1;
    xSpeed2 = xSpeed2 + 1;
    state = 1;
  }

  if (key == 'q' && state == 2) {
    rightPSCORE = 0;
    leftPSCORE = 0;
    state = 0;
  }


  //if (state > 2) {
  //  state = 0;
  //}
}

void keyReleased() {
  //if (key == CODED) {
  if (key == 'w') {
    player1.isMovingUp = false;
  }
  //}
  //if (key == CODED) {
  if (key == 's') {
    player1.isMovingDown = false;
  }
  // }
  //if (key == CODED) {
  if (key == 'd') {
    player1.isMovingRight = false;
  }
  //}
  if (key == 'a') {
    player1.isMovingLeft = false;
  }
}
