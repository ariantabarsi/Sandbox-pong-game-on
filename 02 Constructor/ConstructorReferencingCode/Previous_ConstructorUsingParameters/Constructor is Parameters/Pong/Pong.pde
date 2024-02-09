// Global Variables
//
void setup()
{
  size(700, 500); //fullScreen(); displayWidth, displayHeight
  //ScreenSizeChecker() for Landscape, Portrait, square views (updated automatically for screen rotate)
  //
  //An Object Is ... See the class
  Ball myBall = new Ball(); //Line can be anywhere
  Ball yourBall = new Ball();
  //
  myBall.draw(width*1/10, height*1/3, width*1/25, color(31, 255, 3));
  yourBall.draw(width*9/10, height*1/3, width*1/25, color(randomColourDayTime(), randomColourDayTime(), randomColourNightMode())); //Notice Bug
  //
  println("Exciting ... not exciting."); //Ball Object immediately deleted, local variable
  //exit(); //Exit Button, TBA
}//End setup()
//Object is garbage collected here
//
void draw()
{
  //Empty Loop (Especially Needed in Abstract Classes
}//End draw()
//
void keyPressed() {
}//End keyPressed()
//
void mousePressed() {
}//End mousePressed()
//
int randomColourDayTime() {
  return int ( random(255) );
}//End randomColourDayTime()
//
int randomColourNightMode() {
  return 0;
}//End randomColourDayTime()
