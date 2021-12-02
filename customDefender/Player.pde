class Player {
  float pX;
  float pY;
  float pSX;
  float pSY;
  float pSpeed;
  color pC;
  boolean isMovingUp;
  boolean isMovingDown;
  boolean isMovingLeft;
  boolean isMovingRight;

  //constructor function
  Player(float pX_, float pY_, float pSX_, float pSY_, color pC_) {
    pX = pX_;
    pY = pY_;
    pC = pC_;
    pSX = pSX_;
    pSY = pSY_;
    pSpeed = 5;
  }

  void render() {
    fill(pC);
    rect(pX, pY, pSX, pSY);

    //line(pX+sx, pY+sy/2, pX+800, pY+sy/2);
    //    line(pX+sx, pY+sy/2, pX+800, pY+sy/2);

  }

  /*
This function takes updates the position the ball according to its speed.
   */
  void move() {
    if (isMovingUp == true) {
      player1.pY = player1.pY -= player1.pSpeed;
    }
    if (isMovingDown == true) {
      player1.pY = player1.pY += player1.pSpeed;
    }
    if (isMovingRight == true) {
      player1. pX = player1.pX += player1.pSpeed;
    }
    if (isMovingLeft == true) {
      player1.pX = player1.pX -= player1.pSpeed;
    }
  }
}
