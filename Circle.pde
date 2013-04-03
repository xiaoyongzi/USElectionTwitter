class Circle {

  ArrayList obama_keywords;
  ArrayList romney_keywords;
  Date start_time;
  Date end_time;
  boolean real;


  Circle() {
    obama_keywords = new ArrayList();
    romney_keywords = new ArrayList();
    real = false;
  }

  Circle(String filename, Date start_time, Date end_time) {
    obama_keywords = new ArrayList();
    romney_keywords = new ArrayList();
    this.start_time = start_time;
    this.end_time = end_time;
    real = true;

    String s[] = loadStrings(filename);
    for (int i=0; i<s.length; i++) {
      String cell[] = split(s[i], ",");
      if (cell.length<8) {
        continue;
      }
      if (cell[7].contains("obama")) {
        //println("obama");
        obama_keywords.add(new Keyword(cell[1], cell[7], int(cell[2])));
      }
      else if (cell[7].contains("romney")) {
        romney_keywords.add(new Keyword(cell[1], cell[7], int(cell[3])));
      }
    }
  }

  void draw(Date date, float r, PFont font) {
    if (real) {
      float f = (float)(date.getTime()-start_time.getTime())/(float)(end_time.getTime()-start_time.getTime());
      //println(f);
      //println(obama_keywords.size());
      //set_pos(r);
      for (int i=0; i< obama_keywords.size(); i++) {
        Keyword kw = (Keyword)obama_keywords.get(i);
        kw.draw(r, f, font);
      }
      for (int i=0; i< romney_keywords.size(); i++) {
        Keyword kw = (Keyword)romney_keywords.get(i);
        kw.draw(r, f, font);
      }
    }
  }

  void set_pos(float r) {
    int size_obama = obama_keywords.size();
    int size_romney = romney_keywords.size();
    float angle_diff_obama = 180/(size_obama+1);
    for (int i=0; i<size_obama; i++) {
      Keyword kw = (Keyword)obama_keywords.get(i);
      kw.angle = -(i+1)*angle_diff_obama;
    }

    float angle_diff_romney = 180/(size_romney+1);
    for (int i=0; i<size_romney; i++) {
      Keyword kw = (Keyword)romney_keywords.get(i);
      kw.angle = (i+1)*angle_diff_romney;
    }
  }

  PVector pos(String keyword, String belong) {
    String k = keyword.replace("\"", "");
    if (belong.equals("obama")) {
      for (int i=0; i<obama_keywords.size();i++) {
        Keyword kw = (Keyword)obama_keywords.get(i);
        if (k.equals(kw.keyword_text)) {
          return (new PVector(kw.x, kw.y));
        }
      }
    }
    else {
      for (int i=0; i<romney_keywords.size();i++) {
        Keyword kw = (Keyword)romney_keywords.get(i);
        if (k.equals(kw.keyword_text)) {
          return (new PVector(kw.x, kw.y));
        }
      }
    }
    return (new PVector(-1, -1));
  }
}

