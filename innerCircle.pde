class InnerCircle 
{
  java.util.List oWords;
  java.util.List rWords;
  java.util.List oPVector;
  java.util.List rPVector;
  int wSize = 10;
  float t = 0.0;
  float pX = 0.0;
  float pY = 0.0;

  int oClick;
  int rClick;

  InnerCircle(int day_index)
  {
    oWords = new ArrayList();
    rWords = new ArrayList();
    oPVector = new ArrayList();
    rPVector = new ArrayList();

    oClick = 11;
    rClick = 11;

    int num = 0;
    String fileName = "words_"+ day_index + ".csv";
    String innerWords[] = loadStrings(fileName);

    for (int i=0; i<innerWords.length; i++)
    {
      String cell[] = split(innerWords[i], ",");
      String term;
      if (cell[7].contains("both"))
      {
        term = cell[1].replace("\"", "");
        oWords.add(new Word(term, new Float(cell[2])));
        rWords.add(new Word(term, new Float(cell[3])));
      }
    }
    java.util.Collections.sort( oWords);
    java.util.Collections.sort( rWords);
    //    println("oWords "+oWords.size());
    for (int i = 0; i < wSize; i++) {
      t = i / float(wSize);
      pX = curvePoint(100, 540, 540, 100, t);
      pY = curvePoint(100, 250, 650, 1200, t);
      oPVector.add(new PVector(pX, pY));
    }

    for (int i = 0; i < wSize; i++) {
      t = i / float(wSize);
      pX = curvePoint(900, 640, 640, 900, t);
      pY = curvePoint(100, 250, 650, 1200, t);
      rPVector.add(new PVector(pX, pY));
    }
  }

  void draw()
  {
    int fontSize = 0;
    Word word;
    for (int i = 0; i < wSize; i++) {
      t = i / float(wSize);
      pX = curvePoint(100, 540, 540, 100, t);
      pY = curvePoint(100, 250, 650, 1200, t);
      word = (Word)oWords.get(i);
      textAlign(RIGHT);
      fontSize = (int)map( word.weight, 100, 200, 20, 27 );
      if (oClick == i)
      {
        fill(#02BF39);
        textSize(fontSize*1.8);
      }
      else
      {
        fill(0, 0, 255);
        textSize(fontSize);
      }
      text( word.text, pX, pY);
    }

    for (int i = 0; i < wSize; i++) {
      t = i / float(wSize);
      pX = curvePoint(900, 640, 640, 900, t);
      pY = curvePoint(100, 250, 650, 1200, t);
      word = (Word)rWords.get(i);
      textAlign(LEFT);
      fontSize = (int)map( word.weight, 100, 200, 20, 27 );
      if (rClick == i)
      {
        fill(#02BF39);
        textSize(fontSize*1.8);
      }
      else
      {
        fill(255, 0, 0);
        textSize(fontSize);
      }
      text(word.text, pX, pY);
    }
  }

  PVector pos(String keyword, String belong) {
    Word word;
    String k;
    k = keyword.replace("\"", "");
    for (int i=0; i<wSize; i++)
    {

      word = (Word)oWords.get(i);
      if (belong.equals("obama")) {
        if (word.text.equals(k))
          return (PVector)oPVector.get(i);
      }
      else {
        word = (Word)rWords.get(i);
        if (word.text.equals(k))
          return (PVector)rPVector.get(i);
      }
    }
    return new PVector(-1, -1);
  }

  void checkClick(float pX, float pY)
  {
    PVector v;
    Word word;
    String clickedText1;
    String clickedText2;
    boolean on= false;
    for (int i=0; i<wSize; i++)
    {
      
      v = (PVector) oPVector.get(i);
      if (pX<v.x && pX>v.x-100 && pY<v.y && pY>v.y-10)
      {
        on = true;
        oClick = i;
        word = (Word)oWords.get(i);
        clickedText1 = word.text;
        //        println(clickedText1+" light");
        for (int j=0; j<wSize; j++)
        {
          
          word = (Word)rWords.get(j);
          clickedText2 = word.text;
//          println(clickedText2+" right");
          if (clickedText1.equals(clickedText2))
          {
            rClick = j;
            //            println(clickedText2+j);
            break;
          }
          else
            rClick = 11;
        }
        return;
      }

      v = (PVector) rPVector.get(i);
      if (pX<v.x+100 && pX>v.x && pY<v.y && pY>v.y-10)
      {  
        on = true;
        rClick = i;
        word = (Word)rWords.get(i);
        clickedText1 = word.text;
        for (int j=0; j<wSize; j++)
        {
          word = (Word)oWords.get(j);
          clickedText2 = word.text;
          if (clickedText1.equals(clickedText2))
          {
            oClick = j;
            break;
          }
          else
            oClick = 11;
        }
        return;
      }
      if(!on){
        rClick = 11;
        oClick = 11;
      }
    }
  }
}

