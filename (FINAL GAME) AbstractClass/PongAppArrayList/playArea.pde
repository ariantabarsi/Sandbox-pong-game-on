class gametable extends Rectangle {
  //Global Variables
  float leftNetX_Top, leftNetY_Top, leftNetX_Bottom, leftNetY_Bottom;
  float rightNetX_Top, rightNetY_Top, rightNetX_Bottom, rightNetY_Bottom;
  float middlegameTableX, middlegameTableY_Top, middlegameTableY_Bottom;
  //
  gametable (float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    c = backgroundColor();
  }//end gametable
  //
  //Methods
  void drawing() {
    if (gameOn) draw();
  }//end draw
  void draw() {
    fill(c);
    rect(x, y, w, h); //game Table
    stroke(255);
    image(pastaImg, middlegameTableX-150 , y , w /2 , h);
    //line(middlegameTableX, middlegameTableY_Top, middlegameTableX, middlegameTableY_Bottom);
    noStroke();
  }//end drawing
  //
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {}//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {}//end reset
  //
  color backgroundColor() { //See Night select
    color Color=#050500;
    return Color;
  }//end backgroundColor
  //Getters and Setters
  void variablesUpdate( float netWidth, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8) {
    leftNetX_Top = x+netWidth;
    leftNetY_Top = y;
    leftNetX_Bottom = leftNetX_Top;
    leftNetY_Bottom = leftNetY_Top+h;
    rightNetX_Top = w-netWidth;
    rightNetY_Top = leftNetY_Top;
    rightNetX_Bottom = rightNetX_Top;
    rightNetY_Bottom = leftNetY_Bottom;
    middlegameTableX = (x+(w/2)); //Used in racket Constructor to create left or right racket
    middlegameTableY_Top = leftNetY_Top;
    middlegameTableY_Bottom = leftNetY_Bottom;
  } //Ball Diameter Update
}//end gametable
//end gametable subProgram
