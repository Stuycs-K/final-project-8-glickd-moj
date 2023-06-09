import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;
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

void setup(){
  
  size(1000,1000);
  prompt = createFont("Poppins-Black.ttf", 32);
  
  //fill(165,42,42);
  //stroke(165,42,42);
  //arc(WIDTH/2, HEIGHT/4-20, boardW+40, 2*boardH+85, 0, PI);
  fill(21,68,6);
  strokeWeight(30);
  stroke(70,42,14);
  arc(WIDTH/2, HEIGHT/4, boardW, 2*boardH, 0, PI, CHORD);
  strokeWeight(1);

  for (int i = 1; i <8; i++){
    theta[i-1] = PI - (increment*i);
    placeholders[2*i-2] = (WIDTH/2) + (rad)*cos(theta[i-1]);
    placeholders[2*i-1] = (HEIGHT/4) + (rad)*sin(theta[i-1]);
    float x = placeholders[2*i-2];
    float y = placeholders[2*i-1];
    stroke(255);
    pushMatrix();
    translate(x,y);
    rotate(theta[i-1]-HALF_PI);
    rect(-20, 0, 40, 60);
    popMatrix();
   }  
   //Game game = new Game();
    //game.game();
    displayText("testing");
}
void showCard(int player, int layer, PImage card){ //add image parameter
    fill(0);
    float x = placeholders[2*player-2] + layer*(18*cos(theta[player-1]));
    float y = placeholders[2*player-1] + layer*(18*sin(theta[player-1]));
    pushMatrix();
    translate(x, y);
    rotate(theta[player-1]-HALF_PI);
    image(card, -20, 0, 40, 60);
    popMatrix();
}
void displayText(String text){
  //stroke(0);
  //rect(70, 90, WIDTH*2/3, HEIGHT*1/10);
  //fill(0);
  textFont(prompt);
  text(text, 50, 120); 
}
void draw(){
//  try{
//  Deck test = new Deck();
//  test.shuffle();
//  showCard(2,0,test.deal().getImage());
//  showCard(2,1,test.deal().getImage());

//  showCard(2,2,test.deal().getImage());
//  //displayText("testing");
//  }
//  catch (Exception ex){
//    ex.printStackTrace();
//  }
  
}
