//Global Variables and Objects
boolean pongOn = false;
Ball firstBall; //Both halfs of Constructor
Ball cheatBall;//appears when clicked
Ball[] firework = new Ball[10];//generates multiple balls that fall with gravity
Paddle pongPlayArea, firstPaddle, secondPaddle;
color backgroundColor;
//
void setupPong() { 
  firstBall = new Ball();
  cheatBall = new Ball(width*-1, height*-1, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);
  for (int i=0; i < firework.length; i++) firework[i] = new Ball(width*-1, height*-1, (1/2));//populating firework
  pongPlayArea = new Paddle();
  firstPaddle = new Paddle( 0, firstBall.ballDiameter );
  secondPaddle = new Paddle( width, firstBall.ballDiameter );
  firstBall.disappear = false;
  backgroundColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
}
void drawPong() { if (pongOn) drawPongOn(); }
void mousePressedPong() { if (pongOn) mousePressedPongOn(); }
void keyPressedPong() { if (pongOn) keyPressedPongOn(); }
void keyReleasedPong() {
  firstPaddle.paddleKeyReleasedWSAD();
  secondPaddle.paddleKeyReleasedARROWKEYS();
}
//
void drawPongOn() {
  background(backgroundColor);
  pongPlayArea.drawPlayArea();
  firstPaddle.drawPaddle();
  secondPaddle.drawPaddle();
  firstPaddle.paddleMove();
  secondPaddle.paddleMove();
  for (int i=0; i < firework.length; i++) firework[i].ballDraw(); //drawing multiple balls
  explosions();
  if (firstBall.disappear) {/*empty if*/} else firstBall.ballDraw();
  if (cheatBall.disappear) {/*empty if*/} else cheatBall.ballDraw();
  firstBall.collisionsUpdate(firstPaddle.playAreaY, firstPaddle.playAreaHeight, firstPaddle.playAreaWidth, firstPaddle.playAreaX, firstPaddle.paddleX, firstPaddle.paddleY, firstPaddle.paddleWidth, firstPaddle.paddleHeight, firstPaddle.paddleWidth, secondPaddle.paddleWidth, firstPaddle.paddleHeight, secondPaddle.paddleHeight);
  //println(firstPaddle.playAreaY, firstPaddle.playAreaHeight, firstPaddle.playAreaWidth, firstPaddle.playAreaX, firstPaddle.paddleX, firstPaddle.paddleY, firstPaddle.paddleWidth, firstPaddle.paddleHeight, firstPaddle.paddleX, secondPaddle.paddleX, firstPaddle.paddleY, secondPaddle.paddleY);
}
void mousePressedPongOn() {
  //for (int i=0; i < firework.length; i++) firework[i] = new Ball(int(mouseX), int(mouseY), 0.5);//populating firework
  cheatBall = new Ball(mouseX, mouseY, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);//initiates after mousePressed
}
void keyPressedPongOn() {
  if (key == '1') firstBall.disappear = true;
  if (key == '2') cheatBall.disappear = true;
  firstPaddle.paddleKeyPressedWASD();
  secondPaddle.paddleKeyPressedARROWKEYS();
}
void explosions() { //firework effect when goal region hit
  if (mousePressed) cheatBall.disappear  = false;
  /*if (firstBall.ballX <= (firstBall.ballDiameter/2) || firstBall.ballX >= (width)-(firstBall.ballDiameter/2)) {
    for (int i=0; i < firework.length; i++) 
    firework[i] = new Ball(firstBall.ballX, firstBall.ballY, 0.5); //drawing multiple balls
  }
  if (!cheatBall.disappear) {
    if (cheatBall.ballX <= (cheatBall.ballDiameter/2) || cheatBall.ballX >= (width)-(cheatBall.ballDiameter/2)) {
      for (int i=0; i < firework.length; i++) 
      firework[i] = new Ball(cheatBall.ballX, cheatBall.ballY, 0.5); //drawing multiple balls
    }
  }*/
}//end explosions
//end pongPractice subProgram
