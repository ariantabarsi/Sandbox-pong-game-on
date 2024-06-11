//Global Variables
int appWidth, appHeight;
Boolean disstartCheck = false;
//
void disstart() {
  appWidth = width;
  appHeight = height;
  disstartCheck = ( appWidth >= appHeight ) ? false : true;
  if (disstartCheck) disstartLandscapePrompt();
}//end disstart
void disstartLandscapePrompt() {//disstart error cheack
  println(" ( •, ^ •,) stop");
}//end disstartlandscape
//end disstart subProgram
