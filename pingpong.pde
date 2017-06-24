void setup ( ) {
  size(500, 500);
  background(0);
}

float a = random(3,4);
float b = random(3,4);
float v = 20;
float w = 20;
float y=200;
float x=200;
int keyStat;

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case 38:
      keyStat|=0x1;
      break;
      case 40:
      keyStat|=0x2;
      break;
      case 16:
      keyStat|=0x4;
      break;
      case 17:
      keyStat|=0x8;
      break;
    }
  }
}

void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case 38:
      keyStat&=~0x1;
      break;
      case 40:
      keyStat&=~0x2;
      break;
      case 16:
      keyStat&=~0x4;
      break;
      case 17:
      keyStat&=~0x8;
      break;
    }
  }
}
      

void draw( ) {
  background(0);
  fill(255,255,255);
  rect(50,y,10,100);
  fill(255,255,255);
  rect(440,x,10,100);
  
  fill(255,255,255);
  ellipse(v,w,10,10);
  
  if((keyStat&0x1)!=0 && x >0){
    x=x-5;
  }
  if((keyStat&0x2)!=0 && x < 400){
    x=x+5;
  }
  if((keyStat&0x4)!=0 && y > 0){
    y=y-5;
  }
  if((keyStat&0x8)!=0 && y <400){
    y=y+5;
  }
  
  if(v >= 500 || v <= 0){
    a=a*-1;
  }
  if(w >= 500 || w <= 0){
    b=b*-1;
  }
  if((v >= 440) && (x <= w) && (w <= (x+100))){
    a=a*-1;
  }
  if((v <= 60) && (y <= w) && (w <= (y+100))){
    a=a*-1;
  }
  
  v=v+a;
  w=w+b;
}
