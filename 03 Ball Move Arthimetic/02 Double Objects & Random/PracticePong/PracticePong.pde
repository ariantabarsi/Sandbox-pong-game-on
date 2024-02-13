//Global Variables and Objects
Ball myBall; // Both 1/2's of Constructor
//Ball yourBall
//
color pongTableColour = 255; //ERROR: move to Table CLASS, 255 is full BLUE
//
void setup() {
  size(600, 400); //fullScreen(); displayWidth, displayHeight
  /*ScreenSizeChecker() for Lnadscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  //Population
  myBall = new Ball(); // Both 1/2's of Constructor
  // yourBall = new Ball();
  //
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  myBall.draw();
  println(myBall.xDirection, myBall.yDirection);
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End DRIVER
