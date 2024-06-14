//Global Variables
int appWidth, appHeight;
Boolean displayCheck = false;
//
void display() {
  appWidth = 700;
  appHeight = 400;
  displayCheck = ( appWidth >= appHeight ) ? false : true;
}//end display
void displayLandscape() {//display error cheack
  println(" :< ");
}//end displaylandscape
//end display subProgram
