class Ball extends Circle {
  //Global Variables
  float xVelocity, yVelocity;
 // Firework firework;
  //
  Ball(float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
    int referentMeasures = (width<height) ? (width):(height); //ternary Operator = chooses the smaller value
    //object variables //this is "new Ball()"
    this.w = referentMeasures/25;
    this.xVelocity = xDirection()*3;
    this.yVelocity = yDirection()*3;
    this.c = randomColor();
  }//end Ball
  Ball(float x, float y, float w, float h, color c, float xV, float yV) {
    super(x, y, w, h, c);
    this.x = x;
    this.y = y;
    this.w = w;
    this.c = randomColor();
    this.xVelocity = xV/2;
    this.yVelocity = yV/2;
  }//end cheatBall
  //Methods
  void drawing() {
    if (gameOn) draw();
  }//end draw
  void draw() {
    fill(c);
    if (!disappear) {
      image(ballImage, x-25 , y-18 , w +26 , h+30);
      ellipse(x, y, w, h);
      winCondition(); 
      if (gameGameOn) moving();
    }
    explosions();
   // if (!gameGameOn) firework.drawing();
    fill(colorReset);
  }//end draw
  //
  void mousePressed() {
    if ( mouseX>=tableX+(w/2.1) && mouseX<=tableX+tableW-(w/2.1) && mouseY>=tableY+(w/2) && mouseY<=tableY+tableH-(w/2) && gameGameOn) {
      shapes.get(10).disappear = false;
      shapes.get(10).x = mouseX;
      shapes.get(10).y = mouseY;
    }
  }//end mousePressed
  //
  void keyPressed() {
    if (key == '2') shapes.get(7).disappear = true;
  }//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {
    toCenter();
    shapes.get(10).disappear = true;
  }//end reset
  //
  float xDirection() {
    float xDirectionLocal = int(random(-2, 2));
    while (xDirectionLocal == 0) {
      xDirectionLocal = int(random(-2, 2));
    }
    return xDirectionLocal;
  }//end xDirection
  float yDirection() {
    float yDirectionLocal = int(random(-2, 2));
    while (yDirectionLocal == 0) {
      yDirectionLocal = int(random(-2, 2));
    }
    return yDirectionLocal;
  }//end yDirection
  //
  color backgroundColor() {
    color nightselect = 0;
    return nightselect;
  }//end Night select Color Selector
  void bounce() {
    //if (x <= ((w/2)+(width/10)) || firstBall.x >= ((width*9)/10)-(w/2)) c = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
    if (this.x <= (tableX+this.w/2) || this.x >= tableX+tableW-this.w/2) (xVelocity) *= -1;
    if (this.y <= ((tableY)+(this.w/2)) || this.y >= (tableY+tableH)-(this.w/2)) (yVelocity) *= -1;
  }//end bounce
  void moving() {
    x += (xVelocity);
    y += (yVelocity);
    bounce();
    collisionsracket();
  }//end animatingMovement
  float tableX, tableY, tableW, tableH;
  void collisiontable(float x, float y, float w, float h) {
    tableX = x;
    tableY = y;
    tableW = w;
    tableH = h;
  }//end collisonsUpdate
  float racketX, racketY, racketW, racketH;
  float racketX1, racketY1, racketW1, racketH1;
  void variablesUpdate(float x, float y, float w, float h, float x1, float y1, float w1, float h1, float v8) {
    racketX = x;
    racketY = y;
    racketW = w;
    racketH = h;
    racketX1 = x1;
    racketY1 = y1;
    racketW1 = w1;
    racketH1 = h1;
  }//end variablesUpdate
  void winCondition() {
    if (this.x <= (tableX+w/2) || this.x >= (tableX+tableW-w/2)) {
      if (this.x <= (tableX+w/2)) {
        winConLeft = true;
        toCenter();
        gameGameOn = false;
      } else {
        winConRight = true;
        toCenter();
        gameGameOn = false;
      }
    }
  }//end winCondition
  boolean executed = false;
  void explosions() {
    if (!executed) {
      //firework = new Firework(x, y, w, w, c);
      executed = true;
    }
    if (winConRight || winConLeft) {
      if (!disappear) {
       // firework = new Firework(x, y, w, w, c);
       // firework.variablesUpdate(w, 0.5, x, y, tableX, tableY, tableW, tableH, 0);
      }
    }
  }//end explosions
  void toCenter() {
    if (shapes.get(10).disappear) {
      this.x = tableX+(tableW/2);
      this.y = tableY+(tableH/2);
    } else {
      shapes.get(9).x = tableX+(tableW/2);
      shapes.get(9).y = tableY+(tableH/2)-(w);
      shapes.get(10).x = tableX+(tableW/2);
      shapes.get(10).y = tableY+(tableH/2)+(w);
    }
  }//end toCenter
  void collisionsracket() {
    if (x+w+26 >= racketX && x-25 <= racketX+racketW && y-18 >= racketY && y-18 <= racketY+racketH) {
      //if (gameGameOn) firstracket.racketColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      x = racketX + racketW+25;
      xVelocity *= -1;
    }
    if (x >= racketX1-(racketW1/4) && x <= (racketX1+(w+26/2)) && y >= racketY1 && y <= racketY1+racketH1) {
      //if (gameGameOn) secondracket.racketColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
      x = racketX1-racketW1/2;
      xVelocity *= -1;
    }
  }//end collisionsracket
}//end Ball
//end gameBall subProgram
