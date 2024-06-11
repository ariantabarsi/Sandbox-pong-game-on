//Global Variables
ArrayList<Object> shapes = new ArrayList<Object>();
//
void setup() {
  //size(400, 700);//Menurait
  
  size(800, 400);//landscape
  disstart();
  setupText();
  imgs();
  setupMenu();
  setupselect();
  setupgame();
}//end setup
//
void draw() {
  drawgame();
  drawselect();
  drawMenu();
}//end draw
//
void mousePressed() {
  mousePressedgame();
  mousePressedMenu();
}//end mousePressed
//
void keyPressed() {
  keyPressedMenu();
  keyPressedgame();
}//end keyPressed
//
void keyReleased() {
  keyReleasedgame();
}//end keyReleased
//end gameApp
