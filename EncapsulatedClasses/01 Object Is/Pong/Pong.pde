//Global Variables
//
void setup() {
  size( 700, 400 );//width and height of canvas //fullscreen(); = size(displayWidth, displayHeight);
  background(color(int(random(0, 255)), int(random(0,255)), int(random(0,255))));
  /*ScreenSizeChecker(); //for landscape, portrait or square veiw 
  Automatically adjusts for screen rotaction or change*/
  Ball myBall = new Ball(); //Created Unique Object With The Class Ball Variables
  //Constructor = populates myBall class variables
  int startX = (width/2);//middle of canvas
  int startY = (height/2);//middle of canvas
  int referentMeasures = (width<height) ? (width):(height) ; //ternary Operator
  myBall.ballDiameter = referentMeasures/20;
  myBall.ballX = startX-((myBall.ballDiameter)/2);
  myBall.ballY = startY-((myBall.ballDiameter)/2);
  myBall.ballColor = color(245, 189, 2); //RGB color
  //end Constructor
  fill(myBall.ballColor);
  ellipse( myBall.ballX, myBall.ballY, myBall.ballDiameter, myBall.ballDiameter );
  Ball yourBall = new Ball(); //ball
}//end setup
//
void draw() {}//end draw
//
void keyPressed() {}//end keyPressed
//
void mousePressed() {}//end mousepressed
//end DRIVER
