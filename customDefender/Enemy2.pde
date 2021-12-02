class Enemy2 {
  //class variables
  int x2;
  int y2;
  int d2;
  int xSpeed2;
  int ySpeed2;
  color c2;
  int enemyT2;
  int enemyB2;
  int enemyR2;
  int enemyL2;
  boolean isShot2;
  boolean wallTouch2;
  Animation3 enemy2Animation;


  //make constructor function
  Enemy2(int tempX, int tempY, int tempD, int tempXSpeed, int tempYSpeed) {
    x2 = tempX;
    y2 = tempY;
    d2 = tempD;
    xSpeed2 = tempXSpeed;
    ySpeed2 = tempYSpeed;
    enemyT2 = y2 - d2/2;
    enemyB2 = y2 + d2/2;
    enemyR2 = x2 + d2/2;
    enemyL2 = x2 - d2/2;
    c2 = color(random(0, 255), random(0, 255), random(0, 255));
    isShot2 = false;
    wallTouch2 = false;
  }
  
  Enemy2(Animation3 tempEnemy2Animation, int tempXSpeed) {
    enemy2Animation = tempEnemy2Animation;
    x2 = int(random(width, width));
    y2 = int(random(0, height));
    d2 = 60;
    c2 = color(255, 0, 0);

    xSpeed2 = tempXSpeed;

    if (xSpeed2 == 0) {
      xSpeed2 = -10;
    }
  }

  Enemy2() {
    x2 = width - d2/2;
    y2 = int(random(0, height));
    d2 = 60;
    c2 = color(255, 0, 0);

    xSpeed2 = int(random(-10, -10));

    if (xSpeed2 == 0) {
      xSpeed2 = -10;
    }
  }

  /*
    FUNCTIONS
   */

  //ball display
  void render() {
    fill(c2);
    circle(x2, y2, d2);
  }
  //ball movement

  void move() {
    x2 = x2 - xSpeed2;

    enemyT2 = y2 - d2/2;
    enemyB2 = y2 + d2/2;
    enemyR2 = x2 + d2/2;
    enemyL2 = x2 - d2/2;
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
    if (enemyR2 > aBullet.bL)/*check*/ {
      // println("work1");
      if (enemyL2 < aBullet.bR)/*check*/ {
        // println("work2");
        if (enemyT2 < aBullet.bB)/*check*/ {
          //  println("work3");
          if (enemyB2 > aBullet.bT)/*check*/ {
            // println("work4");
            isShot2 = true;
            enemy2Animation.isAnimating = true;
          }
        }
      }
    }
  }

  void wallCollide() {
    //if (enemyT2 >= width || enemyL2 >= width || enemyR2 >= width || enemyB2 >= width ) {
    //  isShot2 = true;
    //}

    if (enemyL2 <= 0 || enemyR2 <= 0) {
      wallTouch2 = true;
    }
  }
}
