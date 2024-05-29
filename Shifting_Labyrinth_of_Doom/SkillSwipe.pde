class SkillSwipe extends Skill{
  private int[][] Range;
  private int Dmg;
  private int Cooldown;
  private int MaxCooldown;
  public int sizeOfSidebar = 400;
  public int sizePerSquare = 50;
  public SkillSwipe(){
    Range = new int[][]{
      {0,0,0,0,0,0,0,0,0}, // range center is person location you can change and try
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,1,1,1,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
    };
    Dmg = 1;
    Cooldown = 0;
    MaxCooldown = 10;
  }
  
  int getCooldown(){
    return Cooldown;
  }
  int getMaxCooldown(){
    return MaxCooldown;
  }
  int getDmg(){
    return Dmg;
  }
  
  void cooldown(){
    if(Cooldown == 0){
    }else{
      Cooldown--;
    }
  }
  
  void useSkill(BattleMap map, int a, int b, String direction){ // didnt finish as map wasnt done
  
  }
  
  void displayRange(int a, int b, String direction){  // a and b is x-cord y-cord of array beginning with 1
    stroke(0,0,0);
      for(int rowRange = 0; rowRange < Range.length; rowRange++){
        for(int colRange = 0; colRange < Range[rowRange].length; colRange++){
          if(Range[rowRange][colRange] == 1){
            int squareAtY= 0;
            int squareAtX= 0;
            if(direction.equals("up")){
              squareAtY= a - (Range.length/2 - rowRange);
              squareAtX= b - (Range[rowRange].length/2 - colRange);
            }
            if(direction.equals("down")){
              squareAtY= a + (Range.length/2 - rowRange);
              squareAtX= b - (Range[rowRange].length/2 - colRange);
            }
            if(direction.equals("right")){
              squareAtX= a + (Range.length/2 - rowRange);
              squareAtY= b - (Range[rowRange].length/2 - colRange);
            }
            if(direction.equals("left")){
              squareAtX= a - (Range.length/2 - rowRange);
              squareAtY= b - (Range[rowRange].length/2 - colRange);
            }
            if(squareAtX<0||squareAtX>15||squareAtY<0||squareAtY>15){
            }else{
                fill(185, 110, 251);
                square(sizeOfSidebar+squareAtY*sizePerSquare,squareAtX*sizePerSquare,sizePerSquare);
                noFill();
            }
          }
        }
      }
      noStroke();
  };
  
}
