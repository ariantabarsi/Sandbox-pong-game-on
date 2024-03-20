/*Known Errors
night mode = Random ball color*/
class Ball {
  //Global Variables
  float ballX, ballY, ballDiameter;
  float xVelocity, yVelocity;
  float xDelta, yDelta;
  float gravity = 0.0;
  float playAreaY, playAreaX, playAreaHeight, playAreaWidth;
  float RacketX, RacketY, RacketWidth, RacketHeight;
  boolean disappear = true;
  boolean inRange;
  color ballColor;
  PImage img;
  //Ball Constructor
  Ball() {
    //code for all balls
    int startX = (width/2);//middle of canvas
    int startY = (height/2);//middle of canvas
    int referentMeasures = (width<height) ? (width):(height) ; //ternary Operator = chooses the smaller value
    //object variables //this is "new Ball()"
    this.ballDiameter = referentMeasures/20;
    this.ballX = startX-((ballDiameter)/2);
    this.ballY = startY-((ballDiameter)/2);
    this.ballColor = color(255, 255, 255);
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
    this.ballColor = color(255, 255, 255);
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
    if (firstBall.ballX <= (ballDiameter/2) || firstBall.ballX >= (width)-(ballDiameter/2)) firstBall.ballColor = color(255, 255, 255);
    if (firstBall.ballY <= (ballDiameter/2) || firstBall.ballY >= (height)-(ballDiameter/2)) firstBall.ballColor = color(255, 255, 255);
    if (cheatBall.ballX <= (ballDiameter/2) || cheatBall.ballX >= (width)-(ballDiameter/2)) cheatBall.ballColor = color(255, 255, 255);
    if (cheatBall.ballY <= (ballDiameter/2) || cheatBall.ballY >= (height)-(ballDiameter/2)) cheatBall.ballColor = color(255, 255, 255);
    if (ballX <= (ballDiameter/2) || ballX >= (width)-(ballDiameter/2)) (xVelocity) *= -1;
    if (ballY <= ((firstRacket.playAreaY)+(ballDiameter/2)) || ballY >= ((height)-((ballDiameter/2)+(firstRacket.playAreaY)))) (yVelocity) *= -1;
  }//end bounce
  void ballDraw() {
    stroke(ballColor);
    fill(ballColor);
    ellipse( ballX, ballY, ballDiameter, ballDiameter );
    fill(0);
    img = loadImage("Capture1-removebg-preview.png");
    imageMode(CENTER); // Draw the image from its center
     image(img, ballX, ballY, ballDiameter, ballDiameter); // Draw the image at
    animatingMovement();//manipulating the variables
  }//end draw for ball constructor
  void animatingMovement() {
    yVelocity += gravity;//ball() uneffected thus no gravity = constructor has no gravity variable
    ballX += (xVelocity);
    ballY += (yVelocity);
    //for (int i=0; i < firework.length; i++) firework[i].ballDiameter -= (ballDiameter/4);
    bounce();
  }//end animatingMovement
  void collisionsUpdate(float playAreaYLocal, float playAreaHeightLocal, float playAreaWidthLocal, float playAreaXLocal, float RacketXLocal, float RacketYLocal, float RacketWidthLocal, float RacketHeightLocal, float firstRacketX, float secondRacketX, float firstRacketY, float secondRacketY ) {
    playAreaY = playAreaYLocal;
    playAreaHeight = playAreaHeightLocal;
    playAreaWidth = playAreaXLocal + playAreaWidthLocal;
    RacketX = ( RacketXLocal < playAreaWidth/2) ? firstRacketX : secondRacketX;
    RacketY = ( RacketYLocal < playAreaWidth/2) ? firstRacketY : secondRacketY;
    RacketWidth = RacketWidthLocal;
    RacketHeight = RacketHeightLocal;
    println(firstBall.inRange);
    println(cheatBall.inRange);
    println(secondRacket.RacketX);
    println(firstRacket.RacketX);
    println(firstBall.ballX);
    firstBall.inRange();
    if (firstBall.inRange) { firstBall.collisionsRacket(); } else {}
    cheatBall.inRange();
    if (cheatBall.inRange) { cheatBall.collisionsRacket(); } else {}
  }//collisionsUpdate
  void collisionsRacket() {
    if (ballX+ballDiameter >= firstRacket.RacketX && ballX <= firstRacket.RacketX+firstRacket.RacketWidth && ballY >= firstRacket.RacketY && ballY <= firstRacket.RacketY+firstRacket.RacketHeight) {
      firstRacket.RacketColor = color(255, 255, 255);
      ballX = firstRacket.RacketX + firstRacket.RacketWidth;
      xVelocity *= -1;
    }
    if (ballX+ballDiameter/2 >= secondRacket.RacketX && ballX <= secondRacket.RacketX+secondRacket.RacketWidth && ballY+ballDiameter >= secondRacket.RacketY && ballY <= secondRacket.RacketY+secondRacket.RacketHeight) {
      secondRacket.RacketColor = color(255, 255, 255);
      ballX = secondRacket.RacketX - secondRacket.RacketWidth;
      xVelocity *= -1;
    }
  }//end collisonRacket
  void inRange() {
    if (ballX >= firstRacket.RacketX-firstRacket.RacketWidth && ballX <= secondRacket.RacketX) {
      this.inRange = true;
    } else this.inRange = false;
  }//end inRange
}//end Ball
//end pongBall
