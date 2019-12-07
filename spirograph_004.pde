// Code from: https://gist.github.com/sambrenner/1308163
// sambrenner/spirograph.pde
// https://www.samjbrenner.com
// Based on Code by Sam Brenner

import processing.pdf.*;
import processing.opengl.*;

float a, b, h, xpos, ypos, oxpos, oypos, t, ot, d, od, s;
int frameSize = 1600, count;
void setup()
{

  a = 270.0;
  b = 60.0;
  h = 249.0;


  size(1600, 1600);
  background(255);
  stroke (0);
  beginRecord(PDF, "spiro03a_"+a+"_"+b+"_"+h+".pdf");
  noLoop();
  count = 0;
}

void draw()
{

  // fill(0,10);
  // noStroke();
  rect(0, 0, width, height);

  // a=mouseX;
  // b=60;
  // h=mouseY;

  a = 270.0;
  b = 60.0;
  h = 249.0;



  s=0;

  for (float i=1; i<361; i+=1)
  {
    t=radians(i);
    ot=radians(i-1);
    d=(a-b/b)*t;
    od=(a-b/b)*ot;

    oxpos=(a-b)*cos(ot)+h*cos(od);
    oypos=(a-b)*sin(ot)+h*sin(od);    

    xpos=(a-b)*cos(t)+h*cos(d);
    ypos=(a-b)*sin(t)+h*sin(d);

    //  stroke(s,360,360);
    count = count + 1;
    println(count);
    line(frameSize/2+oxpos, frameSize/2+oypos, frameSize/2+xpos, frameSize/2+ypos);
  }   
  endRecord();
}

void mouseMoved()
{
  // s++;
  // if(s>360)s=0;
}

void mousePressed()
{

  save("spiro03a_"+a+"_"+b+"_"+h+".png");
  endRecord();
  exit();
}
