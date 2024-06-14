class RectText extends Rectangle {
  //Global Variables
  //
  RectText(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }
  //Methods
  void drawing() {
    if (MenuOn) draw();
  }//end drawing
  void draw() {
    fill(c);
    rect(x, y, w, h);
    rectText("Pastong");
    fill(colorReset);
  }//end draw
  void keyPressed() {}//end keyPressed
  void keyReleased() {}//end keyReleased
  void mousePressed() {}//end mousePressed
  void reset() {}//end reset
  void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8) {
  }//end variablesUpdate
  void rectText(String firstText) {
    drawText( height, ink, CENTER, CENTER, Font, textSpace+textSpace+firstText+textSpace+textSpace, x, y, w, h);
  }//end rectText
  color backgroundColor() {
    color nightselect = 0;
    return nightselect;
  }//end Night select Color Selector
}//end RectText
