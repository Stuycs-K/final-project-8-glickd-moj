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
PFont prompt;
ControlP5 cp5;

void setup() {
  size(1000, 1000);
  background(152, 133, 88);
  //prompt = createFont("Poppins-Black.ttf", 32);
  fill(165, 42, 42);
  stroke(165, 42, 42);
  arc(WIDTH/2, HEIGHT/4-20, boardW+40, 2*boardH+85, 0, PI);
  fill(21, 68, 6);
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
    rotate(HALF_PI-theta[i-1]);
    translate(-x, -y);
    popMatrix();
  }
  rect(WIDTH/2-40, HEIGHT/3-20, 40, 60); //where to display DEALER
  cp5 = new ControlP5(this);
  game = new Game();

  newHand = cp5.addButton("New Hand");
  newHand.setValue(0);
  newHand.setSize(120, 50);
  newHand.setPosition(25, 720);

  newGame = cp5.addButton("New Game");
  newGame.setValue(0);
  newGame.setSize(120, 50);
  newGame.setPosition(150, 720);
  
  hit = cp5.addButton("Hit");
  hit.setValue(0);
  hit.setSize(120, 50);
  hit.setPosition(275, 720);
  
  stand = cp5.addButton("Stand");
  stand.setValue(0);
  stand.setSize(120, 50);
  stand.setPosition(400, 720);
  
  betAmount = cp5.addSlider("Bet Amount");
  betAmount.setValue(10);
  betAmount.setSize(120,50);
  betAmount.setPosition(525,720);
  betAmount.setRange(0, 100);
  betAmount.setNumberOfTickMarks(101);
 
}

void displayText(String text) {
  stroke(152, 133, 88);
  fill(152, 133, 88);
  rect(50, 90, WIDTH*2/3, HEIGHT*1/10);
  fill(70, 42, 14);
  //textFont(prompt);
  text(text, 55, 120);
  int x = 55;
  long start = millis();
  for (int i = 0; i < text.length(); i++) {
    //long current = millis();
    //while(current - start < 500){
    //current = millis();
    //    //System.out.println("no");
    //}
    //System.out.println(text.charAt(i));
    displayChar(text.charAt(i), x, 120);
    x += textWidth(text.charAt(i))+ 5;
    //start = current;
  }
}
void draw(){
  game.displayCards(4);
  game.displayCards(0);
  //while(game.isntBust()){
  //  displayText("Please hit or stand.");
  //}
}

void controlEvent(ControlEvent event){
  if(event.isFrom(hit)){
    game.hit(4);
  }
  else if(event.isFrom(stand)){
    game.stand();
  }
  else if(event.isFrom(betAmount)){
    game.playerBet((int)betAmount.getValue());
  }
}

    

void displayChar(char letter, int x, int y) {
  text(letter, x, y);
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
