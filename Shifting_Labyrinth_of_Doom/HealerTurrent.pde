class HealerTurrent extends Enemy{
  private int HP = 1;
  private Skill Skills;
  private int Movement = 0;
  private int number;
  public HealerTurrent(int num){
    number = num;
    Skills = new HealingStab();
  }
  
  int getHP(){
    return HP;
  }
  
  String getName(){
    return "HealerTurrent";
  }
  
  void useSkill(BattleMap map){
    int x = 0;
    int y = 0;
    boolean found = false;
    for(int i = 0; i < map.getCombat().length; i++){
      for(int k = 0; k < map.getCombat()[i].length; k++){
        if(map.getCombat()[i][k] != null && map.getCombat()[i][k].equals("EC" + number)){
          y = i;
          x = k;
          found = true;
          break;
        }
      }
      if(found == true){
          break;
      }
    }
    if(y != 16 && map.getCombat()[y + 1][x] != null && map.getCombat()[y + 1][x].equals("PC")){
      Skills.useSkill(map, x, y, "right");
      HP = 0;
    }
    if(y != 0 && map.getCombat()[y - 1][x] != null && map.getCombat()[y - 1][x].equals("PC")){
      Skills.useSkill(map, x, y, "right");
      HP = 0;
    }
    if(x != 16 && map.getCombat()[y][x + 1] != null && map.getCombat()[y][x + 1].equals("PC")){
      Skills.useSkill(map, x, y, "right");
      HP = 0;
    }
    if(x != 0 && map.getCombat()[y][x - 1] != null && map.getCombat()[y][x - 1].equals("PC")){
      Skills.useSkill(map, x, y, "right");
      HP = 0;
    }
  }
  void hpChange(int Extent){
    HP = HP - Extent;
  }
  void movement(BattleMap map){
    map.enemySwap(number,Movement,1);
  }
}
