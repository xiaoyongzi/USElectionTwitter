class Connection {
  String source;
  String target;
  float source_x, source_y, target_x, target_y;
  String source_type = "both";
  String target_type = "both";
  int weight;
  int day_index;
  float linethick;
  float linealpha;
  Date start_time, end_time;
  String belong;

  Connection(String source, String target, int weight, Date start_time, Date end_time, int day_index, String belong) {
    this.source = source;
    this.target = target;
    this.weight = weight;
    this.start_time = start_time;
    this.end_time = end_time;
    this.day_index = day_index;
    this.belong = belong;
  }

  void draw(Date time, Circles c_out, InCircles c_in) {
    if (weight>0 && weight<30) {
      linealpha = map(weight, 0, 30, 150, 180);
      linethick = map(weight, 0, 30, 0.5, 0.6);
    }
    else {
      linealpha = map(weight, 30, 80, 220, 255);
      linethick = map(weight, 30, 80, 1.3, 1.8);
    }

    float f = (float)(time.getTime()-start_time.getTime())/ (float)(end_time.getTime()-start_time.getTime());
    //println(f);
    float p1 = 0;
    float p2 = 0.7;
    float p3 = 1.0;
    float p4 = 1.5;
    float alpha = 255;
    if (f>p4 || f<p1) {
      return;
    }
    else if (f>=p1 && f<p2) {
      alpha = (f-p1)/(p2-p1)*linealpha;
      //noStroke();
    }
    else if (f>=p2 && f<p3) {
      alpha = linealpha;
    }
    else {
      alpha = (p4-f)/(p4-p3)*linealpha;
    } 
    //println(source_y);
    // stroke(0, 0,alpha/6);
    //strokeWeight(linethick);
    get_pos(c_out, c_in);
    String c = source_type+target_type;
    if (c.contains("obama")&&c.contains("romney")) {
      stroke(255, 125, 255, alpha/6);
    }
    else if (c.contains("obama")) {
      stroke(0, 0, 255, alpha/6);
    }
    else if (c.contains("romney")) {
      stroke(255, 0, 0, alpha/6);
    }
    else {
      stroke(125, 125, 125, alpha/6);
    }
    strokeWeight(linethick);
    noFill();
    //line(source_x, source_y, target_x, target_y);

    // line(source_x, source_y, target_x, target_y);
    float t = 0.3;
    if (source_x!=-1 && source_y!=-1 && target_x!=-1 && target_y!=-1) {
      if ((!(c.contains("both")))) {
        if (source_type.equals(target_type)) {
          //from obama to romney
          bezier(source_x, source_y, (t)*(width/2)+(1-t)*source_x, (t)*(height/2)+(1-t)*source_y, (t)*(width/2)+(1-t)*target_x, (t)*(height/2)+(1-t)*target_y, target_x, target_y);
        }
        else {
          //from obama to obama or from romney to romney
          bezier(source_x, source_y, (source_x+600)/2, (source_y+400)/2, (source_x+600)/2, (source_y+400)/2, target_x, target_y);
        }
      }
      else {
        if ((!c.contains("obama"))&&(!c.contains("romney"))) {
          //from inner circle to inner circle
          bezier(source_x, source_y, (source_x+600)/2, (source_y+400)/2, (source_x+600)/2, (source_y+400)/2, target_x, target_y);
        }
        else {
          //from outer circle to inner circle
          bezier(source_x, source_y, (t)*(width/2)+(1-t)*source_x, (t)*(height/2)+(1-t)*source_y, (t)*(width/2)+(1-t)*target_x, (t)*(height/2)+(1-t)*target_y, target_x, target_y);
        }
      }
    }
  }

  void get_pos(Circles c_out, InCircles c_in) {
    //get source position
    PVector v_o = c_out.pos(source, day_index, belong);
    PVector v_i = c_in.pos(source, day_index, belong);

    if (v_o.x<0) {
      source_x = v_i.x;
      source_y = v_i.y;
    }
    else {
      source_x = v_o.x;
      source_y = v_o.y;
      source_type = belong;
    }

    v_o = c_out.pos(target, day_index, belong);
    v_i = c_in.pos(target, day_index, belong);

    if (v_o.x<0) {
      target_x = v_i.x;
      target_y = v_i.y;
    } 
    else {
      target_x = v_o.x;
      target_y = v_o.y;
      target_type = belong;
    }
  }
}

