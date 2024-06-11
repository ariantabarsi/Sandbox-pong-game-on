//Global Variables
boolean portOn = true;
//
void drawPort() { if (portOn) drawPortOn(); }//end draw
void keyPressedPort() {
  if (key == '0') pong();
  if (key == '9') port();
}//end keyPressed
void keyReleasedPort() {}//end keyReleased
void mousePressedPort() {}//end mousepressed
//
void drawPortOn() {
  background(255);
}
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
