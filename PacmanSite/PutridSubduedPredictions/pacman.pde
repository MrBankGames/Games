/* @pjs preload="https://lh3.googleusercontent.com/R7nEuOHEUAFkhqVBxrUYjSaHMzu5jGh42gGbPxricEQA2wJ_OZ9e3UNe-2rdMa4nlNa2AdIgJMArD7iR7JRnZ2Thwkujpgun8aubnGgQIy0VgyO9y7sPJF6JSvJJUDPRBL1hUR2uKfpF2jYGUZsNStBFv6L30B5fpQWct_h_hyY6A0sB65Y3cqdxuGEZf0CTrbm2nc9q1J5uKYjEYzERn8UUJmJvEj5XNpLbelCZNazSRZIUPsOudMl_GhVLhP7vRFLZPjnxisrzDWI0wW_WvS0-a5rAEkxPOKHWpN3ZhZgwMwiJ12uJAHlo33RVDkOeJIzMdvPozEUaLa3kKBNXqWhSzUQU5iYtXCm3itkBzN1wJKiGf2irYCIBJsNQ1SaJGOUWV92_P9TLcl-VM89zM3OqV7gbZWPF1i3gyUxUZnBqmHPGt1PH_9sN0wlkUvAYW5iex2xA01htQZ-fHGFLO92_lm-WggQIcpuOv27FEBi3n_ri3Scmx_H5jmzZL9_h-jlZCrIHOGmbpn6yAY5UlpSonLTvPWqIqJ_r41qoPRi0QZJdLvxBwcR7HOuLQ2Ov0FSqV0uj_64jzcl20ssHQk9al1lz5ua6aAARtPjHjsDQiToSaWmtjNei3ncN3s9t7lr_t-_mLkUwFbUfN_6NEkHIX_G2IfiM24VB2YZEJ3NtecM8BybG-Q=w1369-h1513-no";*/
int games = 1;
int []HS = new int[100];
int rows = 21;
int cols = 19;
PImage maze;
int[][]SB = new int[cols][rows];
int xPos, yPos;
int headCol = 3;
int headRow = 9;
int dir = 2;
int move  = 0;
int time = 0;
int moveTime = 100;
int dotCount = 0;
int prevTime = 0;
int prevTime2 = 0;
int prevDC = 0;

void setup(){
 size(1000,1000); 
 background(0);
 maze = loadImage("https://lh3.googleusercontent.com/R7nEuOHEUAFkhqVBxrUYjSaHMzu5jGh42gGbPxricEQA2wJ_OZ9e3UNe-2rdMa4nlNa2AdIgJMArD7iR7JRnZ2Thwkujpgun8aubnGgQIy0VgyO9y7sPJF6JSvJJUDPRBL1hUR2uKfpF2jYGUZsNStBFv6L30B5fpQWct_h_hyY6A0sB65Y3cqdxuGEZf0CTrbm2nc9q1J5uKYjEYzERn8UUJmJvEj5XNpLbelCZNazSRZIUPsOudMl_GhVLhP7vRFLZPjnxisrzDWI0wW_WvS0-a5rAEkxPOKHWpN3ZhZgwMwiJ12uJAHlo33RVDkOeJIzMdvPozEUaLa3kKBNXqWhSzUQU5iYtXCm3itkBzN1wJKiGf2irYCIBJsNQ1SaJGOUWV92_P9TLcl-VM89zM3OqV7gbZWPF1i3gyUxUZnBqmHPGt1PH_9sN0wlkUvAYW5iex2xA01htQZ-fHGFLO92_lm-WggQIcpuOv27FEBi3n_ri3Scmx_H5jmzZL9_h-jlZCrIHOGmbpn6yAY5UlpSonLTvPWqIqJ_r41qoPRi0QZJdLvxBwcR7HOuLQ2Ov0FSqV0uj_64jzcl20ssHQk9al1lz5ua6aAARtPjHjsDQiToSaWmtjNei3ncN3s9t7lr_t-_mLkUwFbUfN_6NEkHIX_G2IfiM24VB2YZEJ3NtecM8BybG-Q=w1369-h1513-no", "jpg");
 grid2();
 time = millis();
  prevTime = millis();

}

