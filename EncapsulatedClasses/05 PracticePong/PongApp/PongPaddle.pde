//Class
class Paddle {
  //Global Variables
  float playAreaWidth, playAreaHeight, playAreaX, playAreaY;
  float knotX, knotY, knotWidth, knotHeight;
  float paddleX, paddleY, paddleWidth, paddleHeight, paddleStartHeight;
  float paddleTravel;
  boolean paddleUp = false, paddleDown = false;//keyPressed in draw
  color paddleColor;
  color playAreaColor = #CCC1FF;
  //
  Paddle(float startPositionParameter, float ballDiameterParameter) {
    knotWidth = (ballDiameterParameter*3);
    this.paddleWidth = (ballDiameterParameter/2); //Ball Radius
    playAreaY = pongPlayArea.playAreaY;//smallest Y value for paddle movement
    playAreaHeight = pongPlayArea.playAreaHeight;
    if ( startPositionParameter == (width/10) ) knotX = startPositionParameter; //Adding to the knotX
    if ( startPositionParameter == (((width*9)/10)) ) knotX = startPositionParameter - (knotWidth*2) - paddleWidth; //Subtracting the knotX
    this.paddleX = (knotX) + (knotWidth); //netX has two values, fix ERROR
    if ( startPositionParameter == width ) knotX = startPositionParameter - knotWidth;
    this.paddleStartHeight = ( 0.25 );//has to be decimal
    this.paddleHeight = (playAreaHeight * paddleStartHeight);
    this.paddleY = playAreaY + (playAreaHeight/2) - (paddleHeight/2);
    this.paddleTravel = (playAreaHeight/50);//paddle speed
    this.paddleColor = color (int(random(0,255)), int(random(0,255)), int(random(0,255)));
  }//end paddle(float, float)
  //
  Paddle() {
    drawPlayAreaPolulation();
  }//end paddle()
  void drawPlayAreaPolulation() {
    playAreaWidth = (width * 4)/5;
    playAreaHeight = (height * 7)/10;
    playAreaX = width/2 - (playAreaWidth/2);
    playAreaY = height/10;
  }//end drawPlayAreaPolulation
  void drawPlayArea() {
    fill(playAreaColor);
    noStroke();
    rect(playAreaX, playAreaY, playAreaWidth, playAreaHeight);
  }//end drawPlayArea
  void drawPaddle() {
    fill(paddleColor);
    noStroke();
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    fill(0);
  }//end drawPaddle
  void paddleMove() {
    if (paddleUp) paddleUp();
    if (paddleDown) paddleDown();
  }//end paddleMove
  void paddleUp() {
    paddleY -= (paddleTravel);//moving up
    if (paddleY < playAreaY) paddleY = playAreaY;//error catch: will not go off screen
  }//end paddleUp
  void paddleDown() {
    paddleY += (paddleTravel);//moving down
    if (paddleY > playAreaY+playAreaHeight-paddleHeight) paddleY = playAreaY+playAreaHeight-paddleHeight;//error catch: will not go off screen
  }//end paddleDown
  void paddleKeyPressedWASD() {
    if (key == 'w' || key == 'W') firstPaddle.paddleUp = true;
    if (key == 's' || key == 'S') firstPaddle.paddleDown = true; 
  }//end paddleKeyPressedWASD
  void paddleKeyPressedARROWKEYS() {
    if (key == CODED & keyCode == UP) secondPaddle.paddleUp = true;
    if (key == CODED & keyCode == DOWN) secondPaddle.paddleDown = true;
  }//end paddleKeyPressedARROWKEYS
  void paddleKeyReleasedWSAD() {
    if (key == 'w' || key == 'W') firstPaddle.paddleUp = false;
    if (key == 's' || key == 'S') firstPaddle.paddleDown = false; 
  }//end paddleKeyReleasedWSAD
  void paddleKeyReleasedARROWKEYS() {
    if (key == CODED & keyCode == UP) secondPaddle.paddleUp = false;
    if (key == CODED & keyCode == DOWN) secondPaddle.paddleDown = false;
  }//end paddleKeyReleasedARROWKEYS
  void pongPaddleGameReset() {
    paddleY = playAreaY + (playAreaHeight/2) - (paddleHeight/2);
    //secondPaddle.paddleY = playAreaY + (playAreaHeight/2) - (paddleHeight/2);
  }//end gameReset
}//end Paddle
//end pongPaddle
