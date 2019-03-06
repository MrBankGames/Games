/* @pjs preload="snake1.png";*/
/* @pjs preload="snake2.png";*/
/* @pjs preload="snake3.png";*/
/* @pjs preload="snake4.png";*/

int games = 1;
int []HS = new int[100];
float xPos;                              //X Position of Snake Head
float yPos;                              //Y Position of Snake Head
int headRow = 6;
int headCol = 5;

float xDot;
float yDot;
int dotRow = 2;
int dotCol = 2;

int rows = 20;
int cols = 20;
int[][]SB = new int[cols][rows];

int newDot = 0;
int dotCount = 1;
PImage snake1,snake2,snake3,snake4;
int dir = 2;

float time =0;
int move = 0;
int moveTime = 250;

int prevTime = 0;
int prevTime2 = 0;
int prevDC = 0;


void setup(){
 size(1000,1000); 
 snake1 = loadImage("snake1.png");
 snake2 = loadImage("snake2.png");
 snake3 = loadImage("snake3.png");
 snake4 = loadImage("snake4.png");
math();
  time = millis();
}

void draw(){
  background(255); 
  //snakeGrid();                            //includes grid lines and square values to troubleshoot
  moves(); 
  dot();
  timer();
  snakes();
 }
void math(){
 for(int j = 0; j <cols; j++){
    for(int k = 0; k <rows; k++){
      SB[j][k] = 0;
    }
  } 
}
void snakeGrid(){
  fill(0);
  textSize(8);
  text(dotCount,40,60);
  for(int i = 0; i<rows; i++){
    line(10*i,0,10*i,1000);
    line(0,10*i,1000,10*i);
  }
  for(int j = 0; j <cols; j++){
    for(int k = 0; k <rows; k++){
      text(SB[j][k],10*j+4, 10*k+10);
    }
  }
}

void moves(){
  SB[headCol][headRow] = dotCount;
  if(move ==1){
    Dir();
    crash2();
    crash();
    tail();
  }
}

void snakes(){
  xPos = 50*headCol + 25;
  yPos = 50*headRow + 25;
  fill(50,220,50);
  ellipse(xPos, yPos, 10,10);
  for(int j = 0; j <cols; j++){
    for(int k = 0; k <rows; k++){
      if(SB[j][k] >0){
        if(SB[j][k]<dotCount){
          //noStroke();
          rect(50*j, 50*k, 50,50, 25);
        //ellipse(50*j+25, 50*k+25, 50,50);
        }
        if(SB[j][k]==dotCount){
          if(dir==3){
          image(snake1,50*j-5, 50*k-5, 60,60);
          }
           if(dir==2){
          image(snake2,50*j-5, 50*k-5, 60,60);
          }
           if(dir==1){
          image(snake3,50*j-5, 50*k-5, 60,60);
          }
           if(dir==4){
          image(snake4,50*j-5, 50*k-5, 60,60);
          }
        }
      }
    }
  }  
  fill(0);
  rect(0,0,1000,50);
  fill(255,0,0);
  textSize(24);
  text(dotCount,475,25);
   text("Best Score",150,20);
    text(HS[games-1], 200,40);
}

void dot(){
  if(newDot == 1){
    dotCol = int(random(1,19)); 
    dotRow = int(random(1,19)); 
    newDot = 0;
  }
  xDot = 50*dotCol + 25;
  yDot =50*dotRow + 25;
  fill(255,0,0);
  ellipse(xDot, yDot, 50,50);
  if(headCol == dotCol && headRow == dotRow){
    newDot = 1;
    dotCount = dotCount+1;
  }
}

void tail(){
  for(int j = 0; j <cols; j++){
    for(int k = 0; k <rows; k++){
      if(SB[j][k] >0){
        SB[j][k] = SB[j][k] -1;
      }
    }
  }
}

void reset(){
  if(HS[games-1]<dotCount){
  HS[games-1] = dotCount;
  }
  dotCount = 1;
  for(int j = 0; j <cols; j++){
     for(int k = 0; k <rows; k++){
       if(SB[j][k] >0){
         SB[j][k] = 0;
       }
     }
   }
   headCol = 6;
   headRow = 5;
   
   prevTime2 = millis()-prevTime;
   text("Best Score",350,40);
    text(HS[games-1], 400,70);
   //time = millis();
}

void timer(){
  move = 0;
  if(millis() - time > moveTime){
    move = 1;
    time = millis();
  }
}

void crash(){
  if(SB[headCol][headRow] != 0){
    reset(); 
  }
  if (dotCount >5){
    moveTime=200;
  }
  if (dotCount >10){
    moveTime=150;
  }
  if (dotCount >15){
    moveTime=100;
  }
  if (dotCount >20){
    moveTime=50;
  }
}

void crash2(){
  if(headCol <0 || headCol > (cols-1) || headRow <1 || headRow >(rows-1)){
     reset(); 
  }
}

void Dir(){
    if(dir == 1 ){
      headRow = headRow -1;
    }
    if(dir == 2){
      headCol = headCol +1;
    }
    if(dir == 3){
      headRow = headRow +1;
    }
    if(dir == 4){
      headCol = headCol -1;
    }
}

void keyPressed(){
  if(keyCode == UP){
    dir = 1;
  }
  if(keyCode == DOWN){
    dir = 3;
  }
  if(keyCode == LEFT){
    dir = 4;
  }
  if(keyCode == RIGHT){
    dir = 2;
   }
 // print();
}

void print(){
  print(headCol);
  print(" ");
  println(headRow); 
}
