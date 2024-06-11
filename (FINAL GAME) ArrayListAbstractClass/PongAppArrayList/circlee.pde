abstract class Circle extends Object {
  //Global Variables
  //
  Circle (float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//end Circle
  //Methods
  abstract void drawing();//end draw
  //
  abstract void mousePressed();
  //
  //
  abstract void keyPressed();
  //
  abstract void keyReleased();
  //
  abstract void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8);
  //
  abstract void reset();
  //
  abstract color backgroundColor();//end Night select Color Selector
  //
  color randomColor() {
    color chosenColor;
    chosenColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    return chosenColor;
  }//end randomColor
}// end Circle
//end Circle subProgram
