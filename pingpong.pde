import ddf.minim.*;
import ddf.minim.signals.*;

void setup ( ) {
  size(500, 500);
  background(0);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  aut = new SineWave(880, 0.5, out.sampleRate());
  racket = new SineWave(990, 0.5, out.sampleRate());
}

Minim minim;
AudioOutput out;
SineWave sine,racket,aut;
int st = 5;
int rgb = 0;
int rr = 255;
int gg = 255;
int bb = 255;
float a = 5;
float b = random(0,4);
float v = 100;
float w = 250;
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
  out = minim.getLineOut(Minim.STEREO);
  background(0);
  fill(255,255,255);
  rect(50,y,10,100);
  fill(255,255,255);
  rect(440,x,10,100);
  
  fill(rr,gg,bb);
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
    out.addSignal(sine);
    a=a*-1;
    delay(st);
  }
  else if(w >= 500 || w <= 0){
    out.addSignal(aut);
    b=b*-1;
    delay(st);
  }
  else if((v >= 440) && (v <= 450) && (x <= w) && (w <= (x+100))){
    out.addSignal(racket);
    a = a * -1;
    if((x+40) <= w && w <= (x+60)){
      b = random(-1,1);
    }else if(x < w && w < (x+40)){
      b = random(-4,-1);
    }else if((x+60) < w && w < (x+100)){
      b = random(1,4);
    }
    delay(st);
  }
  else if((v <= 60) && (v >= 50) && (y <= w) && (w <= (y+100))){
    out.addSignal(racket);
    a = a * -1;
    if((y+40) <= w && w <= (y+60)){
      b = random(-1,1);
    }else if(y < w && w < (y+40)){
      b = random(-4,-1);
    }else if((y+60) < w && w < (y+100)){
      b = random(1,4);
    }
    delay(st);
  }
  
  v=v+a;
  w=w+b;
  out.close();
  
  /*
  y = w - 50;
  */
  
  /*
  switch(rgb%4){
    case 0:
    rr=255;
    gg=255;
    bb=255;
    break;
    case 1:
    rr=255;
    gg=bb=0;
    break;
    case 2:
    gg=255;
    rr=bb=0;
    break;
    case 3:
    bb=255;
    rr=gg=0;
    break;
  }
  */
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}
