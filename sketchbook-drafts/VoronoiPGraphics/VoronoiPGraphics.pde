import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;
 
ToxiclibsSupport gfx;
Voronoi v;
PGraphics pg;
 
void setup() {
  size( 500, 500 );
  pg = createGraphics(width, height);
  gfx = new ToxiclibsSupport( this, pg );
  drawVoronoi(gfx, pg);
}
 
void drawVoronoi(ToxiclibsSupport gfx, PGraphics pg) {
  pg.beginDraw();
  v = new Voronoi();
  for ( int i = 0; i < 150; i++ ) {
    v.addPoint( new Vec2D( random(width), random(height) ) );
  }
 
  for (int i = 0; i < v.getRegions().size(); i++) {
    Polygon2D p = v.getRegions().get(i);
    pg.fill(random(255));
    gfx.polygon2D(p);
  }
  pg.endDraw();
}
 
void draw() {
  background(pg);
  image(pg, mouseX, mouseY, 200, 200);
}
 
void mousePressed() {
  drawVoronoi(gfx, pg);
}