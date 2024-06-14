abstract class Rectangle extends Object {
  //Global Variables
  //
  Rectangle(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//end Rectangle
  //Methods
  abstract void drawing();
  //
  abstract void mousePressed();
  //
  abstract void keyPressed();
  //
  abstract void keyReleased();
  //
  abstract void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8);
  //
  abstract color backgroundColor(); 
  //
  color randomColor() {
    color chosenColor;
    chosenColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    return chosenColor;
  }//end randomColor
  //
}//end Rectangle
