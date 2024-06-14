//Global Variables
Rectangle pongPause, pong, quit, scoreKeepLeft, scoreKeepRight, scoreKeepReset, pongGameReset;
float refMeasure;
//color
color strokeColor = #FFFBE3;
color background = #9EA9F0;
//
void population() {
  refMeasure = width/50;
}//end population
class Rectangle {
  //Global Variables
  float rectX, rectY, rectWidth, rectHeight;
  Rectangle( float x, float y, float widthVariables, float heightVariables ) {
    this.rectX = x;
    this.rectY = y;
    this.rectWidth = widthVariables;
    this.rectHeight = heightVariables;
  }//end ButtonsConstructor
  Rectangle( float x ) {//populating the menu buttons
    this.rectWidth = width/6;
    this.rectHeight = height/8;
    this.rectX = x;
    this.rectY = (height-(rectHeight + refMeasure));
  }//end MenuButtons Constuctor
  void drawRect(float strokeWeightValue, color rectColor) {
    strokeDesign(strokeWeightValue);
    fill(rectColor);
    rect(rectX, rectY, rectWidth, rectHeight);
  }//end drawRect
  void drawButtons(float strokeWeightValue) {
    strokeDesign(strokeWeightValue);
    rect(rectX, rectY, rectWidth, rectHeight);
  }//end drawButtons
  void button(color hoverOver, color buttonColor, float strokeWeightValue) {
    if ( mouseX>=rectX && mouseX<=rectX+rectWidth && mouseY>=rectY && mouseY<=rectY+rectHeight )
  {fill(hoverOver);} else {fill(buttonColor);}
  drawButtons(strokeWeightValue);
  }//end button
  void buttonBooleanText(boolean booleanParameter, String firstText, String secondText) {
    if (booleanParameter) { 
      rectText(firstText);
    } else {
      rectText(secondText);
    }
  }//end buttonText
  void rectText (String firstText) {
    drawText( height, ink, CENTER, CENTER, Font, textSpace+firstText+textSpace, rectX, rectY, rectWidth, rectHeight);
  }
}//end buttons class
void strokeDesign( float strokeWeightValue ) {
  stroke(strokeColor);
  strokeWeight(strokeWeightValue);
  strokeJoin(ROUND);
}//end strokeDesign
//end Population
