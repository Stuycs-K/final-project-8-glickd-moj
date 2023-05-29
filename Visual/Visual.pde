import java.util.*;
static int WIDTH = 1000;
static int HEIGHT = 1000;
static int boardW = WIDTH*7/8;
static int boardH = HEIGHT*7/16;
static int rad = boardH*3/5;
static int players = 3; //change according to size of users arraylist
static float increment = PI/8;
static float[] placeholders = new float[14];

void setup(){
  
  size(1000,1000);
  fill(21,68,6);
  arc(WIDTH/2, HEIGHT/4, boardW, 2*boardH, 0, PI);
  fill(255);
  line(WIDTH/2, 0, WIDTH/2, 800);
  for (int i = 1; i < 8; i++){
    float theta = PI - (increment*i);
    //float slope;
    //if (theta == PI/2){
    //  slope = 0;
    //}
    //else{
    //  slope = (-1/tan(increment));
    //}
    float x = (WIDTH/2) + (rad)*cos(theta);
    float y = (HEIGHT/4) + (rad)*sin(theta);
    float beta = PI/2 - theta;
    placeholders[2*i-1] = x - 20*cos(beta);
    placeholders[2*i-2] = y - 20*sin(beta);
    fill(255);
    rotate(theta);
    rect(placeholders[2*i-1], placeholders[2*i-2], 40, 60);
  }
  System.out.println(Arrays.toString(placeholders));
  
}
void draw(){
}
