//Global Variables
boolean MenuOn = true;
float refMeasure;
color strokeColor = #FFFBE3;
color background = #BA263B;
color secondaryColor = #BC4251;
color hoverOver = #711010;
//
void setupMenu() {
  refMeasure = width/50;
  Button exit = new Button(width-width/10, 360, width/10, height/10, 0); 
  Button menuTogame = new Button(refMeasure*20, (height-(height/8 + refMeasure)), width/6, height/8, 0);
  RectText title = new RectText(width/2-(width*4/10), height/10, (width*4)/5, height/3, secondaryColor);
  exit.variablesUpdate(exit.x, 0, 0, 0, 0, 0, 0, 0, 0);
  menuTogame.variablesUpdate(0, menuTogame.x, 0, 0, 0, 0, 0, 0, 0 );
  //
  shapes.add(exit); //Element 0, exit
  shapes.add(menuTogame); //Element 1, menuTogame
  shapes.add(title);//Element 2, title
}//end setupgame
void drawMenu() {
  if (MenuOn) drawMenuOn();
  for ( Object s : shapes ) {
    s.drawing();
  }
}//end drawgame
void mousePressedMenu() {
  for ( Object s : shapes ) {
    s.mousePressed();
  }
}//end mousePressedgame
void keyPressedMenu() {
  if (key == '4') MenuSwitch();//switches game on and off
}//end keyPressedgame
//
void drawMenuOn() {
  background(background);
  for ( Object s : shapes ) {
    s.reset();
  }
}//end drawgame
void mousePressedMenuOn() {}//end mousePressedgame
void keyPressedMenuOn() {}//end keyPressedgame
void MenuSwitch() {
  if (MenuOn) { 
    MenuOn = false; 
    gameOn = false;
    selectOn = true;
  } else { 
    MenuOn = true;
    gameOn = false;
    selectOn = false;
  }
}//end gameOnOffSwitch
//end Menu subProgram
