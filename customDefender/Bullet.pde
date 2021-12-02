class Bullet {
  float bX;
  float bY;
  float bD;
  color bC;
  float bSpeed;
  //hitbox vars
  float bT;
  float bB;
  float bR;
  float bL;


  //constructor function
  Bullet(float bX_, float bY_, float bD_, color bC_) {
    bX = bX_;
    bY = bY_;
    bC = bC_;
    bD = bD_;
    bT = bY - bD/2;
    bB = bY + bD/2;
    bR = bX + bD/2;
    bL = bX - bD/2;
    
    
    if (player1.pX>width/2) {
      bSpeed = 15;
    } 
    if (player1.pX<width/2) {
      bSpeed = -15;
    } 
  }

  void render() {
    fill(bC);
    circle(bX, bY, bD);
  }

  /*
This function takes updates the position the ball according to its speed.
   */
  void move() {
    //if (keyPressed) {
    //  if (key == 'w') {
      bX += bSpeed;
 
    
    //  }
    //  }
    bT = bY - bD/2;
    bB = bY + bD/2;
    bR = bX + bD/2;
    bL = bX - bD/2;
  }
  
  void wallDetect(){
    if (bT >= width || bL >= width || bR >= width || bB >= width) {
        bulletList.remove(bullet1);
    }
    
    if (bT <= 0 || bL <= 0 || bR <= 0 || bB <= 0 ) {
        bulletList.remove(bullet1);
    } 
  }
}
