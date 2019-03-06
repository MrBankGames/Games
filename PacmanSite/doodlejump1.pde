float pX = 500;
float pY = 750;
int[][]pMath = new int[1000][3];
int t =0;
int dirUD = 0;
int dirLR = 0;
int grav = 5;
float yVel = 0;
int type =1;
int xPlat =450;
int xPlat1 =450;
int xPlat2 =450;
int xPlatSpeed = 5;
int xSpeed = 5;


void setup(){ 
 size(1000,1000);
 background(0); 
 pmath();
}

void draw(){
 background(0);
 platform();
 color d = get(int(pX), int(pY+100));
  color e = get(int(pX+50), int(pY+100));
 yVel = yVel - .15;
 if(yVel<-9){
  yVel=-9; 
 }
 if(pY >-100){
   if(d != -16777216){
    if(yVel <5&& pY >-50&&pX>0&&pX<950){
     yVel = 8;
    }
      // yVel =9;
   }
   if(e != -16777216){
    if(yVel <5&& pY >-50&&pX>0&&pX<950){
     yVel = 8;
    }
      // yVel =9;
   }
 }
 if(pX<1){
  pX = 950; 
 }
 if(pX>950){
  pX = 0; 
 }
 pY = pY -yVel;
 if(pY <400){
  t=t+3; 
 }
  xPlat = xPlat+xPlatSpeed;
  if(xPlat>850 || xPlat < 100){
    xPlatSpeed = xPlatSpeed *-1;
  }
  println(t);
  fill(255,0,0);
  textSize(24);
  text(t, 25,25);
  p1();
  move();
  if(pY>900){
   reset(); 
  }
}

void p1(){
  fill(0,255,0);
  rect(pX,pY, 50,100);
}

void platform(){
  for(int i = 0; i<1000;i++){
      if(pMath[i][1] ==0){
  fill(255,255,0);
  rect(pMath[i][2],980-200*i+t, 150,10);
      }
       if(pMath[i][1] ==1){
  fill(255,0,0);
  rect(pMath[i][2],980-200*i+t, 150,10);
      }
       if(pMath[i][1] ==2){
  fill(0,0,255);
  rect(xPlat,980-200*i+t, 150,10);
 
      }
  }
}

void pmath(){
  
 for(int i = 0; i<1000;i++){
    type = int(random(4));
      if(type ==1){
  pMath[i][1]=0;
  pMath[i][2]=int(random(100,850));
      }
       if(type ==2){
   pMath[i][1]=1;
  pMath[i][2]=int(random(100,850));
      }
       if(type ==3){
   pMath[i][1]=2;
      }
  }
}

void move(){
 if(keyPressed){
   if(keyCode==RIGHT){
     pX = pX + xSpeed;
   }
    if(keyCode==LEFT){
      pX = pX - xSpeed;
   }
 }
}
void reset(){
 pmath();
  t=0; 
}
