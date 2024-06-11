class Button extends Rectangle {
  //Global Variables
  //
  Button (float x, float y, float w, float h, color c) {
    super(x, y, w, h, c);
  }//end Button
  //Methods
  void drawing() {
    noStroke();
    if (x == exitX) {
      color exitOn = #ff1919;
      color exitOff = #F05E5E;
      drawing(exitOn, exitOff);
      rectText("exit");
    }
    if (x == menuTogameX) {
      drawing(hoverOver, secondaryColor);
      rectSwitchingText("PLAY", "MAIN MENU", MenuOn);
    }
    if (selectOn) {
      if (x == twoplayer) {
        drawing(hoverOver, secondaryColor);
        rectText("Two player");
      }
      if (x == oneplayerX) {
        drawing(hoverOver, secondaryColor);
        rectText("One player");
      }
      if (gameAiDropMenu) {
        if (x == hardaiX) {
          drawing(hoverOver, secondaryColor);
          rectText("  Hard Mode  ");
        }
        if (x == medaiX) {
          drawing(hoverOver, secondaryColor);
          rectText("Medium Mode");
        }
        if (x == easyaiX) {
          drawing(hoverOver, secondaryColor);
          rectText("  Easy Mode  ");
        }
      }
    }
    if (gameOn) {
      if (x == stopX) {
        drawing(hoverOver, secondaryColor);
        rectSwitchingText("stop", "start", gameGameOn);
      }
      if (y == resetScoreY && x != exitX) {
        drawing(hoverOver, secondaryColor);
        rectText("Reset");
      }
    }
    fill(colorReset);
  }//end Drawing
  //
  void mousePressed() {
    if (x == exitX) mousePressedExitFunction();
    if (x == menuTogameX) mousePressedMenuTogameFunction();
    if (selectOn) {
      if (x == twoplayer) mousePressedTwoplayerFunction();
      if (x == oneplayerX) mousePressedOneplayerFunction();
      if (gameAiDropMenu) {
        if (x == hardaiX) mousePressedhardaiFunction();
        if (x == medaiX) mousePressedmedaiFunction();
        if (x == easyaiX) mousePressedeasyaiFunction();
      }
    }
    if (gameOn) {
      if (x == stopX) mousePressedstopGameFunction();
      if (y == resetScoreY) mousePressedResetScoreFunction();
    }
  }//end mousePressed
  //
  void keyPressed() {}//end keyPressed
  //
  void keyReleased()  {}//end keyReleased
  //
  void reset() {
    resetScore();
    oneplayer = false;
    medai = false;
    easyai = false;
  }//end reset
  //
  float exitX, menuTogameX, stopX, resetScoreY, twoplayer, oneplayerX, hardaiX, medaiX, easyaiX;
  void variablesUpdate(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8) {
    exitX = v0;
    menuTogameX = v1;
    stopX = v2;
    resetScoreY = v3;
    twoplayer = v4;
    oneplayerX= v5;
    hardaiX = v6;
    medaiX = v7;
    easyaiX = v8;
  }//end variablesUpdate
  //
  void drawing(color hoverOver, color buttonColor) {
    if ( mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h )
    {fill(hoverOver);} else {fill(buttonColor);}
    rect(x, y, w, h);
  }//end drawing
  void mousePressedExitFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    exit();
  }//end mousePressedExitFunction
  void mousePressedMenuTogameFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    MenuSwitch();
  }//end mousePressedMenuTogameFunction
  void mousePressedstopGameFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    gameOnOffSwitch();
  }//end mousePressedstopGameFunction
  void mousePressedResetScoreFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    resetScore();
  }//end mousePressedResetScoreFunction
  void resetScore() {
    scoreRight = 0;
    scoreLeft = 0;
  }//end resetScore
  void mousePressedTwoplayerFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h )
    selectSwitch();
  }//end mousePressedTwoplayerFunction
  void mousePressedOneplayerFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      gameAiDropMenu();
    }
  }//end mousePressedOneplayerFunction
  void mousePressedhardaiFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      oneplayer = true;
      selectSwitch();
    }
  }//end mousePressedhardaiFunction
  void mousePressedmedaiFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      oneplayer = true;
      medai = true;
      selectSwitch();
    }
  }//end mousePressedmedaiFunction
  void mousePressedeasyaiFunction() {
    if ( mouseX>=x && mouseX<=x+w && mouseY>= y && mouseY<=y+h ) {
      oneplayer = true;
      easyai = true;
      selectSwitch();
    }
  }//end mousePressedeasyaiFunction
  void rectText (String firstText) {
    drawText( height, ink, CENTER, CENTER, Font, textSpace+firstText+textSpace, x, y, w, h);
  }//end rectText
  void rectSwitchingText(String firstText, String secondText, boolean boole) {
    if (boole) {
      drawText( height, ink, CENTER, CENTER, Font, textSpace+firstText+textSpace, x, y, w, h);
    } else {
      drawText( height, ink, CENTER, CENTER, Font, textSpace+secondText+textSpace, x, y, w, h);
    }
  }//end rectSwitchingText
  //
  void gameAiDropMenu() {
    if (gameAiDropMenu) {
      gameAiDropMenu = false;
    } else {
      gameAiDropMenu = true;
    }
  }//end dropMenu
  color backgroundColor() {
    color nightselect = 0;
    return nightselect;
  }//end backgroundColor
}//end Button
//end Button subProgram
