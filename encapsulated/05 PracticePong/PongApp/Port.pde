//Global Variables
boolean portOn = true;//turns menu screen on and off
//
void drawPort() { 
  if (portOn) drawPortOn();
  pong = new Rectangle(refMeasure);
  quit = new Rectangle(width-refMeasure*4, 0, refMeasure*4, refMeasure*5/3);
  prerequisites();
}//end drawPort
void keyPressedPort() {
  if (key == '0') pong();
  if (key == '9') port();
}//end keyPressedPort
void mousePressedPort() {
  if ( mouseX>=pong.rectX && mouseX<=pong.rectX+pong.rectWidth && mouseY>=pong.rectY && mouseY<=pong.rectY+pong.rectHeight )
  pong();
  if ( mouseX>=quit.rectX && mouseX<=quit.rectX+quit.rectWidth && mouseY>=quit.rectY && mouseY<=quit.rectY+quit.rectHeight )
  exit();
}//end mousePressedPort
//
void drawPortOn() {
  background(background);
}//end drawPortOn
void prerequisites() {
  population();//Population subProgram
  UIuniversal();
}//end prerequisites
void UIuniversal() { //pongButtonX, pongButtonY, pongButtonWidth, pongButtonHeight
  pong.button(#8D9EFF, #CCC1FF, (refMeasure*2)/7);
  UIportText("Menu", "Pong");
  quit.button(#ff1919, #00b530, 0);
  quit.rectText("quit");
}//end UImousePressed
void UIportText(String text, String text1) {
  if (pongOn) {
    pong.buttonBooleanText(true, text, text1);
  } else {
    pong.buttonBooleanText(false, text, text1);
  }
  
}//end UIportText
void pong() {
  if (pongOn) {
    pongOn = false;
    portOn = true;
  } else {
    pongOn = true;
    portOn = false;
  }
}//end pong
void port() {
  if (portOn) {
    portOn = false;
    pongOn = true;
  } else {
    pongOn = false;
    portOn = true;
  }
}//end port
//end Port subProgram
