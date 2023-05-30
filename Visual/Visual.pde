import java.util.*;
static int WIDTH = 1000;
static int HEIGHT = 1000;
static int boardW = WIDTH*7/8;
static int boardH = HEIGHT*7/16;
static int rad = boardH*5/7;
static int players = 3; //change according to size of users arraylist
static float increment = PI/8;
static float[] placeholders = new float[14];
static float[] theta = new float[7];

void setup(){
  
  size(1000,1000);
  fill(21,68,6);
  arc(WIDTH/2, HEIGHT/4, boardW, 2*boardH, 0, PI);
  fill(255);
  line(2, 2, 798, 2);
  line(2, 2, 2, 798);

  for (int i = 1; i <8; i++){
    theta[i-1] = PI - (increment*i);
    //float slope;
    //if (theta == PI/2){
    //  slope = 0;
    //}
    //else{
    //  slope = (-1/tan(increment));
    //}
    placeholders[2*i-2] = (WIDTH/2) + (rad)*cos(theta[i-1]);
    placeholders[2*i-1] = (HEIGHT/4) + (rad)*sin(theta[i-1]);
    float x = placeholders[2*i-2];
    float y = placeholders[2*i-1];
    //float beta = PI/2 - theta;
    //- 20*cos(beta);
    //- 20*sin(beta);
    fill(255);
    translate(x,y);
    rotate(theta[i-1]-HALF_PI);
    rect(-20, 0, 40, 60);
    rotate(HALF_PI-theta[i-1]);
    translate(-x,-y);
   }  
}
void showCard(int player){
    fill(0);
    translate(placeholders[2*player-2],placeholders[2*player-1]);
    rotate(theta[player-1]-HALF_PI);
    rect(-20, 0, 40, 60);
    rotate(HALF_PI - theta[player-1]);
}
void draw(){
  showCard(1);
}
