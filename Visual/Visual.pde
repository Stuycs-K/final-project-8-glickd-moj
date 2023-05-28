static int WIDTH = 1000;
static int HEIGHT = 1000;
static int boardW = WIDTH*7/8;
static int boardH = HEIGHT*7/16;
static int rad = boardH*3/5;
static int players = 3; //change according to size of users arraylist
static float increment = PI/8;
static float x1;
static float y1;
static float x2;
static float y2;
static float x3;
static float y3;
static float x4;
static float y4;
static float x5;
static float y5;
static float x6;
static float y6;
static float x7;
static float y7;

void setup(){
  
  size(1000,1000);
  fill(21,68,6);
  arc(WIDTH/2, HEIGHT/4, boardW, 2*boardH, 0, PI);
  fill(255);
  line(WIDTH/2, 0, WIDTH/2, 800);
  for (int i = 1; i < 8; i++){
    float theta = PI - (increment*i);
    float slope = (-1/tan(increment));
    if (ref == PI/2){
      slope = 0;
    }
    float x = (WIDTH/2) + (rad)*cos(theta);
    float y = (HEIGHT/4) + (rad)*sin(theta);
    float beta = PI/2 - theta;
    float x1 = x + cos(beta);
    float y1 = y + sin(beta);
    RECT_MODE = CORNERS;
    rect(x1, y1, )
  }
  
  
  rect(380, 400, 40, 60);
}
void draw(){
}
