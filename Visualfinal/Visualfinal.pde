import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;
import controlP5.*;
Game game ;
Button hit;
Button stand;
Button newHand;
Button toBet;
Button newGame;
Slider betAmount;
Button bet;
int playerNum;
static int WIDTH = 1000;
static int HEIGHT = 1000;
static int boardW = WIDTH*7/8;
static int boardH = HEIGHT*7/16;
static int rad = boardH*3/5;
static int players = 3; //change according to size of users arraylist
static float increment = PI/8;
static float[] placeholders = new float[14];
static float[] theta = new float[7];
//PFont prompt;
ControlP5 cp5;

void setup() {
  size(1000, 1000);
  //prompt = createFont("Poppins-Black.TTF", 32);
  background(98, 131, 133);
  clearTable();
  

  rect(WIDTH/2-40, HEIGHT/3-20, 40, 60); //where to display DEALER
  cp5 = new ControlP5(this);
  game = new Game();
  newHand = cp5.addButton("New Hand");
  newHand.setValue(0);
  newHand.setSize(120, 50);
  newHand.setPosition(75, 760);

  newGame = cp5.addButton("New Game");
  newGame.setValue(0);
  newGame.setSize(120, 50);
  newGame.setPosition(200, 760);
  
  hit = cp5.addButton("Hit");
  hit.setValue(0);
  hit.setSize(120, 50);
  hit.setPosition(325, 760);
  
  bet = cp5.addButton("Bet");
  bet.setValue(0);
  bet.setSize(120,50);
  bet.setPosition(750,760);
  
  stand = cp5.addButton("Stand");
  stand.setValue(0);
  stand.setSize(120, 50);
  stand.setPosition(450, 760);
  
  betAmount = cp5.addSlider("Bet Amount");
  betAmount.setValue(5);
  betAmount.setSize(120,50);
  betAmount.setPosition(575,760);
  betAmount.setRange(0, 100);
  betAmount.setNumberOfTickMarks(101);
 
}

void displayText(String text) {
  stroke(98, 131, 133);
  fill(98, 131, 133);
  rect(50, 90, WIDTH*2/3, HEIGHT*1/20);
  fill(70, 42, 14);
  //textFont(prompt);
  textSize(30);
  text(text, 55, 120);
}
void displayText2(String text) {
  stroke(98, 131, 133);
  fill(98, 131, 133);
  rect(50, 140, WIDTH*2/3, HEIGHT*1/20);
  fill(70, 42, 14);
  //textFont(prompt);
  textSize(30);
  text(text, 55, 170);
}
void draw(){
  checkButtons();
  game.displayDealerHand();
  game.displayCards(4);
  if (game.playing() && game.isDealerTurn()) {
    game.dealerTurn();
  }
  if(!game.playing()){
    int winner = game.getWinner();
    if (winner == 0) {
      displayText("Not bad. It was a draw.");
      System.out.println("Not bad. It was a draw.");
      game.playerWin();
    }
    else if (winner == -1) {
      displayText("Oh well, the dealer won.");
      System.out.println("Oh well, the dealer won.");
      game.dealerWin();
    }
    else {
      displayText("Congrats, you win.");
      System.out.println("Congrats, you win.");
      game.playerWin();
    }
  }
}
void mouseClicked(){
  checkButtons();
}
void checkButtons(){
  if(stand.isPressed() && game.started() && game.playing()){
    game.stand();
  }
  else if(hit.isPressed() && game.started() && game.playing()){
    game.hit();
  }
  else if(bet.isPressed() && !game.started()){
    game.bet((int)betAmount.getValue());
    game.startGame();
  }
  else if(newHand.isPressed()){
    loop();
    game.reset();
    betAmount = cp5.addSlider("Bet Amount");
    betAmount.setValue(5);
    betAmount.setSize(120,50);
    betAmount.setPosition(525,720);
    betAmount.setRange(0, 100);
    betAmount.setNumberOfTickMarks(101);
  }
  else if(newGame.isPressed()){
    loop();
    game = new Game();
  } 
}
    
void clearTable(){
  fill(25, 79, 57);
  strokeWeight(30);
  stroke(70, 42, 14);
  arc(WIDTH/2, HEIGHT/4, boardW, 2*boardH, 0, PI, CHORD);
  strokeWeight(1);
  for (int i = 1; i <8; i++) {
    theta[i-1] = PI - (increment*i);
    placeholders[2*i-2] = (WIDTH/2) + (rad)*cos(theta[i-1]);
    placeholders[2*i-1] = (HEIGHT/4) + (rad)*sin(theta[i-1]);
    float x = placeholders[2*i-2];
    float y = placeholders[2*i-1];
    stroke(255);
    pushMatrix();
    translate(x, y);
    rotate(theta[i-1]-HALF_PI);
    rect(-20, 0, 40, 60);
    popMatrix();
  }
}
void showCard(int player, int layer, PImage card) { //add image parameter
  fill(0);
  float x = placeholders[2*player-2] + layer*(18*cos(theta[player-1]));
  float y = placeholders[2*player-1] + layer*(18*sin(theta[player-1]));
  pushMatrix();
  translate(x, y);
  rotate(theta[player-1]-HALF_PI);
  image(card, -20, 0, 40, 60);
  popMatrix();
}
void showDealerEnd(int layer, PImage card){
  image(card ,WIDTH/2-40 + layer*15, HEIGHT/3-20, 40, 60);
}
void showDealer(int layer, PImage card){
  image(card ,WIDTH/2-40, HEIGHT/3-20, 40, 60);
  }
