//Global Variables
int appWidth = 700;
int appHeight = 400;
//
void setup() {
  size( 700, 400 );//width and height of canvas //fullscreen(); = size(displayWidth, displayHeight);
  background(color(int(random(0, 255)), int(random(0,255)), int(random(0,255))));
  /*ScreenSizeChecker(); //for landscape, portrait or square veiw 
  Automatically adjusts for screen rotaction or change*/
  Ball myBall = new Ball(); //myball = instance of Ball
  int startX = (appWidth)*(1/2);
  int startY = (appHeight)*(1/2);
  int referentMeasures = (appWidth < appHeight) ? (appWidth) : (appHeight) ; //ternary Operator
  //Constructor
  myBall.ballX = startX;
  myBall.ballY = startY;
  myBall.ballDiameter = referentMeasures * (1/20);
  myBall.ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255))); //RGB color
  //end Constructor
  fill(myBall.ballColor);
  Ball yourBall = new Ball(); //ball
  ellipse( ballX, ballY, ballDiameter, ballDiameter );
  println("zinger");
  //exit();
}//end setup
//
void draw() {}//end draw
//
void keyPressed() {}//end keyPressed
//
void mousePressed() {}//end mousepressed
//end DRIVER