void draw(){
  background(0);
  grid3();
  player();
  if(move ==1){
    crash2();
    Dir();
  }
  timer();
 // print(headRow);
 // print(" ");
 // println(headCol);
}

void player(){
  fill(255,0,0);
  xPos = headCol*52 +26;
  yPos = headRow*47 +30;
  ellipse(xPos, yPos, 35, 35);
}

void Dir(){
    if(dir == 1 ){
      headRow = headRow -1;
      if(SB[headCol][headRow] == 0){
         headRow = headRow +1;
      }
      else{
        SB[headCol][headRow] = 2; 
      }
    }
    if(dir == 2){
    headCol = headCol +1;
      if(SB[headCol][headRow] == 0){
        headCol = headCol -1;
      }
      else{
        SB[headCol][headRow] = 2; 
      }
    }
    if(dir == 3){
      headRow = headRow +1;
      if(SB[headCol][headRow] == 0){
         headRow = headRow -1;
      }
      else{
        SB[headCol][headRow] = 2; 
      }
    }
    if(dir == 4){
      headCol = headCol -1;
      if(SB[headCol][headRow] == 0){
        headCol = headCol +1;
      }
      else{
        SB[headCol][headRow] = 2; 
      }
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
   if(key == ' '){
    reset();
   }
}

void timer(){
  move = 0;
  if(millis() - time > moveTime){
    move = 1;
    time = millis()/1000-prevTime2/1000;
    textSize(32);
    fill(255,127,0);
    text("Time",50,30);
    text(time,50,60);
    text("Best Time - Score",350,30);
    text(HS[games-1], 400,60);
    text("Dots Left",850,30);
    text(prevDC,570,60);
    println(HS[games-1]);
    println(prevTime2/1000);
    text(dotCount, 900,60);
  }
  if(dotCount==0){
    reset();
  }
}

void crash2(){
  if(headRow == 9 && headCol > cols-2 && dir == 2){
    headCol = 0;
  }
  else if(headRow == 9 && headCol < 1 && dir == 4){
    headCol = cols;
  }
}

void reset(){
  games = games + 1;
   headCol = 3;
   headRow = 9;
   dir = 0;
     prevDC = dotCount;
   SB[headCol][headRow] = 1;
   grid2();
   
     HS[games-1] = time;
   prevTime2 = millis()-prevTime;
}

void grid2(){
  image(maze, 0,0,1000,1000);
  dotCount=0;
    for(float j = 0; j <cols; j++){
    for(float l = 0; l <rows; l++){
      color d = get(int(52.5*j + 10), int(48*l +5));
      if(d == -16777216){
        SB[int(j)][int(l)] = 1;
      }
      else{
       SB[int(j)][int(l)] = 0; 
      }
      SB[0][7] = 0;SB[1][7] = 0;SB[2][7] = 0;SB[16][7] = 0;SB[17][7] = 0;SB[18][7] = 0;SB[9][8]=0;
      SB[0][9] = 2;SB[1][9] = 2;SB[2][9] = 2;SB[16][9] = 2;SB[17][9] = 2;SB[18][9] = 2;SB[3][9] = 2;SB[15][9] = 2;SB[9][9] = 2;SB[8][9] = 2;SB[10][9] = 2;
      SB[0][11] = 0;SB[1][11] = 0;SB[2][11] = 0;SB[16][11] = 0;SB[17][11] = 0;SB[18][11] = 0;
       //text(SB[int(j)][int(l)], 52.5*j +26.25, 47.25*l+30); 
    }
  }
}

void grid3(){
  image(maze, 0,0,1000,1000);
  dotCount =0;
    for(float j = 0; j <cols; j++){
    for(float l = 0; l <rows; l++){
      if (SB[int(j)][int(l)] == 1){
        fill(255,255,0);
        ellipse(52.5*j + 26.25 ,47.25*l+30 , 20, 20);
        dotCount++;
      }
    }
  }
}
