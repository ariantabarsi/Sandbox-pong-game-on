/*Known Errors
night mode = Random ball color*/
//Class
class Ball {
  //Global Variables
  float ballX, ballY, ballDiameter;
  float xVelocity, yVelocity;
  float xDelta, yDelta;
  float gravity = 0.0;
  float playAreaY, playAreaX, playAreaHeight, playAreaWidth;
  float paddleX, paddleY, paddleWidth, paddleHeight;
  boolean disappear;
  boolean inRange;
  color ballColor;
  //Ball Constructor
  Ball() {
    //code for all balls
    int startX = (width/2);//middle of canvas
    int startY = (height/2);//middle of canvas
    int referentMeasures = (width<height) ? (width):(height) ; //ternary Operator = chooses the smaller value
    //object variables //this is "new Ball()"
    this.ballDiameter = referentMeasures/25;
    this.ballX = startX-((ballDiameter)/2);
    this.ballY = startY-((ballDiameter)/2);
    this.ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255))); //RGB color
    this.xDelta = width/(width);//speed of ball
    this.yDelta = height/(height);//speed of ball
    this.xVelocity = yDirection();
    this.yVelocity = xDirection();
  }//end Ball hard coded constructor
  //cheatBall Constructor
  Ball(float ballXLocal, float ballYLocal, float ballDiameterParameter, color ballColorParameter, float xVelocityLocal, float yVelocityLocal) {
    this.ballX = ballXLocal;
    this.ballY = ballYLocal;
    this.ballDiameter = ballDiameterParameter;
    this.ballColor = ballColorParameter;
    this.xVelocity = xVelocityLocal;
    this.yVelocity = yVelocityLocal;
  }//end cheatBall
  //Firework Constructor
  Ball(float ballXLocal, float ballYLocal, float gravityLocal) {
    //triggers when ball enters goal region
    this.ballX = ballXLocal;
    this.ballY = ballYLocal;
    this.ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255))); //RGB color
    this.ballDiameter = random(firstBall.ballDiameter/1.1);
    this.xVelocity = random(-5, 5);
    this.yVelocity = random(-5, 5);
    gravity = gravityLocal;
  }//end Firework Constructor
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
  void bounce() {
    if (firstBall.ballX <= ((ballDiameter/2)+(width/10)) || firstBall.ballX >= ((width*9)/10)-(ballDiameter/2)) firstBall.ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    if (cheatBall.ballX <= ((ballDiameter/2)+(width/10)) || cheatBall.ballX >= ((width*9)/10)-(ballDiameter/2)) cheatBall.ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    if (ballX <= ((ballDiameter/2)+(width/10)) || ballX >= ((width*9)/10)-(ballDiameter/2)) (xVelocity) *= -1;
    if (ballY <= ((firstPaddle.playAreaY)+(ballDiameter/2)) || ballY >= (height*8/10)-(ballDiameter/2)) (yVelocity) *= -1;
  }//end bounce
  void ballDraw() {
    stroke(ballColor);
    fill(ballColor);
    ellipse( ballX, ballY, ballDiameter, ballDiameter );
    fill(0);
    if (pongGameOn) animatingMovement();//manipulating the variables
  }//end draw for ball constructor
  void animatingMovement() {
    yVelocity += gravity;//ball() uneffected thus no gravity = constructor has no gravity variable
    ballX += (xVelocity);
    ballY += (yVelocity);
    //for (int i=0; i < firework.length; i++) firework[i].ballDiameter -= (ballDiameter/4);
    bounce();
  }//end animatingMovement
  void collisionsUpdate(float playAreaYLocal, float playAreaHeightLocal, float playAreaWidthLocal, float playAreaXLocal, float paddleXLocal, float paddleYLocal, float paddleWidthLocal, float paddleHeightLocal, float firstPaddleX, float secondPaddleX, float firstPaddleY, float secondPaddleY ) {
    playAreaY = playAreaYLocal;
    playAreaHeight = playAreaHeightLocal;
    playAreaWidth = playAreaXLocal + playAreaWidthLocal;
    paddleX = ( paddleXLocal < playAreaWidth/2) ? firstPaddleX : secondPaddleX;
    paddleY = ( paddleYLocal < playAreaWidth/2) ? firstPaddleY : secondPaddleY;
    paddleWidth = paddleWidthLocal;
    paddleHeight = paddleHeightLocal;
    firstBall.inRange();
    if (inRange) firstBall.collisionsPaddle();
    if (inRange) cheatBall.inRange();
    cheatBall.collisionsPaddle();
  }//collisionsUpdate
  void collisionsPaddle() {
    if (ballX+ballDiameter >= firstPaddle.paddleX && ballX <= firstPaddle.paddleX+firstPaddle.paddleWidth && ballY >= firstPaddle.paddleY && ballY <= firstPaddle.paddleY+firstPaddle.paddleHeight) {
      if (pongGameOn) firstPaddle.paddleColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      ballX = firstPaddle.paddleX + firstPaddle.paddleWidth;
      xVelocity *= -1;
    }
    if (ballX+ballDiameter/2 >= secondPaddle.paddleX && ballX <= secondPaddle.paddleX+secondPaddle.paddleWidth && ballY >= secondPaddle.paddleY && ballY <= secondPaddle.paddleY+secondPaddle.paddleHeight) {
       if (pongGameOn) secondPaddle.paddleColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      ballX = secondPaddle.paddleX - secondPaddle.paddleWidth;
      xVelocity *= -1;
    }
  }//end collisonPaddle
  void inRange() {
    if (ballX >= firstPaddle.paddleX-firstPaddle.paddleWidth && ballX <= secondPaddle.paddleX) {
      this.inRange = true;
    } else this.inRange = false;
  }//end inRange
  void winCondition() {
    if (ballX <= ((ballDiameter/2)+(width/10)) || ballX >= ((width*9)/10)-(ballDiameter/2)) {
      if (ballX <= ((ballDiameter/2)+(width/10))) {
        scoreRight++;
        pongGameOn = false;
      } else  {
        scoreLeft++;
        pongGameOn = false;
      }
    }
  }//end winCondition
  void pongBallGameReset() {
    if (cheatBall.disappear) cheatBall.disappear = true;
    firstBall.disappear = false;
    ballX = (width/2)-(ballDiameter/2);
    ballY = (height/2)-(ballDiameter/2);
  }//end gameReset
}//end Ball
//end pongBall
