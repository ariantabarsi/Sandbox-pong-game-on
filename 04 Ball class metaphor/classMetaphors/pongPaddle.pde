/* known ERRORs
 - To be implemented
*/
 class Racket {
  //Global Variables
  float playAreaWidth, playAreaHeight, playAreaX, playAreaY;
  float knotX, knotY, knotWidth, knotHeight;
  float RacketX, RacketY, RacketWidth, RacketHeight, RacketStartHeight;
  float RacketTravel;
  boolean RacketUp = false, RacketDown = false;//keyPressed in draw
  color RacketColor;
  //
  Racket(float startPositionParameter, float ballDiameterParameter) {
    knotWidth = (ballDiameterParameter*3);
    RacketWidth = (ballDiameterParameter/2); //Ball Radius
    playAreaY = height/10;//smallest Y value for Racket movement
    playAreaHeight = (height*4)/5;
    if ( startPositionParameter == 0 ) knotX = startPositionParameter; //Adding to the knotX
    if ( startPositionParameter == width ) knotX = startPositionParameter - (knotWidth*2) - RacketWidth; //Subtracting the knotX
    this.RacketX = knotX + knotWidth; //netX has two values, fix ERROR
    if ( startPositionParameter == width ) knotX = startPositionParameter - knotWidth;
    this.RacketStartHeight = ( 0.25 );//has to be decimal
    this.RacketHeight = (playAreaHeight * RacketStartHeight);
    this.RacketY = playAreaY + (playAreaHeight/2) - (RacketHeight/2);
    this.RacketTravel = (playAreaHeight/50);//Racket speed
    this.RacketColor = color (int(random(0,255)), int(random(0,255)), int(random(0,255)));
  }//end Racket(float, float)
  //
  void drawRacket() {
    fill(RacketColor);
    noStroke();
    rect(RacketX, RacketY, RacketWidth, RacketHeight);
    fill(0);
  }//end drawRacket
  void RacketMove() {
    if (RacketUp) RacketUp();
    if (RacketDown) RacketDown();
  }
  void RacketUp() {
    RacketY -= (RacketTravel);//moving up
    if (RacketY < playAreaY) RacketY = playAreaY;//error catch: will not go off screen
  }//RacketUp
  void RacketDown() {
    RacketY += (RacketTravel);//moving down
    if (RacketY > playAreaY+playAreaHeight-RacketHeight) RacketY = playAreaY+playAreaHeight-RacketHeight;//error catch: will not go off screen
  }//end RacketDown
  void RacketKeyPressedWASD() {
    if (key == 'w' || key == 'W') firstRacket.RacketUp = true;
    if (key == 's' || key == 'S') firstRacket.RacketDown = true; 
  }
  void RacketKeyPressedARROWKEYS() {
    if (key == CODED & keyCode == UP) secondRacket.RacketUp = true;
    if (key == CODED & keyCode == DOWN) secondRacket.RacketDown = true;
  }
  void RacketKeyReleasedWSAD() {
    if (key == 'w' || key == 'W') firstRacket.RacketUp = false;
    if (key == 's' || key == 'S') firstRacket.RacketDown = false; 
  }
  void RacketKeyReleasedARROWKEYS() {
    if (key == CODED & keyCode == UP) secondRacket.RacketUp = false;
    if (key == CODED & keyCode == DOWN) secondRacket.RacketDown = false;
  }
}//end Racket
//end pongRacket
