class ScoreKeep extends Rectangle {
  //Global Variables
  //refMeasure, pongPause.rectY+pongPause.rectHeight+(refMeasure/2), height/8, height/8
  ScoreKeep (float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    this.x = refMeasure;
    this.w = height/8;
    this.h = height/8;
    this.c = secondaryColor;
  }//end Scoreboard
  //
  //Methods
  void drawing() {
    fill(c);
    rect(x, y, w, h);
    if (pongGameOn) firstBall.winCondition();
    //if (pongGameOn) cheatBall.winCondition();
    rectText(scoreLeftText, leftScoreKeep.y);
    rectText(scoreRightText, rightScoreKeep.y);
  }//end draw
  int scoreLeft, scoreRight;
  String scoreLeftText, scoreRightText;
  void scoreKeepUpdate(int sL, int sR, String sLT, String sRT) {
    scoreLeft = sL;
    scoreRight = sR;
    scoreLeftText = sRT;
    scoreRightText = sLT;
  }//end scoreKeepUpdate
  //
  color backgroundColor() {
    color nightMode = 0;
    return nightMode;
  }//end backgroundColor
  void rectText(String firstText, float yParameter) {
    drawText( height, ink, CENTER, CENTER, Font, textSpace+firstText+textSpace, x, yParameter, w, h);
  }//end rectText
  //
  /* Features:
   - Any Easter Eggs
   */
}//end Scoreboard
