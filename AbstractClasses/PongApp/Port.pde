//Global Variables
boolean portOn = true;
float refMeasure;
color strokeColor = #FFFBE3;
color background = #9EA9F0;
color secondaryColor = #CCC1FF;
color hoverOver = #8D9EFF;
Button menuToPong;
//
void setupPort() {
  refMeasure = width/50;
  menuToPong = new Button(refMeasure, (height-(height/8 + refMeasure)), width/6, height/8, 0);
  quit = new Button(width-width/10, 0, width/10, height/14, 0); 
}//end setupPong
void drawPort() {
  if (portOn) drawPortOn();
  color quitOn = #ff1919;
  color quitOff = #00b530;
  quit.drawing(quitOn, quitOff);
  quit.rectText("quit");
  menuToPong.drawing(hoverOver, secondaryColor);
  menuToPong.rectSwitchingText("Pong", "Menu", portOn);
}//end drawPong
void mousePressedPort() {
  menuToPong.mousePressedMenuToPongFunction();
  quit.mousePressedExitFunction();
}//end mousePressedPong
void keyPressedPort() {
  if (key == '4') portSwitch();//switches pong on and off
}//end keyPressedPong
//
void drawPortOn() {
  background(background);
}//end drawPong
void mousePressedPortOn() {
}//end mousePressedPong
void keyPressedPortOn() {
}//end keyPressedPong
void portSwitch() {
  if (portOn) { 
    portOn = false; 
    pongOn = true;
  } else { 
    portOn = true;
    pongOn = false;
  }
}//end pongOnOffSwitch
//end Pong subProgram
