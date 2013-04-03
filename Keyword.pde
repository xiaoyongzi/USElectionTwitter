class Keyword {
  String keyword_text;
  float keyword_weight;
  float x, y;
  float keyword_size;

  boolean exist_next = false;
  boolean exist_priv = false;
  float angle;
  float angle_priv;
  String type;
  PFont ptext;

  Keyword(String keyword_text, String type, float keyword_weight) {
    this.keyword_text = keyword_text.replace("\"", "");
    this.type = type;
    this.keyword_weight = keyword_weight;
  }

  void draw(float r, float time,PFont font) {
    colorMode(RGB);
    x = width/2 + r*sin(radians(angle));
    y = height/2 + r*cos(radians(angle));
    float temp_r = r;
    //ptext = loadFont("GillSans-Light-30.vlw");
    //textFont(ptext);

    float alpha = 255;
    float angle_temp = 0;

    float p1=0;
    float p2=0.6;
    float p3=1;
    float p4=2;
    if (time<p1 || time>p4) {
      return;
    }
    else if (time>=p1 && time<p2) {
      if (exist_priv) {
        angle_temp = (time/(p2-p1))*(angle-angle_priv)+angle_priv;
      }
      else {
        alpha = (time-p1)/(p2-p1)*255;
        if (type.contains("obama")) {
          angle_temp = (time/(p2-p1))*(angle+180)-180;
        }
        else {
          angle_temp = (time/(p2-p1))*(angle-180)+180;
        }
      }
    }
    else if (time>=p2 && time<p3) {
      angle_temp = angle;
    }
    else {
      angle_temp = (p4-time)/(p4-p3)*(angle-0);
      if (!exist_next) {
        temp_r = (time-p3)/(p4-p3)*(800-r)+r;
        alpha = (p4-time)/(p4-p3)*255;
      }
      else {
        alpha = 0;
      }
    }
    x = width/2 + temp_r*sin(radians(angle_temp));
    y = height/2 - temp_r*cos(radians(angle_temp));
    noStroke();
    fill(0, alpha);
    ellipse(x, y, 2, 2);

    pushMatrix();
    translate(x, y);
    textFont(font, keyword_size);
    if(type.contains("romney")){
      noStroke();
      fill(255,0,0,alpha);
      rotate(radians(angle_temp-90));
    }else{
      noStroke();  
      fill(0,0,255,alpha);
      translate(+textWidth(keyword_text)*sin(radians(angle_temp)),-textWidth(keyword_text)*cos(radians(angle_temp)));
      rotate(radians(angle_temp-90));
      scale(-1,-1);
    }
    keyword_size = map(keyword_weight, 1, 220, 10, 20);
    textSize(keyword_size);
    textAlign(LEFT);
    text(keyword_text, 0, 0);
    popMatrix();
  }
}

