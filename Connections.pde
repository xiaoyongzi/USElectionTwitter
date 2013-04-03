class Connections {
  ArrayList connections;
  Circles c_out;
  InCircles c_in;

  Connections(Circles c_out, InCircles c_in) {
    connections = new ArrayList();
    this.c_out = c_out;
    this.c_in = c_in;
    //    open_file("netw_1.csv", new Date(112, 9, 23, 0, 0, 0), new Date(112, 9, 23, 23, 59, 59), 1);
    //    open_file("netw_2.csv", new Date(112, 9, 24, 0, 0, 0), new Date(112, 9, 24, 23, 59, 59), 2);
    //    open_file("netw_3.csv", new Date(112, 9, 25, 0, 0, 0), new Date(112, 9, 25, 23, 59, 59), 3);
    //    open_file("netw_4.csv", new Date(112, 9, 26, 0, 0, 0), new Date(112, 9, 26, 23, 59, 59), 4);
    //    open_file("netw_5.csv", new Date(112, 9, 27, 0, 0, 0), new Date(112, 9, 27, 23, 59, 59), 5);
    //    open_file("netw_6.csv", new Date(112, 9, 28, 0, 0, 0), new Date(112, 9, 28, 23, 59, 59), 6);
    //    open_file("netw_7.csv", new Date(112, 9, 29, 0, 0, 0), new Date(112, 9, 29, 23, 59, 59), 7);
    //    open_file("netw_8.csv", new Date(112, 9, 30, 0, 0, 0), new Date(112, 9, 30, 23, 59, 59), 8);
    //    open_file("netw_9.csv", new Date(112, 9, 31, 0, 0, 0), new Date(112, 9, 31, 23, 59, 59), 9);
    //    open_file("netw_10.csv", new Date(112, 10, 1, 0, 0, 0), new Date(112, 10, 1, 23, 59, 59), 10);
    //    open_file("netw_11.csv", new Date(112, 10, 2, 0, 0, 0), new Date(112, 10, 2, 23, 59, 59), 11);
    //    open_file("netw_12.csv", new Date(112, 10, 3, 0, 0, 0), new Date(112, 10, 3, 23, 59, 59), 12);
    //    open_file("netw_13.csv", new Date(112, 10, 4, 0, 0, 0), new Date(112, 10, 4, 23, 59, 59), 13);
    //    open_file("netw_14.csv", new Date(112, 10, 5, 0, 0, 0), new Date(112, 10, 5, 23, 59, 59), 14);
    //    open_file("netw_15.csv", new Date(112, 10, 6, 0, 0, 0), new Date(112, 10, 6, 23, 59, 59), 15);
    //    open_file("netw_16.csv", new Date(112, 10, 7, 0, 0, 0), new Date(112, 10, 7, 23, 59, 59), 16);
    //    open_file("netw_17.csv", new Date(112, 10, 8, 0, 0, 0), new Date(112, 10, 8, 23, 59, 59), 17);
    open_file("netw_obama_1.csv", new Date(112, 9, 23, 0, 0, 0), new Date(112, 9, 23, 23, 59, 59), 1, "obama");
    open_file("netw_obama_2.csv", new Date(112, 9, 24, 0, 0, 0), new Date(112, 9, 24, 23, 59, 59), 2, "obama");
    open_file("netw_obama_3.csv", new Date(112, 9, 25, 0, 0, 0), new Date(112, 9, 25, 23, 59, 59), 3, "obama");
    open_file("netw_obama_4.csv", new Date(112, 9, 26, 0, 0, 0), new Date(112, 9, 26, 23, 59, 59), 4, "obama");
    open_file("netw_obama_5.csv", new Date(112, 9, 27, 0, 0, 0), new Date(112, 9, 27, 23, 59, 59), 5, "obama");
    open_file("netw_obama_6.csv", new Date(112, 9, 28, 0, 0, 0), new Date(112, 9, 28, 23, 59, 59), 6, "obama");
    open_file("netw_obama_7.csv", new Date(112, 9, 29, 0, 0, 0), new Date(112, 9, 29, 23, 59, 59), 7, "obama");
    open_file("netw_obama_8.csv", new Date(112, 9, 30, 0, 0, 0), new Date(112, 9, 30, 23, 59, 59), 8, "obama");
    open_file("netw_obama_9.csv", new Date(112, 9, 31, 0, 0, 0), new Date(112, 9, 31, 23, 59, 59), 9, "obama");
    open_file("netw_obama_10.csv", new Date(112, 10, 1, 0, 0, 0), new Date(112, 10, 1, 23, 59, 59), 10, "obama");
    open_file("netw_obama_11.csv", new Date(112, 10, 2, 0, 0, 0), new Date(112, 10, 2, 23, 59, 59), 11, "obama");
    open_file("netw_obama_12.csv", new Date(112, 10, 3, 0, 0, 0), new Date(112, 10, 3, 23, 59, 59), 12, "obama");
    open_file("netw_obama_13.csv", new Date(112, 10, 4, 0, 0, 0), new Date(112, 10, 4, 23, 59, 59), 13, "obama");
    open_file("netw_obama_14.csv", new Date(112, 10, 5, 0, 0, 0), new Date(112, 10, 5, 23, 59, 59), 14, "obama");
    open_file("netw_obama_15.csv", new Date(112, 10, 6, 0, 0, 0), new Date(112, 10, 6, 23, 59, 59), 15, "obama");
    open_file("netw_obama_16.csv", new Date(112, 10, 7, 0, 0, 0), new Date(112, 10, 7, 23, 59, 59), 16, "obama");
    open_file("netw_obama_17.csv", new Date(112, 10, 8, 0, 0, 0), new Date(112, 10, 8, 23, 59, 59), 17, "obama");
    open_file("netw_romney_1.csv", new Date(112, 9, 23, 0, 0, 0), new Date(112, 9, 23, 23, 59, 59), 1, "romney");
    open_file("netw_romney_2.csv", new Date(112, 9, 24, 0, 0, 0), new Date(112, 9, 24, 23, 59, 59), 2, "romney");
    open_file("netw_romney_3.csv", new Date(112, 9, 25, 0, 0, 0), new Date(112, 9, 25, 23, 59, 59), 3, "romney");
    open_file("netw_romney_4.csv", new Date(112, 9, 26, 0, 0, 0), new Date(112, 9, 26, 23, 59, 59), 4, "romney");
    open_file("netw_romney_5.csv", new Date(112, 9, 27, 0, 0, 0), new Date(112, 9, 27, 23, 59, 59), 5, "romney");
    open_file("netw_romney_6.csv", new Date(112, 9, 28, 0, 0, 0), new Date(112, 9, 28, 23, 59, 59), 6, "romney");
    open_file("netw_romney_7.csv", new Date(112, 9, 29, 0, 0, 0), new Date(112, 9, 29, 23, 59, 59), 7, "romney");
    open_file("netw_romney_8.csv", new Date(112, 9, 30, 0, 0, 0), new Date(112, 9, 30, 23, 59, 59), 8, "romney");
    open_file("netw_romney_9.csv", new Date(112, 9, 31, 0, 0, 0), new Date(112, 9, 31, 23, 59, 59), 9, "romney");
    open_file("netw_romney_10.csv", new Date(112, 10, 1, 0, 0, 0), new Date(112, 10, 1, 23, 59, 59), 10, "romney");
    open_file("netw_romney_11.csv", new Date(112, 10, 2, 0, 0, 0), new Date(112, 10, 2, 23, 59, 59), 11, "romney");
    open_file("netw_romney_12.csv", new Date(112, 10, 3, 0, 0, 0), new Date(112, 10, 3, 23, 59, 59), 12, "romney");
    open_file("netw_romney_13.csv", new Date(112, 10, 4, 0, 0, 0), new Date(112, 10, 4, 23, 59, 59), 13, "romney");
    open_file("netw_romney_14.csv", new Date(112, 10, 5, 0, 0, 0), new Date(112, 10, 5, 23, 59, 59), 14, "romney");
    open_file("netw_romney_15.csv", new Date(112, 10, 6, 0, 0, 0), new Date(112, 10, 6, 23, 59, 59), 15, "romney");
    open_file("netw_romney_16.csv", new Date(112, 10, 7, 0, 0, 0), new Date(112, 10, 7, 23, 59, 59), 16, "romney");
    open_file("netw_romney_17.csv", new Date(112, 10, 8, 0, 0, 0), new Date(112, 10, 8, 23, 59, 59), 17, "romney");
  }

  void draw(Date time) {
    for (int i=0; i<connections.size(); i++) {
      Connection c = (Connection)connections.get(i);
      c.draw(time, c_out, c_in);
    }
  }

  void open_file(String filename, Date start_time, Date end_time, int day_index, String belong) {
    String s[] = loadStrings(filename);
    for (int i=0;i<s.length;i++) {
      String cell[] = split(s[i], ",");
      if (!cell[3].contains("weight")) {

        connections.add(new Connection(cell[1], cell[2], Integer.parseInt(cell[3]), start_time, end_time, day_index, belong));
      }
    }
  }
}

