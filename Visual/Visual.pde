static int WIDTH = 1000;
static int HEIGHT = 1000;
static int boardW = WIDTH*7/8;
static int boardH = HEIGHT*7/16;
void setup(){
  
  size(1000,1000);
  fill(21,68,6);
  arc(WIDTH/2, HEIGHT/4, boardW, 2*boardH, 0, PI);
  fill(255);
  line(WIDTH/2, 0, WIDTH/2, 800);
  int players = 3; //change according to size of users arraylist
  //for each player
  float theta = PI/(players + 1);
  float slope = (-1/tan(theta))
  float x = (boardH*3/5)*cos(theta);
  float y = (boardH*3/5)*sin(theta);
  float x1 = ;
  float y1 = ;
  rect(380, 400, 40, 60);
}
void draw(){
}
