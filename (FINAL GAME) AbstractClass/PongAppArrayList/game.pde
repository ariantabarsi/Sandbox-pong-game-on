//Global Variables
boolean gameOn = false;
boolean gameGameOn = false;
boolean winConLeft = false;
boolean winConRight = false;
boolean oneplayer = false;
int scoreRight = 0;
int scoreLeft = 0;
//
void setupgame() {
  gametable gametable = new gametable (width/2-((width*2)/5), height/10, (width*4)/5, (height*7)/10, secondaryColor);
  gametable.variablesUpdate( (height/25), 0, 0, 0, 0, 0, 0, 0, 0);
  Ball firstBall = new Ball(gametable.x+(gametable.w/2), gametable.y+(gametable.h/2), 0, 0, 0);
  Ball secondBall = new Ball(firstBall.x, firstBall.y, firstBall.w, 0, 0, firstBall.xVelocity, firstBall.yVelocity);
  racket firstracket = new racket(0, 0, 0, 0, 0);
  racket secondracket = new racket(0, 0, 0, 0, 0);
  firstracket.variablesUpdate( gametable.x+gametable.w/2, gametable.leftNetX_Top, width/10, firstBall.w, gametable.y, gametable.h, 0, 0, 0);
  secondracket.variablesUpdate( gametable.x+gametable.w/2, gametable.rightNetX_Top, ((width*9)/10), firstBall.w, gametable.y, gametable.h, 0, 0, 0);
  ScoreKeep leftScoreKeep = new ScoreKeep(0, height/10+height/2+(refMeasure/2), 0, 0, 0);
  ScoreKeep rightScoreKeep = new ScoreKeep(0, leftScoreKeep.y+leftScoreKeep.h+(refMeasure/2), 0, 0, 0, 0);
  leftScoreKeep.variablesUpdate(leftScoreKeep.y, rightScoreKeep.y, 0, 0, 0, 0, 0, 0, 0);
  rightScoreKeep.variablesUpdate(leftScoreKeep.y, rightScoreKeep.y, 0, 0, 0, 0, 0, 0, 0);
  Button stopGame = new Button((width/2)-((height/8)/2), gametable.y-refMeasure/4-height/14, height/8, height/14, 0); 
  Button resetScore = new Button(refMeasure, rightScoreKeep.y+rightScoreKeep.h+(refMeasure/2), height/8, height/14, 0);
  stopGame.variablesUpdate(0, 0, stopGame.x, 0, 0, 0, 0, 0, 0);
  resetScore.variablesUpdate(0, 0, 0, resetScore.y, 0, 0, 0, 0, 0);
  firstBall.collisiontable(gametable.x, gametable.y, gametable.w, gametable.h);
  secondBall.collisiontable(gametable.x, gametable.y, gametable.w, gametable.h);
  firstBall.disappear = false;
  secondBall.disappear = true;
  //
  shapes.add(gametable); //Element 8, gametable
  shapes.add(firstBall); //Element 9, firstBall
  shapes.add(secondBall); //Element 10, secondBall
  shapes.add(firstracket); //Element 11, firstracket
  shapes.add(secondracket); //Element 12, secondracket
  shapes.add(leftScoreKeep); //Element 13, leftScoreKeep
  shapes.add(rightScoreKeep); //Element 14, rightScoreKeep
  shapes.add(stopGame); //Element 15, stopGame
  shapes.add(resetScore); //Element 16, resetScore
}//end setupgame
void drawgame() {
  if (gameOn) drawgameOn();
}//end drawgame
void mousePressedgame() {
  if (gameOn) mousePressedgameOn();
}//end mousePressedgame
void keyPressedgame() {
  if (gameOn) keyPressedgameOn();
}//end keyPressedgame
void keyReleasedgame() {
  for ( Object s : shapes ) {
    s.keyReleased();
  }
}//end keyReleasedgame
//
void drawgameOn() {
  background(background);
  shapes.get(9).variablesUpdate(shapes.get(11).x, shapes.get(11).y, shapes.get(11).w, shapes.get(11).h, shapes.get(12).x, shapes.get(12).y, shapes.get(12).w, shapes.get(12).h, 0);
  shapes.get(10).variablesUpdate(shapes.get(11).x, shapes.get(11).y, shapes.get(11).w, shapes.get(11).h, shapes.get(12).x, shapes.get(12).y, shapes.get(12).w, shapes.get(12).h, 0);
}//end drawgame
void mousePressedgameOn() {}//end mousePressedgame
void keyPressedgameOn() {
  for ( Object s : shapes ) {
    s.keyPressed();
  }
  if (key == '3') gameOnOffSwitch();//switches game on and off
}//end keyPressedgame
void gameOnOffSwitch() {
  if (gameGameOn) { gameGameOn = false; } else { gameGameOn = true; }//switches game on and off
}//end gameOnOffSwitch
//end game subProgram
