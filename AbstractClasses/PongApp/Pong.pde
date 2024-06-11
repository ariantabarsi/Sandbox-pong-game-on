//Global Variables
boolean pongOn = false;
boolean pongGameOn = false;
PongPlayArea pongPlayArea;
Firework[] firework = new Firework[10];
Ball firstBall, secondBall;
Paddle firstPaddle, secondPaddle;
ScoreKeep leftScoreKeep, rightScoreKeep;
Button quit, pauseGame;
//
void setupPong() {
  pongPlayArea = new PongPlayArea(width/2-((width*2)/5), height/10, (width*4)/5, (height*7)/10, secondaryColor);
  firstBall = new Ball(pongPlayArea.x+(pongPlayArea.w/2)-(height/50), pongPlayArea.y+(pongPlayArea.h/2)-(height/50), 0, 0, 0);
  secondBall = new Ball(width*1.1, height*1.1, 0, 0, 0, firstBall.xVelocity, firstBall.yVelocity);
  for (int i=0; i < firework.length; i++) firework[i] = new Firework(width*1.1, height*1.1, 0, 0, 0, 0.5);
  firstPaddle = new Paddle(0, 0, 0, 0, 0, width/10);
  secondPaddle = new Paddle(0, 0, 0, 0, 0, ((width*9)/10));
  pauseGame = new Button(refMeasure, height/10, height/8, height/14, 0); 
  leftScoreKeep = new ScoreKeep(0, height/10+height/14+(refMeasure/2), 0, 0, 0);
  rightScoreKeep = new ScoreKeep(0, leftScoreKeep.y+leftScoreKeep.h+(refMeasure/2), 0, 0, 0);
  firstBall.collisionPlayArea(pongPlayArea.x, pongPlayArea.y, pongPlayArea.w, pongPlayArea.h);
  firstBall.disappear = false;
  secondBall.disappear = true;
}//end setupPong
void drawPong() {
  if (pongOn) drawPongOn();
}//end drawPong
void mousePressedPong() {
  if (pongOn) mousePressedPongOn();
}//end mousePressedPong
void keyPressedPong() {
  if (pongOn) keyPressedPongOn();
}//end keyPressedPong
void keyReleasedPong() {
  firstPaddle.paddleKeyReleasedWSAD();//stops left paddle movement
  secondPaddle.paddleKeyReleasedARROWKEYS();//stops right paddle movement
}//end keyReleasedPong
//
void drawPongOn() {
  background(background);
  pongPlayArea.drawing();
  for (int i=0; i < firework.length; i++) firework[i].explosions(firstBall.x, firstBall.y, firstBall.w);
  for (int i=0; i < firework.length; i++) firework[i].drawing();
  if (!firstBall.disappear) firstBall.drawing();
  if (!secondBall.disappear) secondBall.drawing();
  firstPaddle.drawing();
  secondPaddle.drawing();
  pauseGame.drawing(hoverOver, secondaryColor);
  pauseGame.rectSwitchingText("Pause", "Play", pongGameOn);
  firstBall.collisionUpdate(firstPaddle.x, firstPaddle.y, firstPaddle.w, firstPaddle.h, secondPaddle.x, secondPaddle.y, secondPaddle.w, secondPaddle.h);
  leftScoreKeep.drawing();
  rightScoreKeep.drawing();
  leftScoreKeep.scoreKeepUpdate(firstBall.scoreLeft, firstBall.scoreRight, firstBall.scoreLeftText, firstBall.scoreRightText);
  rightScoreKeep.scoreKeepUpdate(firstBall.scoreLeft, firstBall.scoreRight, firstBall.scoreLeftText, firstBall.scoreRightText);
}//end drawPong
void mousePressedPongOn() {
  if ( mouseX>=pongPlayArea.x && mouseX<=pongPlayArea.x+pongPlayArea.w && mouseY>=pongPlayArea.y && mouseY<=pongPlayArea.y+pongPlayArea.h ) {
    secondBall.disappear = false;
    secondBall = new Ball(mouseX, mouseY, firstBall.w, firstBall.w, firstBall.c, firstBall.xVelocity, firstBall.yVelocity);//initiates after mousePressed
    //for (int i=0; i < firework.length; i++) firework[i] = new Ball(int(mouseX), int(mouseY), 0.5);//populating firework
  }
  pauseGame.mousePressedPauseGameFunction();
}//end mousePressedPong
void keyPressedPongOn() {
  firstPaddle.paddleKeyPressedWASD();
  secondPaddle.paddleKeyPressedARROWKEYS();
  if (key == '3') pongOnOffSwitch();//switches pong on and off
}//end keyPressedPong
void pongOnOffSwitch() {
  if (pongGameOn) { pongGameOn = false; } else { pongGameOn = true; }//switches pong on and off
}//end pongOnOffSwitch
//end Pong subProgram
