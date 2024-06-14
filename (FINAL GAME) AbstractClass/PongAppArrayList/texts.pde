//Global Variable
PFont Font;
color ink = strokeColor, resetInk = #FFFFFF; //Not Nightselect Friendly
int alignHorizontal, alignVertical; //Disstart or CANVAS Values
String  textcomma = ",", textSpace = "  ", textPeriod = ".";
String text = "whoop";//button text
//
void setupText() {
  Font = createFont ("COMICSANS.TTF", 32); 
}//end setupText()
void drawText( float appHeight, color ink, int alignHorizontal, int alignVertical, PFont Font, String text, float x, float y, float widthVari, float heightVari ) {
  predrawText( ink, appHeight, alignHorizontal, alignVertical, Font ); //passing parameters
  textSize(textCalculator(height, text, widthVari));
  text(text, x, y, widthVari, heightVari);
  textReset();
}//end drawText()
void textKeyPressed() {}//end textKeyPressed()
void textMousePressed() {}//end textMousePressed()
//
void predrawText( color ink, float appHeight, int alignHorizontal, int alignVertical, PFont Font1 ) {
  fill(ink);
  textAlign (alignHorizontal, alignVertical);
  textFont(Font, appHeight);
  if(Font != null) { //Check if Font object is not null
    textFont(Font, appHeight);
  }
}//end predrawText()
//
void textReset() { fill(resetInk); }//end textReset
//
float textCalculator( float size, String text, float textPara ) {
  textSize(size); //For text width sizing
  while ( textWidth(text) > textPara ){
    textSize(size *= 0.8); //decreases text size by 20%
  }
  return size;
}//end textCalculator
//end Text SubProgram
