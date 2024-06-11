class Ball extends Circle {
  //Global Variables
  float xVelocity, yVelocity;
  int scoreLeft = 0, scoreRight = 0;
  String scoreLeftText = "0", scoreRightText = "0";
  boolean disappear;
  //color ballColor;
  //
  Ball(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    int referentMeasures = (width<height) ? (width):(height); //ternary Operator = chooses the smaller value
    //object variables //this is "new Ball()"
    this.w = referentMeasures/25;
    this.xVelocity = xDirection();
    this.yVelocity = yDirection();
    this.c = randomColor();
  }//end Ball
  Ball(float x, float y, float w, float h, color c, float xV, float yV) {
    super(x, y, w, h, c);
    this.x = x;
    this.y = y;
    this.w = w;
    this.c = randomColor();
    this.xVelocity = xV;
    this.yVelocity = yV;
  }//end cheatBall
  //Methods
  void drawing() {
    fill(c);
    ellipse(x, y, w, w);
    if (pongGameOn) moving();
    fill(colorReset);
  }//end draw
  float xDirection() {
    float xDirectionLocal = int(random(-6, 6));
    while (xDirectionLocal == 0) {
      xDirectionLocal = int(random(-6, 6));
    }
    return xDirectionLocal;
  }//end xDirection
  float yDirection() {
    float yDirectionLocal = int(random(-6, 6));
    while (yDirectionLocal == 0) {
      yDirectionLocal = int(random(-6, 6));
    }
    return yDirectionLocal;
  }//end yDirection
  //
  color backgroundColor() {
    color nightMode = 0;
    return nightMode;
  }//end Night Mode Color Selector
    void bounce() {
    if (x <= ((w/2)+(width/10)) || firstBall.x >= ((width*9)/10)-(w/2)) c = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    if (x <= ((w/2)+(width/10)) || x >= ((width*9)/10)-(w/2)) (xVelocity) *= -1;
    if (y <= ((playAreaY)+(w/2)) || y >= (playAreaH+playAreaY)-(w/2)) (yVelocity) *= -1;
  }//end bounce
  void moving() {
    x += (xVelocity);
    y += (yVelocity);
    //for (int i=0; i < firework.length; i++) firework[i].ballDiameter -= (ballDiameter/4);
    bounce();
    collisionsPaddle();
  }//end animatingMovement
  float playAreaX, playAreaY, playAreaW, playAreaH;
  void collisionPlayArea(float x, float y, float w, float h) {
    playAreaX = x;
    playAreaY = y;
    playAreaW = w;
    playAreaH = h;
  }//end collisonsUpdate
  float paddleX, paddleY, paddleW, paddleH;
  float paddleX1, paddleY1, paddleW1, paddleH1;
  void collisionUpdate(float x, float y, float w, float h, float x1, float y1, float w1, float h1) {
    paddleX = x;
    paddleY = y;
    paddleW = w;
    paddleH = h;
    paddleX1 = x1;
    paddleY1 = y1;
    paddleW1 = w1;
    paddleH1 = h1;
  }//end collisionUpdate
  void winCondition() {
    if (x <= ((w/2)+(width/10)) || x >= ((width*9)/10)-(w/2)) {
      if (x <= ((w/2)+(width/10))) {
        scoreRight++;
        scoreRightText = String.valueOf(scoreRight);//converts int to string to print
        toCenter();
        pongGameOn = false;
      } else  {
        scoreLeft++;
        scoreLeftText = String.valueOf(scoreLeft);//converts int to string to print
        toCenter();
        pongGameOn = false;
      }
    }
  }//end winCondition
  void toCenter() {
    x = playAreaX+(playAreaW/2)-(height/50);
    y = playAreaY+(playAreaH/2)-(height/50);
  }//end toCenter
  void collisionsPaddle() {
    if (x+w >= paddleX && x <= paddleX+paddleW && y >= paddleY && y <= paddleY+paddleH) {
      //if (pongGameOn) firstPaddle.paddleColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      x = paddleX + paddleW;
      xVelocity *= -1;
    }
    if (x+w/2 >= paddleX1 && x <= paddleX1+paddleW1 && y >= paddleY1 && y <= paddleY1+paddleH1) {
      //if (pongGameOn) secondPaddle.paddleColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      x = paddleX1 - w/2;
      xVelocity *= -1;
    }
  }//end collisonPaddle
  /* Features
   - Ball in net triggers FIREWORKS
   */
}//end Ball
