class ScoreKeep extends Rectangle {
  //Global Variables
  //
  ScoreKeep (float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    this.x = refMeasure;
    this.w = height/8;
    this.h = height/10;
    this.c = secondaryColor;
    
  }
  ScoreKeep(float x, float y, float w, float h, color c, float jb) {
    super(x, y, w, h, c);
    this.x = width/2-((width*2)/5)+(width*4)/5+refMeasure;
    this.w = height/8;
    this.h = height/10;
    this.c = secondaryColor;
  }//end Scoreboard
  //
  //Methods
  void drawing() {
    if (gameOn) draw();
  }//end draw
  void draw() {
    fill(c);
    if (x < shapes.get(8).x+shapes.get(8).w) {
      rect(x, shapes.get(11).y, w, h);
    } else {
      rect(x, shapes.get(12).y, w, h);
    }
    if (y == sry) rectText(str(scoreLeft), shapes.get(12).y);
    if (y == sly) rectText(str(scoreRight), shapes.get(11).y);
    scoreKeeper();
  }//end drawing
  void scoreKeeper() {
    if (winConRight) {
      scoreRight++;
      winConRight = false;
    }
    if (winConLeft) {
      scoreLeft++;
      winConLeft = false;
    }
  }//end scoreKeeper
  //
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {}//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {}//end reset
  //
  float sly, sry;
  void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8) {
    sly = v0;
    sry = v1;
  }//end variablesUpdate
  //
  color backgroundColor() {
    color nightselect = 0;
    return nightselect;
  }//end backgroundColor
  void rectText(String firstText, float scoreY) {
    drawText( height, ink, CENTER, CENTER, Font, textSpace+textSpace+firstText+textSpace+textSpace, x, scoreY, w, h);
  }//end rectText
}//end Scoreboard
//end rectText subProgram
