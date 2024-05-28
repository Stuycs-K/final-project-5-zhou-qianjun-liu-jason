class PlayerCharacter{
  private int HP;
  private Skill[] Skills;
  private ArrayList<Skill> UnlockedSkills;
  private int Movement;
  private int numSkill = 0;
  
  public PlayerCharacter(){
    HP = 0;
    Skill A = new SkillSwipe();
    Skill B = new SkillSwipe();
    Skill C = new SkillSwipe();
    Skills = new Skill[] {A, B, C};
    UnlockedSkills = new ArrayList<Skill> ();
    UnlockedSkills.add(A);
    UnlockedSkills.add(B);
    UnlockedSkills.add(C);
    numSkill = 3;
    Movement = 2;
  }
  public void useSkill(BattleMap map, Skill choice){
    int x = 0;
    int y = 0;
    boolean found = false;
    for(int i = 0; i < map.getCombat().length; i++){
      for(int k = 0; k < map.getCombat()[i].length; k++){
        if(map.getCombat()[i][k] != null && map.getCombat()[i][k].equals("PC")){
          x = i;
          y = k;
          found = true;
          break;
        }
      }
      if(found == true){
          break;
      }
    }
    choice.displayRange(x,y,"left");
  }
  public Skill getSkill(int choice){
    return Skills[choice];
  }
  public void addSkill(Skill choice){
    if(numSkill < 3){
      Skills[numSkill] = choice;
    }
    numSkill++;
  }
  public void gainSkill(Skill choice){
    UnlockedSkills.add(choice);
  }
  public void clearSkill(){
    Skills = new Skill[3];
    numSkill = 0;
  }
  public void cooldown(){
    for(int i = 0; i < Skills.length; i++){
      Skills[i].cooldown();
    }
  }
  public void hpChange(int extent){
    HP = HP - extent;
    if(HP < 0){
      HP = 0;
    }
  }
  public void displayMovement(BattleMap map){
    map.displayMovement(Movement);
  }
  
  public void movement(BattleMap map, int x, int y){
    map.swap(x, y);
  }
}
