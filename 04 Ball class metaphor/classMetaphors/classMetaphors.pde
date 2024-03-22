//Global Variables and objects
Ball firstBall; //Both halfs of Constructor
Ball cheatBall;//appears when clicked
Ball[] firework = new Ball[10];//generates multiple balls that fall with gravity
Racket pongPlayArea, firstRacket, secondRacket;
PImage ballImage;
PImage ballImg;
PImage pastaImg;
color backgroundColor;
color pongTableColor = #C93535;
//
void setup() {
  fullScreen();
  size( 700, 400 );//width and height of canvas //fullscreen(); = size(displayWidth, displayHeight);
  /*ScreenSizeChecker(); //for landscape, portrait or square veiw 
  Automatically adjusts for screen rotaction or change*/
  firstBall = new Ball();
  cheatBall = new Ball(width*-1, height*-1, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);
  for (int i=0; i < firework.length; i++) firework[i] = new Ball(width*-1, height*-1, (1/2));//populating firework
  pongPlayArea = new Racket();
  firstRacket = new Racket( 0, firstBall.ballDiameter );
  secondRacket = new Racket( width, firstBall.ballDiameter );
  firstBall.disappear = false;
  backgroundColor = color(#C93535);
  ballImage = loadImage("Capture1-removebg-preview.png");
  ballImg = loadImage ("fork-cartoon-vector-6335190-removebg-preview.png");
  pastaImg = loadImage ("istockphoto-1145689916-612x612-removebg-preview.png");
  //forkimg = loadImage ("
  Ball newBall = new Ball(ballImage);
}//end setup
//
void draw() {
  background(backgroundColor);
    pongPlayArea.drawPlayArea();
   image(pastaImg, LEFT * 25, RIGHT * 15, width/2, height/2);

  firstRacket.drawRacket();
  secondRacket.drawRacket();
  firstRacket.RacketMove();
  secondRacket.RacketMove();
  for (int i=0; i < firework.length; i++) firework[i].ballDraw(); //drawing multiple balls
  explosions();
  if (firstBall.disappear) {/*empty if*/} else firstBall.ballDraw();
  if (cheatBall.disappear) {/*empty if*/} else cheatBall.ballDraw();
  firstBall.collisionsUpdate(firstRacket.playAreaY, firstRacket.playAreaHeight, firstRacket.playAreaWidth, firstRacket.playAreaX, firstRacket.RacketX, firstRacket.RacketY, firstRacket.RacketWidth, firstRacket.RacketHeight, firstRacket.RacketWidth, secondRacket.RacketWidth, firstRacket.RacketHeight, secondRacket.RacketHeight);
  textSize(50); // Example size, adjust as needed
  textAlign(CENTER, TOP); // Center the text horizontally at the top
  fill(0); // Example color (black), adjust TballX, ballY, ballDiameter, ballDiameter);
  text("Pawng Patrol", width / 2, 10);

   
  //println(firstRacket.playAreaY, firstRacket.playAreaHeight, firstRacket.playAreaWidth, firstRacket.playAreaX, firstRacket.RacketX, firstRacket.RacketY, firstRacket.RacketWidth, firstRacket.RacketHeight, firstRacket.RacketX, secondRacket.RacketX, firstRacket.RacketY, secondRacket.RacketY);
}//end draw
//
void keyPressed() {
  if (key == '1') firstBall.disappear = true;
  if (key == '2') cheatBall.disappear = true;
  firstRacket.RacketKeyPressedWASD();
  secondRacket.RacketKeyPressedARROWKEYS();
}//end keyPressed
void keyReleased() {
  firstRacket.RacketKeyReleasedWSAD();
  secondRacket.RacketKeyReleasedARROWKEYS();
}
//
void mousePressed() {
  //for (int i=0; i < firework.length; i++) firework[i] = new Ball(int(mouseX), int(mouseY), 0.5);//populating firework
  cheatBall = new Ball(mouseX, mouseY, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);//initiates after mousePressed
}//end mousepressed
//
void explosions() { //firework effect when goal region hit
  if (mousePressed) cheatBall.disappear  = false;
  /*if (firstBall.ballX <= (firstBall.ballDiameter/2) || firstBall.ballX >= (width)-(firstBall.ballDiameter/2)) {
    for (int i=0; i < firework.length; i++) 
    firework[i] = new Ball(firstBall.ballX, firstBall.ballY, 0.5); //drawing multiple balls
  }
  if (!cheatBall.disappear) {
    if (cheatBall.ballX <= (cheatBall.ballDiameter/2) || cheatBall.ballX >= (width)-(cheatBall.ballDiameter/2)) {
      for (int i=0; i < firework.length; i++) 
      firework[i] = new Ball(cheatBall.ballX, cheatBall.ballY, 0.5); //drawing multiple balls
    }
  }*/
}//end explosions
//
void ballCollisions() {
  /*
  if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
  if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
  if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) (xVelocity) *= -1;
  if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) (yVelocity) *= -1;
  */
}//end ballCollisions
//end ClassMetaphors
