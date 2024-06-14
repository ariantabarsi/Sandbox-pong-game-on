//Global Variables
boolean selectOn = false;
boolean gameAiDropMenu = false;
boolean medai = false, easyai = false;//hard ai, medium ai, easy ai
//
void setupselect() {
  Button twoplayer = new Button(width/2-(width/6), height/10, width/3, height/8, 0);
  Button oneplayer = new Button(width/2-(width/6), twoplayer.y+twoplayer.h+(refMeasure), width/3, height/8, 0);
  Button hardai = new Button(width/1.9-(width/6), oneplayer.y+oneplayer.h+(refMeasure/2), width/4, height/14, 0);
  Button medai = new Button(width/1.9-(width/6), hardai.y+hardai.h+(refMeasure/2), width/4, height/14, 0);
  Button easyai = new Button(width/1.9-(width/6), medai.y+medai.h+(refMeasure/2), width/4, height/14, 0);
  twoplayer.variablesUpdate(0, 0, 0, 0, twoplayer.x, 0, 0, 0, 0);
  oneplayer.variablesUpdate(0, 0, 0, 0, 0, oneplayer.x, 0, 0, 0);
  hardai.variablesUpdate(0, 0, 0, 0, 0, 0, hardai.x, 0, 0);
  medai.variablesUpdate(0, 0, 0, 0, 0, 0, 0, medai.x, 0);
  easyai.variablesUpdate(0, 0, 0, 0, 0, 0, 0, 0, easyai.x);
  //
  shapes.add(twoplayer);//Element 3, twoplayer
  shapes.add(oneplayer);//Element 4, oneplayer
  shapes.add(hardai);//Element 5, hard ai
  shapes.add(medai);//Element 6, medium ai
  shapes.add(easyai);//Element 7, easy ai
}//end setupgame
void drawselect() {
  if (selectOn) drawselectOn();
}//end drawgame
void mousePressedselect() {
}//end mousePressedgame
void keyPressedselect() {
}//end keyPressedgame
//
void drawselectOn() {
  background(background);
}//end drawgame
void mousePressedselectOn() {}//end mousePressedgame
void keyPressedselectOn() {}//end keyPressedgame
void selectSwitch() {
  MenuOn = false;
  selectOn = false;
  gameOn = true;
}//end selectSwitch
//end select subProgram
