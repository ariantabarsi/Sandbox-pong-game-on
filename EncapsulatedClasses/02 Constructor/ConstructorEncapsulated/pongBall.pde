class Ball {
  //Global Variables
  float ballX, ballY, ballDiameter;
  float xVelocity, yVelocity;
  int xDircetion, YDirection;
  color ballColor;
  //Constructor
  Ball() {
    //This is "Ball myBall"
    int startX = (width/2);//middle of canvas
    int startY = (height/2);//middle of canvas
    int referentMeasures = (width<height) ? (width):(height) ; //ternary Operator
    //object variables //this is "new Ball()"
    ballDiameter = referentMeasures/20;
    ballX = startX-((ballDiameter)/2);
    ballY = startY-((ballDiameter)/2);
    ballColor = color(245, 189, 2); //RGB color
    xVelocity = width/(width);//speed of ball
    yVelocity = height/(height);//speed of ball
  }//end Ball hard coded constructor
  void animatingMovement() {
    ballX += (xVelocity);
    ballY += (yVelocity);
  }//end animatingMovement
  void bounce() {
    
  }//end bounce
  void ballDraw() {
    fill(ballColor);
    ellipse( ballX, ballY, ballDiameter, ballDiameter );
  }//end draw for ball constructor
}//end Ball
//end pongBall
