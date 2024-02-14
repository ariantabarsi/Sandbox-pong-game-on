//Global Variables and Objects
Ball myBall; // Both 1/2's of Constructor
Ball yourBall;
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
  yourBall = new Ball();
  //
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  myBall.draw();
  yourBall.draw();
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
void ballCollisions() {
  /*Change this code to instances
   if ( x < 0+(diameter*1/2) || x > width-(diameter*1/2) ) xSpeed *= -1;
   if ( y < 0+(diameter*1/2) || y > height-(diameter*1/2) ) ySpeed *= -1;
   */
} //End ball collisions
//
//End DRIVER
