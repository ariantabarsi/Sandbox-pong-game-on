class racket extends Rectangle {
  //Global Variables
  float ballW;
  float endzoneX, endzoneY, endzoneWidth, endzoneHeight;
  float racketTravel;
  Boolean racketUp = false, racketDown = false;//keyPressed
  float tableY;//smallest Y value for racket movement height/10
  float tableH;
  float gametableMiddle;
  //
  racket (float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  } //end racket
  //Methods
  void drawing() {
    if (gameOn) draw();
  }//end draw
  //
  void draw() {
    fill(c);
    if ( x < gametableMiddle ) {
      //rect(x,y,w,h);
      image(ballImg, x-55 , y , w * 15 , h+7);
      
    } else {
     // rect(x,y,w,h);
      image(ballImg, x-55 , y , w * 15 , h+7);
    }
    if (gameGameOn) racketMove();
  } //end draw
  //
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {
    if (!oneplayer) {
      twoplayerKeyPressed();
    } else {
      oneplayerKeyPressed();
    }
  }//end keyPressed
  void twoplayerKeyPressed() {
    if (x < gametableMiddle) {
      if (key == 'w' || key == 'W') {
        this.racketDown = false;
        this.racketUp = true;
      }
      if ( key == 's' || key == 'S') {
        this.racketUp = false;
        this.racketDown = true;
      }
    } else {
      if (key == CODED && keyCode == UP) {
        this.racketDown = false;
        this.racketUp = true;
      }
      if (key == CODED && keyCode == DOWN) {
        this.racketUp = false;
        this.racketDown = true;
      }
    }
  }//end twoplayerKeyPressed
  void oneplayerKeyPressed() {
    if (x < gametableMiddle) {
      if (key == 'w' || key == 'W') {
        this.racketDown = false;
        this.racketUp = true;
      }
      if ( key == 's' || key == 'S') {
        this.racketUp = false;
        this.racketDown = true;
      }
    }
  }//end oneplayerKeyPressed
  //
  void keyReleased()  {
    if (x < gametableMiddle) {
      if (key == 'w' || key == 'W') {
        this.racketDown = false;
        this.racketUp = false;
      }
      if ( key == 's' || key == 'S') {
        this.racketUp = false;
        this.racketDown = false;
      }
    } else  {
      if (key == CODED && keyCode == UP) {
        this.racketDown = false;
        this.racketUp = false;
      }
      if (key == CODED && keyCode == DOWN) {
        this.racketUp = false;
        this.racketDown = false;
      }
    }
  }//end keyReleased
  //
  void reset() {
    gameGameOn = false;
    this.y = (tableY) + (tableH/2) - (h/2);
  }//end reset
  //
  void racketMove() {
    if (racketUp) racketUp();
    if (racketDown) racketDown();
    if (oneplayer) rightracketAI();
  }//end racketMove
  void racketUp() {
    y -= (racketTravel);//moving up
    if (y < tableY) y = tableY;//error catch: will not go off screen
  }//end racketUp
  void racketDown() {
    y += (racketTravel);//moving down
    if (y > tableY+tableH-h) y = tableY+tableH-h;//error catch: will not go off screen
  }//end racketDown
  void rightracketAI() {
    ballUpdate(shapes.get(9).x, shapes.get(9).y);
    if ( ballX > gametableMiddle ) {
      if (medai || easyai) {
        mediumEasyai();
      } else {//impossible ai
        hardai();
      }
    }
    errorCatchardai();
  }//end rightracketAI
  void hardai() {
    if (shapes.get(12).y+(h/2) <= (ballY) || shapes.get(12).y+(h/2) >= (ballY)) {
      if (shapes.get(12).y+(h/2) <= (ballY)) {//medium Ai
        shapes.get(12).y += racketTravel;
      } else {
        shapes.get(12).y -= racketTravel;
      }
    }
  }//end hardai
  void mediumEasyai() {
    float demarcation = 0;//degree to which the racket will miss
    if (medai) {//medium ai
      demarcation = random(tableH);//degree to which the racket will miss
    } else {//easy ai
      demarcation = random(tableH*2);//degree to which the racket will miss
    }
    if (shapes.get(12).y+(h/2)+demarcation <= (ballY) || shapes.get(12).y+(h/2)-demarcation >= (ballY)) {
      if (shapes.get(12).y+(h/2)+demarcation <= (ballY)) {//medium Ai
        shapes.get(12).y += racketTravel;
      } else {
        shapes.get(12).y -= racketTravel;
      }
    }
  }//end mediumEasyai
  void errorCatchardai() {
    if (shapes.get(12).y < tableY || shapes.get(12).y > tableY+tableH-shapes.get(12).h) {//error catch
      if (shapes.get(12).y < tableY) {
        shapes.get(12).y = tableY;
      } else {
        shapes.get(12).y = tableY+tableH-shapes.get(12).h;
      }
    }
  }//end errorCatchardai
  float ballX, ballY;
  void ballUpdate(float v0, float v1) {
    ballX = v0;
    ballY = v1;
  }//end ballUpdate
  void variablesUpdate( float gametableMiddleParameter, float xNetValue, float sp, float ballw, float tableYParameter, float tableHeight, float v6, float v7, float v8) {
    ballW = ballw;
    tableY = tableYParameter;//smallest Y value for racket movement height/10
    tableH = tableHeight;
    gametableMiddle = gametableMiddleParameter;
    endzoneWidth = (ballW*3);
    float startPositionDifferent = ( 0.25 );//has to be decimal
    this.h = (tableHeight * startPositionDifferent);
    this.y = (tableY) + (tableHeight/2) - (h/2);
    this.w = (ballW/2); //Ball Radius
    if ( sp < gametableMiddleParameter ) { //NOTE: var==NULL, IF == false
      endzoneX = sp;
      plt = y;
      plb = y+h;
      el += xNetValue+w;
    } else {
      endzoneX = sp - (endzoneWidth*2) - w;
      prt = y;
      prb = y+h;
      x -= w;
      er += xNetValue-w;
    }
    this.x = (endzoneX) + (endzoneWidth);
    this.racketTravel = (tableHeight/50);//racket speed
  }//end variablesUpdate
  //
  color backgroundColor() {
    color nightselect = 0;
    return nightselect;
  }//end backgroundColor
} //end racket
//end racket SubProgram
