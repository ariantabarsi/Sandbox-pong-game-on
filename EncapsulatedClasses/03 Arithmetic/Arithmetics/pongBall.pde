/*Known Errors
night mode = Random ball color*/
class Ball {
  //Global Variables
  float ballX, ballY, ballDiameter;
  float xVelocity, yVelocity;
  float xDirection, yDirection;
  color ballColor;
  //Constructor
  Ball() {
    //code for all balls
    int startX = (width/2);//middle of canvas
    int startY = (height/2);//middle of canvas
    int referentMeasures = (width<height) ? (width):(height) ; //ternary Operator
    //object variables //this is "new Ball()"
    this.ballDiameter = referentMeasures/20;
    this.ballX = startX-((ballDiameter)/2);
    this.ballY = startY-((ballDiameter)/2);
    this.ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255))); //RGB color
    this.xVelocity = yDirection();
    this.yVelocity = xDirection();
    this.xDirection = width/(width);//speed of ball
    this.yDirection = height/(height);//speed of ball
  }//end Ball hard coded constructor
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
  void animatingMovement() {
    bounce();
    ballX += (xVelocity);
    ballY += (yVelocity);
  }//end animatingMovement
  void bounce() {
    if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) (xVelocity) *= -1;
    if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) (yVelocity) *= -1;
  }//end bounce
  void ballDraw() {
    fill(ballColor);
    ellipse( ballX, ballY, ballDiameter, ballDiameter );
  }//end draw for ball constructor
}//end Ball
//end pongBall
