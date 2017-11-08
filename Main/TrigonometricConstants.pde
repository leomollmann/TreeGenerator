class TrigonometricConstants{
  
  private final int ringMax = 14, rotMax = 15, precision = 10000000;
  private final float rotStep = 0.2;
  
  private ArrayList<float[]> ringSine = new ArrayList<float[]>();
  private ArrayList<float[]> ringCosine = new ArrayList<float[]>();
  private float[] rotSine = new float[rotMax];
  private float[] rotCosine = new float[rotMax];
  
  TrigonometricConstants(){
    for(int i = 1; i <= ringMax; i++){
      int sides = i * 3;
      float step = (float)360/sides;
      float[] sine = new float[sides];
      float[] cosine = new float[sides];
      sine[0] = 0;
      cosine[0] = 1;
      for(int j = 1; j < sides; j++){
         sine[j] = round(sin(j * step) * precision);
         cosine[j] = round(cos(j * step) * precision);
         sine[j] /= precision;
         cosine[j] /= precision;
      }
    }
    
    for(int i = 1; i <= rotMax; i++){
      rotSine[i] = round(sin(i * rotStep) * precision);
      rotCosine[i] = round(cos(i * rotStep) * precision);
      rotSine[i] /= precision;
      rotCosine[i] /= precision;
    }
  }
  
  public float[] getRingSin(int sides){return ringSine.get(sides/3);}
  public float[] getRingCos(int sides){return ringCosine.get(sides/3);}
  public float getRotSin(int angle){return rotSine[angle];}
  public float getRotCos(int angle){return rotSine[angle];}
}