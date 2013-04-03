class Timeline {
  float x;
  float y;
  float l;
  int n;
  float h;
  int c1;
  float w;
  int timeselect=1;
  int a=1;
  PFont timefont;
  int day1 = 22;
  String month1 = "Oct.";
  String month2 = "Oct.";
  int day2;
  int day3 = 22;
  int day4;
  int times;
  float [] oba= {47.1,47.2,47.0,47.0,46.9,46.8,46.8,47.9,47.4,47.4,47.4,47.4,47.9,48.8,48.4,48.8,48.8};
float [] rom= {48.0,47.8 , 47.9 , 47.9 , 47.9 , 47.7 , 47.6 , 47.1 , 47.4 , 47.3 , 47.3 , 47.2 , 47.4 , 48.1 , 48.1 , 48.1 , 48.1};

  Timeline(float _x, float _y, float _l, int _n, float _h) {
    x = _x;
    y = _y;
    l = _l;
    n = _n;
    h = _h;
    w = l/n;
    color c1 = color(200, 0, 0);
    //constrain(timeselect,1,16);
    timefont = createFont("futura",55);
    textFont(timefont,55);
  }

  void body() {
    // cp5 = new ControlP5(this);
    /* cp5.addButton("jianyi")
     .setValue(0)
     .setPosition(x-20,y+0.5*h)
     .setSize(10,10)
     ;
     
     cp5.addButton("jiayi")
     .setValue(0)
     .setPosition(x+n*w+20,y+0.5*h)
     .setSize(10,10)
     ;*/

    for (int i=0;i<n;i++) {
      stroke(255);
      strokeWeight(1);
      if (i+1>=timeselect && i+1<timeselect+a) {
        colorMode(HSB);
        //      fill(130,60+10*i,255);
        fill(#3B9DFC);
      }
      else {
        fill(220, 200);
      }
      rect(x+i*w, y, w, h);
    }
    stroke(100);
    line(x, y-10, x, y+h+10);
    line(x+n*w, y-10, x+n*w, y+h+10);
    line(x-4, y+4, x-4, y+h-4);
    line(x+n*w+4, y+4, x+n*w+4, y+h-4);
  }


  void keylong() {
    if (keyPressed == true) {
      if (key == '1') {
        a = 1;
        timeselect = round(timeselect/a)+1;
      }
      else if (key == '2') {
        a = 4;
        timeselect = round(timeselect/a)+1;
      }
      else if (key == '3') {
        a = 8;
        timeselect = round(timeselect/a)+1;
      }
      else if (key == '4') {
        a = 16;
        timeselect=1;
      }
    }
  }


  void select() {
    fill(200);
    noStroke();
    if (mouseY>y && mouseY < y+h && mouseX>x && mouseX<x+15*w) {
      timeselect = a*(round(round((mouseX-x)/w)/a))+1;
    }
    rect(x+(timeselect-1)*w, y-3, w*a, h+7);
  }




  void font() {
    textSize(12);
    textAlign(LEFT);

    day2 = day1 + timeselect;
    day4 = day3 + timeselect+a;

    if (day2>31) {
      day1 = -9;
      month1 = "Nov.";
    }
    else if (day2<1) {
      day1 = 22;
      month1 = "Oct.";
    }

    if (day4>31) {
      day3 = -9;
      month2 = "Nov.";
    }
    else if (day4<1) {
      day3 = 22;
      month2 = "Oct.";
    }

    String time1 = month1+" "+day2;
    String time2 = month2+" "+day4;

    //    fill(130, 200, 255);
    fill(#3B9DFC);
    text(time1, x+(timeselect-1)*w-5, y-10);
    textFont(timefont,55);
    textSize(55);
    text(time1, 980,80);
    if (a>1) {
      textSize(12);
      text(time2, x+(timeselect-2+a)*w, y-10);
    }
    textFont(timefont,40);
    text(oba[timeselect]+"%",60,500);
    text(rom[timeselect]+"%",1040,500);
    fill(160);
    textFont(timefont,14);
    text("Poll Rate",58,460);
    text("Poll Rate",1100,460);
    textFont(timefont,18);
    text("Date",1125,100);
  }

  int timeselect_return() {
//    if(a=1){
//      times=timeselect;
//    }else if(a=2){
//      times=17+timeselect;
//    }else if(a=3){
//      times=21+timeselect;
//    }else if(a=4){
//      times=23;
//    }
    return timeselect;
  }
}



