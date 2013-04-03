class Circles {
  ArrayList circles;
  float r;


  Circles(float r) {
    circles = new ArrayList();
    this.r = r;

    circles.add(new Circle());
    circles.add(new Circle("words_1.csv", new Date(112, 9, 23, 0, 0, 0), new Date(112, 9, 23, 23, 59, 59)));
    circles.add(new Circle("words_2.csv", new Date(112, 9, 24, 0, 0, 0), new Date(112, 9, 24, 23, 59, 59)));
    circles.add(new Circle("words_3.csv", new Date(112, 9, 25, 0, 0, 0), new Date(112, 9, 25, 23, 59, 59)));
    circles.add(new Circle("words_4.csv", new Date(112, 9, 26, 0, 0, 0), new Date(112, 9, 26, 23, 59, 59)));
    circles.add(new Circle("words_5.csv", new Date(112, 9, 27, 0, 0, 0), new Date(112, 9, 27, 23, 59, 59)));
    circles.add(new Circle("words_6.csv", new Date(112, 9, 28, 0, 0, 0), new Date(112, 9, 28, 23, 59, 59)));
    circles.add(new Circle("words_7.csv", new Date(112, 9, 29, 0, 0, 0), new Date(112, 9, 29, 23, 59, 59)));
    circles.add(new Circle("words_8.csv", new Date(112, 9, 30, 0, 0, 0), new Date(112, 9, 30, 23, 59, 59)));
    circles.add(new Circle("words_9.csv", new Date(112, 9, 31, 0, 0, 0), new Date(112, 9, 31, 23, 59, 59)));
    circles.add(new Circle("words_10.csv", new Date(112, 10, 1, 0, 0, 0), new Date(112, 10, 1, 23, 59, 59)));
    circles.add(new Circle("words_11.csv", new Date(112, 10, 2, 0, 0, 0), new Date(112, 10, 2, 23, 59, 59)));
    circles.add(new Circle("words_12.csv", new Date(112, 10, 3, 0, 0, 0), new Date(112, 10, 3, 23, 59, 59)));
    circles.add(new Circle("words_13.csv", new Date(112, 10, 4, 0, 0, 0), new Date(112, 10, 4, 23, 59, 59)));
    circles.add(new Circle("words_14.csv", new Date(112, 10, 5, 0, 0, 0), new Date(112, 10, 5, 23, 59, 59)));
    circles.add(new Circle("words_15.csv", new Date(112, 10, 6, 0, 0, 0), new Date(112, 10, 6, 23, 59, 59)));
    circles.add(new Circle("words_16.csv", new Date(112, 10, 7, 0, 0, 0), new Date(112, 10, 7, 23, 59, 59)));
    circles.add(new Circle("words_17.csv", new Date(112, 10, 8, 0, 0, 0), new Date(112, 10, 8, 23, 59, 59)));
    circles.add(new Circle());

    for (int i=1; i<circles.size()-1; i++) {
      Circle c = (Circle)circles.get(i);
      c.set_pos(r);

      //find whether a Keywords exists in privious circle and next circle
      //To read, skip the following part af first.
      Circle b = (Circle)circles.get(i-1);
      Circle d = (Circle)circles.get(i+1);

      //for Obama's keywords
      for (int j=0; j<c.obama_keywords.size();j++) {
        Keyword kw = (Keyword) c.obama_keywords.get(j); 

        for (int k=0;k<d.obama_keywords.size();k++) {
          Keyword kw2 = (Keyword) d.obama_keywords.get(k);
          if (kw.keyword_text.equalsIgnoreCase(kw2.keyword_text)) {
            kw.exist_next = true; 
            break;
          }
        }
        for (int k=0;k<b.obama_keywords.size();k++) {
          Keyword kw2 = (Keyword) b.obama_keywords.get(k);
          if (kw.keyword_text.equalsIgnoreCase(kw2.keyword_text)) {
            kw.exist_priv = true;
            kw.angle_priv = kw2.angle;

            break;
          }
        }
      }

      //for Romney's keyword
      for (int j=0; j<c.romney_keywords.size();j++) {
        Keyword kw = (Keyword) c.romney_keywords.get(j); 

        for (int k=0;k<d.romney_keywords.size();k++) {
          Keyword kw2 = (Keyword) d.romney_keywords.get(k);
          if (kw.keyword_text.equalsIgnoreCase(kw2.keyword_text)) {
            kw.exist_next = true; 
            break;
          }
        }
        for (int k=0;k<b.romney_keywords.size();k++) {
          Keyword kw2 = (Keyword) b.romney_keywords.get(k);
          if (kw.keyword_text.equalsIgnoreCase(kw2.keyword_text)) {
            kw.exist_priv = true;
            kw.angle_priv = kw2.angle;

            break;
          }
        }
      }
    }
  }

  PVector pos(String keyword, int day_index, String belong) {
    Circle c = (Circle)circles.get(day_index);
    return c.pos(keyword, belong);
  }

  void draw(Date date, PFont font) {
    for (int i=0; i<circles.size(); i++) {
      Circle c = (Circle)circles.get(i);
      c.draw(date, r, font);
    }
  }
}

