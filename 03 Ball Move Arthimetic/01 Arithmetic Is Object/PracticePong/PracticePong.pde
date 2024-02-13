//Global Variables and Objects
Ball myBall; // Both 1/2's of Constructor
//Ball yourBall
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
  myBall.draw();
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End DRIVER
