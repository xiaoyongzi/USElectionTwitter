import geomerative.*;
import wordookie.*;

Circles circles;
InCircles c_in;
Connections connections;
Date date = new Date(112, 9, 24, 0, 0, 0);
float x1=450;
float y1=750;
float l1=300;
int n1=16;
float h1=10;
Timeline time;
long savedtime;
long savedtime2;
PImage bg;
Integrator[] inter;
float day;
int timeselect1= 1;
PFont font;


/*
public void init() {
  // to make a frame not displayable, you can
  // use frame.removeNotify()
  frame.removeNotify();
  frame.setUndecorated(true);
  // addNotify, here i am not sure if you have
  // to add notify again.
  frame.addNotify();
  // frame.removeNotify();
  super.init();
}
*/
void setup() {
  //size(1200, 800, OPENGL);
  size(1200, 800);

  smooth();
  circles = new Circles(300);
  c_in = new InCircles();
  connections = new Connections(circles, c_in);
  time = new Timeline(x1, y1, l1, n1, h1);
  savedtime = date.getTime();
  savedtime2 = savedtime;
  bg = loadImage("bg.png");
  inter = new Integrator[1];
  inter[0] = new Integrator(timeselect1);
  font=loadFont("GillSans-Light-30.vlw");
}

void draw() {
  background(255);
  //println(date.getTime());
  drawArc();
  circles.draw(daytoDate(day), font);
  c_in.draw(timeselect1);
  connections.draw(daytoDate(day));
  
  //date = dates[time.timeselect_return()-1];
  //day += 0.005;
  timeselect1 = time.timeselect_return();
  inter[0].update();
  inter[0].target(timeselect1);
  day = inter[0].value+2;
  //println(day);
  //    if(date.getTime()-savedtime<60000000){
  //   date = new Date( date.getTime()+600000);
  //    }
  //   
  //  savedtime = savedtime2 + time.timeselect_return()*60000000;
  //  date = new Date(savedtime2 + time.timeselect_return()*60000000);

  time.select(); 
  time.keylong();
  time.body();
  time.font();

  image(bg, 0, 0);
  //bottom y600 so y=600-value h=value maxh=300
  fill(255, 0, 0);

  //    float h1 =inter[0].value;
  //    float h2 =inter[1].value;
  //    rect(60,600-h1,50,h1);
  //    rect(1090,600-h2,50,h2);
}

void drawArc() {
  int i = 600;
  noStroke();
  fill(#6C8CD5, 100);
  arc(600, 400, i, i, HALF_PI+PI/40, PI+HALF_PI-PI/40);   // OUTER red
  fill(#4671D5, 120);
  arc(600, 400, i-40, i-40, HALF_PI+PI/40, PI+HALF_PI-PI/40);   //red
  fill(#1240AB, 100);
  arc(600, 400, i-80, i-80, HALF_PI+PI/40, PI+HALF_PI-PI/40);   //red
  //

  fill(#FF0000, 20);
  arc(600, 400, i, i, -HALF_PI+PI/40, HALF_PI-PI/40);      // OUTER blue
  fill(#FF4540, 30);
  arc(600, 400, i-40, i-40, -HALF_PI+PI/40, HALF_PI-PI/40);      //blue
  fill(#FF7373, 100);
  arc(600, 400, i-80, i-80, -HALF_PI+PI/40, HALF_PI-PI/40);      // INNER blue

  i = i - 120;
  smooth();
  fill(255);
  noStroke();
  arc(600, 400, i, i, 0, TWO_PI);
}

Date daytoDate(float day) {
  Date d1 = new Date(112, 9, 22, 0, 0, 0);
  Date d2 = new Date(112, 9, 22, 23, 59, 59);
  Date d = new Date((long) ((day)*(d2.getTime()- d1.getTime())+d1.getTime()));
  return d;
}

void mouseMoved() {
  c_in.checkClick(mouseX, mouseY, int(day));
}
