    /**
     * Simple Flood Fill 2
     * 2017-07-07 Processing 3.3.5
     * Click any pixel to highlight similar nearby pixels. Press any key to reset.
     * forum.processing.org/two/discussion/18902/magic-wand-flood-fill-question
     **/
    import java.util.Queue;
    import java.util.ArrayDeque;
    Queue<PVector> queue = new ArrayDeque<PVector>();
    
    PImage img;
    void setup() {
      size(600, 600);
      fill(255, 0, 0);
      img = loadImage ("693px-Sunflower_sky_backdrop.jpg");
      // img = loadImage ("https://" + "upload.wikimedia.org/wikipedia/commons/thumb/4/40/Sunflower_sky_backdrop.jpg/693px-Sunflower_sky_backdrop.jpg");
      image(img, 0, 0);
    }
    
    void draw() {
    }
    
    void mouseClicked() {
      floodFill(mouseX, mouseY, get(mouseX, mouseY), 96);
    }
    
    void keyPressed() {
      image(img, 0, 0);
    }
    
    void floodFill(int xSeed, int ySeed, color c_selected, int sensitivity) {
      boolean[][] flooded  = new boolean[width][height];
      queue.clear();
      queue.add(new PVector(xSeed, ySeed));
    
      while (!queue.isEmpty()) {
        PVector point = queue.remove();
        int x = (int)point.x;
        int y = (int)point.y;
    
        // skip point that is out of bounds
        if (x >= 0 && x < width && y >= 0 && y < height) {
          // skip point that was previously flooded
          if (flooded[x][y]) {
            continue;
          }
          // skip and mark point that is out of color range
          if ( colorDist(get(x, y), c_selected) > sensitivity) {
            flooded[x][y] = true;
            continue;
          }
          set(x, y, color(255, 0, 0));
          flooded[x][y] = true;
          // queue flooding in four directions
          queue.add(new PVector(x - 1, y));
          queue.add(new PVector(x + 1, y));
          queue.add(new PVector(x, y - 1));
          queue.add(new PVector(x, y + 1));
        }
      }
    }
    
    float colorDist(color c1, color c2) {
      return dist(red(c1), green(c1), blue(c1), red(c2), green(c2), blue(c2));
    }