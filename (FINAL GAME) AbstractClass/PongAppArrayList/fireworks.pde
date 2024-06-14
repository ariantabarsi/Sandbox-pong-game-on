class Firework extends Circle {
  //Global Variables
  float  gravity = 0.0;
  float firstBallW;
  float tableX, tableY, tableW, tableH;
  int ballAmt = 10;//the amount of balls generated
  float[] fx = new float[ballAmt];
  float[] fy = new float[ballAmt];
  float[] fw = new float[ballAmt]; 
  color[] fc = new color[ballAmt];
  float[] xVelocity = new float[ballAmt];
  float[] yVelocity = new float[ballAmt];
  //
  Firework (float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//Fireworks
  //Methods
  void drawing() {
    draw();
  }//end draw
  void draw() {
    for ( int i=0; i<fx.length; i++ ) {
      fill(fc[i]);
      if (fy[i] <= tableY+tableH-(fw[i]/2)) {//deletes the ball before it leaves the start area
        ellipse(fx[i], fy[i], fw[i], fw[i]);
      }
      fill(colorReset);
    }
    moving();
  }//end draw
  //3
  void mousePressed() {}//end mousePressed
  //
  void keyPressed() {}//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {}//end reset
  //
  void variablesUpdate(float ballW, float g, float xParameter, float yParameter, float v4, float v5, float v6, float v7, float v8) {
    tableX = v4;
    tableY = v5;
    tableW = v6;
    tableH = v7;
    firstBallW = ballW;
    for ( int i=0; i<fx.length; i++ ) {
      gravity = g;
      this.fx[i] = xParameter;
      this.fy[i] = yParameter;
      this.xVelocity[i] = random(-5, 5);
      this.yVelocity[i] = random(-5, 5);
      this.fc[i] = randomColor(); //RGB color
      this.fw[i] = random(ballW/1.1);
    }
  }//end variablesUpdate
  color backgroundColor() {
    color nightselect = 0;
    return nightselect;
  }//end backgroundColor
  //
  void bounce() {
    for ( int i=0; i<fx.length; i++ ) {
      if (fx[i] <= ((fw[i]/2)+(tableX)) || fx[i] >= (tableX + tableW)-(fw[i]/2)) (xVelocity[i]) *= -1;
      if (fy[i] <= ((tableY)+(fw[i]/2)) || fy[i] >= (tableY+tableH)-(fw[i]/2)) (yVelocity[i]) *= -1;
    }
  }//end bounce
  void moving() {
    for ( int i=0; i<fx.length; i++ ) {
      yVelocity[i] += gravity;
      fx[i] += (xVelocity[i]);
      fy[i] += (yVelocity[i]);
    }
    bounce();
  }//end moving
}//end Firework
//end Firework subProgram
