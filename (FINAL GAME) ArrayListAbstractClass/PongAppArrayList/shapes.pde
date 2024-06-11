abstract class Object {
  //Global Variables
  float x; //X-Variable, Position
  float y; //Y-Variable, Position
  float w; //Width
  float h; //Height
  float el; //left bounce edge, x-pixel
  float er; //right bounce edge, x-pixel
  float plt; // left top racket y-pixel
  float plb; // left bottom racket y-pixel
  float prt; // right top racket y-pixel
  float prb; // right bottom racket y-pixel
  boolean disappear;
  color c, colorReset;//Object Color
  //
  Object(float x, float y, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    colorReset = backgroundColor(); //Populated Once is all constructors and updated constructors
  }//end Object
  //
  //Methods
  abstract void drawing();
  //
  abstract void mousePressed();
  //
  abstract void keyPressed();
  //
  abstract void keyReleased();
  //
  abstract void reset();
  //
  abstract color backgroundColor();
  //
  abstract void variablesUpdate( float variable1, float variable2, float variable3, float variable4, float variable5, float variable6, float variable7, float variable8, float variable9);
  //
}//end Object
//end Object subProgram
