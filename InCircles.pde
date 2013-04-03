class InCircles {
  ArrayList iCircles;
  InnerCircle c;
  Word word;
  PVector pVector;

  InCircles() {
    iCircles = new ArrayList();

    for (int i=1; i<=17; i++)
    {
      iCircles.add(new InnerCircle(i));
    }
  }


  //  PVector pos( String s, int day_index) {
  //    return new PVector(width/2, height/2);
  //  }

  PVector pos(String keyword, int day_index, String belong) {
    InnerCircle c = (InnerCircle)iCircles.get(day_index-1);
    return c.pos(keyword, belong);
  }

  void draw(int d)
  {
    //    for (int i=0; i<iCircles.size(); i++) {
    if (d>=17)
      d = 16;
    InnerCircle c = (InnerCircle)iCircles.get(d);
    c.draw();
    //    }
  }

  void checkClick(float pX, float pY, int day_index)
  {
    InnerCircle c = (InnerCircle)iCircles.get(day_index-1);
    c.checkClick(pX, pY);
  }
}

