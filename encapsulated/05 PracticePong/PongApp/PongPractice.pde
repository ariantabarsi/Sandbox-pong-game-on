//Global Variables and Objects
boolean pongOn = false;//turn pong screen on and off
boolean pongGameOn = false;//turn pong game on and off
int scoreLeft = 0, scoreRight = 0;
String scoreLeftText = "0", scoreRightText = "0";
Ball firstBall; //Both halfs of Constructor
Ball cheatBall;//appears when clicked
Ball[] firework = new Ball[10];//generates multiple balls that fall with gravity
Paddle pongPlayArea, firstPaddle, secondPaddle;
//
void setupPong() {
  population();
  pongPause = new Rectangle(refMeasure, height/10, height/8, height/14);
  scoreKeepLeft = new Rectangle(refMeasure, pongPause.rectY+pongPause.rectHeight+(refMeasure/2), height/8, height/8);
  scoreKeepRight = new Rectangle(refMeasure, scoreKeepLeft.rectY+scoreKeepLeft.rectHeight+(refMeasure/2), height/8, height/8);
  scoreKeepReset = new Rectangle(refMeasure, scoreKeepRight.rectY+scoreKeepRight.rectHeight+(refMeasure/2), height/8, height/14);
  pongGameReset = new Rectangle((refMeasure*2)+(width/6));
  firstBall = new Ball();//creates first ball
  cheatBall = new Ball(width*-1, height*-1, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);//creates click ball
  for (int i=0; i < firework.length; i++) firework[i] = new Ball(width*-1, height*-1, (1/2));//populating firework
  pongPlayArea = new Paddle();//creates the playArea rect
  firstPaddle = new Paddle( (width/10), firstBall.ballDiameter );//creates left paddle
  secondPaddle = new Paddle( ((width*9)/10), firstBall.ballDiameter );//creates right paddle
  firstBall.disappear = false;//prepares the ball to appear
  cheatBall.disappear = true;
}//end setupPong
void keyReleasedPong() {
  firstPaddle.paddleKeyReleasedWSAD();//stops left paddle movement
  secondPaddle.paddleKeyReleasedARROWKEYS();//stops right paddle movement
}//end keyReleasedPong
//
void drawPong() { if (pongOn) drawPongOn(); }//end drawPong
void mousePressedPong() { if (pongOn) mousePressedPongOn(); }//end mousePressedPong
void keyPressedPong() { if (pongOn) keyPressedPongOn(); }//end keyPressedPong
//
void drawPongOn() {
  background(background);
  prerequisites();
  pongPlayArea.drawPlayArea();//draws playArea rect
  firstPaddle.drawPaddle();//draws left paddle
  secondPaddle.drawPaddle();//draws right paddle
  if (pongGameOn) firstPaddle.paddleMove();//moves left paddle
  if (pongGameOn) secondPaddle.paddleMove();//moves right paddle
  for (int i=0; i < firework.length; i++) firework[i].ballDraw(); //drawing multiple balls
  if (firstBall.disappear) {/*empty if*/} else firstBall.ballDraw();
  if (cheatBall.disappear) {/*empty if*/} else cheatBall.ballDraw();
  explosions();//firwork effect
  //paddle collisions with ball resulting in bounce()
  firstBall.collisionsUpdate(firstPaddle.playAreaY, firstPaddle.playAreaHeight, firstPaddle.playAreaWidth, firstPaddle.playAreaX, firstPaddle.paddleX, firstPaddle.paddleY, firstPaddle.paddleWidth, firstPaddle.paddleHeight, firstPaddle.paddleWidth, secondPaddle.paddleWidth, firstPaddle.paddleHeight, secondPaddle.paddleHeight);
  UIpong();
  if (pongGameOn) winnerDeclar();
}//end drawPongOn
void mousePressedPongOn() {
  //prevents cheatball appearence out of play area
  if ( mouseX>=pongPlayArea.playAreaX && mouseX<=pongPlayArea.playAreaX+pongPlayArea.playAreaWidth && mouseY>=pongPlayArea.playAreaY && mouseY<=pongPlayArea.playAreaY+pongPlayArea.playAreaHeight ) {
    cheatBall.disappear = false;
    cheatBall = new Ball(mouseX, mouseY, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);//initiates after mousePressed
    //for (int i=0; i < firework.length; i++) firework[i] = new Ball(int(mouseX), int(mouseY), 0.5);//populating firework
  }
  if ( mouseX>=pongPause.rectX && mouseX<=pongPause.rectX+pongPause.rectWidth && mouseY>=pongPause.rectY && mouseY<=pongPause.rectY+pongPause.rectHeight )
  pongOnOffSwitch();
  if ( mouseX>=pongGameReset.rectX && mouseX<=pongGameReset.rectX+pongGameReset.rectWidth && mouseY>=pongGameReset.rectY && mouseY<=pongGameReset.rectY+pongGameReset.rectHeight )
  pongGameReset();
  if ( mouseX>=scoreKeepReset.rectX && mouseX<=scoreKeepReset.rectX+scoreKeepReset.rectWidth && mouseY>=scoreKeepReset.rectY && mouseY<=scoreKeepReset.rectY+scoreKeepReset.rectHeight )
  resetPongScore();
}//draw mousePressedPongOn
void keyPressedPongOn() {
  if (key == '1') {
    if (!firstBall.disappear) {
      firstBall.disappear = true;
    } else {
      firstBall.disappear = false;
    }
  } //debugging tool
  if (key == '2') cheatBall.disappear = true;//debugging tool
  if (key == '3') pongOnOffSwitch();//switches pong on and off
  if (key == '4') pongGameReset();//resets the paddle and ball positions
  firstPaddle.paddleKeyPressedWASD();//connects left paddle movement to WASD
  secondPaddle.paddleKeyPressedARROWKEYS();//connects right paddle movement to Arrow keys
}//end keyPressedPongOn
void pongGameReset() {
  //pongGameOn = false;
  if (!firstBall.disappear) firstBall.pongBallGameReset(); 
  if (!cheatBall.disappear) cheatBall.pongBallGameReset();
  firstPaddle.pongPaddleGameReset();
  secondPaddle.pongPaddleGameReset();
}//end pongGameReset
void UIpong() {
  pongPause.button(#8D9EFF, #CCC1FF, (refMeasure*2)/7);
  UIpongText("PAUSE", "PLAY");
  scoreKeepLeft.drawRect(0, #CCC1FF);
  scoreKeepRight.drawRect(0, #CCC1FF);
  scoreKeepLeft.rectText(scoreLeftText);
  scoreKeepRight.rectText(scoreRightText);
  scoreKeepReset.button(#8D9EFF, #CCC1FF, (refMeasure*2)/7);
  scoreKeepReset.rectText("Reset");
  pongGameReset.button(#8D9EFF, #CCC1FF, (refMeasure*2)/7);
  pongGameReset.rectText("Reset Game");
}//end UIpong
void UIpongText(String Text, String Text1) {
  if (pongGameOn) {
    pongPause.buttonBooleanText(true, Text, Text1);
  } else {
    pongPause.buttonBooleanText(false, Text, Text1);
  }
}//end UIpongText
void resetPongScore() {
  scoreLeft = 0;
  scoreRight = 0;
  scoreLeftText = "0";
  scoreRightText = "0";
}//end resetPongScore
void winnerDeclar() {
  if (!firstBall.disappear) {
    firstBall.winCondition();
  }
  if (!cheatBall.disappear) { 
    cheatBall.winCondition();
  }
  scoreLeftText = String.valueOf(scoreLeft);//converts int to string to print
  scoreRightText = String.valueOf(scoreRight);//converts int to string to print
}//end winDeclar
void pongOnOffSwitch() {
  if (pongGameOn) { pongGameOn = false; } else { pongGameOn = true; }//switches pong on and off
}//end pongOnOffSwitch
void explosions() { //firework effect when goal region hit
  /*if (firstBall.ballX <= ((firstBall.ballDiameter/2)+(width/10)) || firstBall.ballX >= ((width*9)/10)-(firstBall.ballDiameter/2)) {
    for (int i=0; i < firework.length; i++) 
    firework[i] = new Ball(firstBall.ballX, firstBall.ballY, 0.5); //drawing multiple balls
  }
  if (!cheatBall.disappear) {
    if (cheatBall.ballX <= ((cheatBall.ballDiameter/2)+(width/10)) || cheatBall.ballX >= ((width*9)/10)-(cheatBall.ballDiameter/2)) {
      for (int i=0; i < firework.length; i++) 
      firework[i] = new Ball(cheatBall.ballX, cheatBall.ballY, 0.5); //drawing multiple balls
    }
  }*/
}//end explosions
//end pongPractice subProgram
