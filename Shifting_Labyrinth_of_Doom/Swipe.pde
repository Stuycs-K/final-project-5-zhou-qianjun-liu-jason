class Swipe extends Skill{
  private int[][] Range;
  private int Dmg;
  private int Cooldown;
  private int MaxCooldown;
  public int sizeOfSidebar = 400;
  public int sizePerSquare = 50;
  
  public Swipe(){
    Range = new int[][]{
      {0,0,0,0,0,0,0,0,0}, // range center is person location you can change and try
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,1,1,0,0,0,0},
      {0,0,0,0,0,1,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
    };
    Dmg = 12;
    Cooldown = 0;
    MaxCooldown = 10;
  }
  
  String getName(){
    return "Swipe";
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
    for(int rowRange = 0; rowRange < Range.length; rowRange++){
        for(int colRange = 0; colRange < Range[rowRange].length; colRange++){
          if(Range[rowRange][colRange] == 1){
            int c = 0;
            int d = 0;
            if(direction.equals("up")){
              c = a - (Range.length/2 - rowRange);
              d = b - (Range[rowRange].length/2 - colRange);
            }
            if(direction.equals("down")){
              c = a + (Range.length/2 - rowRange);
              d = b - (Range[rowRange].length/2 - colRange);
            }
            if(direction.equals("right")){
              c = a - (Range.length/2 - colRange);
              d = b + (Range[rowRange].length/2 - rowRange);
            }
            if(direction.equals("left")){
              c = a + (Range.length/2 - colRange);
              d = b - (Range[rowRange].length/2 - rowRange);
            }
            if(c<0||c>15||d<0||d>15){
            }else{
                if(map.getCombat()[d][c] != null && map.getCombat()[d][c].substring(0, 2).equals("EC")){
                  ArrayList<Enemy> enemies = map.getEnemy();
                  enemies.get(Integer.parseInt(map.getCombat()[d][c].substring(2))).hpChange(Dmg);
                }
            }
          }
        }
      }
  }
  
  void displayRange(int a, int b, String direction){  // a and b is x-cord y-cord of array beginning with 1
    stroke(0,0,0);
      for(int rowRange = 0; rowRange < Range.length; rowRange++){
        for(int colRange = 0; colRange < Range[rowRange].length; colRange++){
          if(Range[rowRange][colRange] == 1){
            int c = 0;
            int d = 0;
            if(direction.equals("up")){
              c = a - (Range.length/2 - rowRange);
              d = b - (Range[rowRange].length/2 - colRange);
            }
            if(direction.equals("down")){
              c = a + (Range.length/2 - rowRange);
              d = b - (Range[rowRange].length/2 - colRange);
            }
            if(direction.equals("right")){
              c = a - (Range.length/2 - colRange);
              d = b + (Range[rowRange].length/2 - rowRange);
            }
            if(direction.equals("left")){
              c = a + (Range.length/2 - colRange);
              d = b - (Range[rowRange].length/2 - rowRange);
            }
            if(c<0||c>15||d<0||d>15){
            }else{
                fill(124,252,0);
                square(400+d*50,c*50,50);
                noFill();
            }
          }
        }
      }
      noStroke();
  }
  
}
