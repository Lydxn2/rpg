boolean isRectIntersect(float x1, float y1, float w1, float h1,
                       float x2, float y2, float w2, float h2) {
  return min(x1 + w1, x2 + w2) >= max(x1, x2) && min(y1 + h1, y2 + h2) >= max(y1, y2);
}
