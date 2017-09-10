//// functions only -- two versions
//// adapted from hg.postspectacular.com/toxiclibs/src/tip/src.core/toxi/geom/Polygon2D.java
//// via https://forum.processing.org/one/topic/mouse-within-a-certain-area.html
boolean containsPoint(FloatList xs, FloatList ys, float px, float py){
  int num = xs.size();
  int j = num - 1;
  boolean isInside = false;
  for (int i = 0; i < num; i++) {
    PVector vi = new PVector(xs.get(i),ys.get(i));
    PVector vj = new PVector(xs.get(j),ys.get(j));
    if (vi.y < py && vj.y >= py || vj.y < py && vi.y >= py) {
      if (vi.x + (py - vi.y) / (vj.y - vi.y) * (vj.x - vi.x) < px) {
        isInside = !isInside;
      }
    }
    j = i;
  }
  println(isInside, "contains", px, py);
  return isInside;
}
boolean containsPoint(PVector[] verts, float px, float py) {
  int num = verts.length;
  int j = num - 1;
  boolean isInside = false;
  for (int i = 0; i < num; i++) {
    PVector vi = verts[i];
    PVector vj = verts[j];
    if (vi.y < py && vj.y >= py || vj.y < py && vi.y >= py) {
      if (vi.x + (py - vi.y) / (vj.y - vi.y) * (vj.x - vi.x) < px) {
        isInside = !isInside;
      }
    }
    j = i;
  }
  println(isInside, "contains", px, py);
  return isInside;
}