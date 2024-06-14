//Global Variables and objects
Ball firstBall; //Both halfs of Constructor
Ball secondBall;
Ball thirdBall;
Ball forthBall;
Ball fifthBall;
Ball sixthBall;
color backgroundColor;
color pongTableColor = 255;
//
void setup() {
  size( 700, 400 );//width and height of canvas //fullscreen(); = size(displayWidth, displayHeight);
  /*ScreenSizeChecker(); //for landscape, portrait or square veiw 
  Automatically adjusts for screen rotaction or change*/
  firstBall = new Ball();
  secondBall = new Ball();
  thirdBall = new Ball();
  forthBall = new Ball();
  fifthBall = new Ball();
  sixthBall = new Ball();
  backgroundColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
}//end setup
//
void draw() {
  background(backgroundColor);
  firstBall.ballDraw();
  firstBall.animatingMovement();
  secondBall.ballDraw();
  secondBall.animatingMovement();
  thirdBall.ballDraw();
  thirdBall.animatingMovement();
  forthBall.ballDraw();
  forthBall.animatingMovement();
  fifthBall.ballDraw();
  fifthBall.animatingMovement();
  sixthBall.ballDraw();
  sixthBall.animatingMovement();
}//end draw
//
void keyPressed() {}//end keyPressed
//
void mousePressed() {}//end mousepressed
//
void ballCollisions() {
  /*
  if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
  if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
  if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) (xVelocity) *= -1;
  if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) (yVelocity) *= -1;
  */
}//end ballCollisions
//end Arithmetics
