class Enemy1 {
  //class variables
  int x;
  int y;
  int d;
  int xSpeed;
  int ySpeed;
  color c;
  int enemyT;
  int enemyB;
  int enemyR;
  int enemyL;
  boolean isShot;
  boolean wallTouch;
  Animation2 enemy1Animation;

  //make constructor function
  Enemy1(int tempX, int tempY, int tempD, int tempXSpeed, int tempYSpeed) {
    x = tempX;
    y = tempY;
    d = tempD;
    xSpeed = tempXSpeed;
    ySpeed = tempYSpeed;
    enemyT = y - d/2;
    enemyB = y + d/2;
    enemyR = x + d/2;
    enemyL = x - d/2;
    c = color(random(0, 255), random(0, 255), random(0, 255));
    isShot = false;
    wallTouch = false;
  }

  Enemy1(Animation2 tempEnemy1Animation, int tempYSpeed) {
    enemy1Animation = tempEnemy1Animation;
    x = int(random(d/2, width-d/2));
    y = int(random(0, 0));
    d = 60;
    c = color(0, 255, 0);

    ySpeed = tempYSpeed;

    //if (ySpeed == 0) {
    //  ySpeed = 10;
    //}
  }

  /*
    FUNCTIONS
   */
  //ball display
  void render() {
    fill(c);
    circle(x, y, d);
  }
  //ball movement

  void move() {
    y = y + ySpeed;

    enemyT = y - d/2;
    enemyB = y + d/2;
    enemyR = x + d/2;
    enemyL = x - d/2;
  }

  /*
This function checks if the ball is touching an edge. If it is, the speed flips
   */
  void wallDetect() {

    //if (y-d/2 >= height) {
    //  new enemy;
    //}
  }

  void collision (Bullet aBullet) {
    if (enemyR > aBullet.bL)/*check*/ {
      //println("work1");
      if (enemyL < aBullet.bR)/*check*/ {
        //println("work2");
        if (enemyT < aBullet.bB)/*check*/ {
          //println("work3");
          if (enemyB > aBullet.bT)/*check*/ {
            //println("work4");
            isShot = true;
            enemy1Animation.isAnimating = true;

          }
        }
      }
    }
  }
  
   void wallCollide() {
    if (enemyT >= height || enemyB >= height) {
      wallTouch = true;
    }
    
    //if (enemyT2 <= 0 || enemyL2 <= 0 || enemyR2 <= 0 || enemyB2 <= 0 ) {
    //  isShot2 = true;
    //}
  }

}
