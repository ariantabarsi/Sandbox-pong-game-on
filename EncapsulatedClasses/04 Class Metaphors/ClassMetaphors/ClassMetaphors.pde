//Libraries and Dependancies
//
void setup() {
  size( 700, 400 );//width and height of canvas //fullscreen(); = size(displayWidth, displayHeight);
  setupPong();
}//end setup
void draw() {
  drawPong();
  drawPort();
}//end draw
void mousePressed() {
  mousePressedPong();
  mousePressedPort();
}//end mousepressed
void keyPressed() {
  keyPressedPong();
  keyPressedPort();
}//end keyPressed
void keyReleased() {
  keyReleasedPong();
  keyReleasedPort();
}//end keyReleased
//end ClassMetaphors
