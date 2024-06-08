
class PlayerCharacter{
  private int HP;
  private Skill[] Skills;
  private ArrayList<Skill> UnlockedSkills;
  private int Movement;
  private int numSkill = 0;
  private String direction;
  
  public PlayerCharacter(){
    HP = 40;
    Skill A = new Forcefeild();
    Skill B = new Swipe();
    Skill C = new Sniper();
    Skills = new Skill[] {A, B, C};
    UnlockedSkills = new ArrayList<Skill> ();
    UnlockedSkills.add(A);
    UnlockedSkills.add(B);
    UnlockedSkills.add(C);
    UnlockedSkills.add(new Fireball());
    UnlockedSkills.add(new Hammer());
    UnlockedSkills.add(new Piercer());
    numSkill = 3;
    Movement = 3;
    direction = "down";
  }
  
  int getHP(){
    return HP;
  }
  
  public void displaySkill(BattleMap map, Skill choice){
    int x = 0;
    int y = 0;
    boolean found = false;
    for(int i = 0; i < map.getCombat().length; i++){
      for(int k = 0; k < map.getCombat()[i].length; k++){
        if(map.getCombat()[i][k] != null && map.getCombat()[i][k].equals("PC")){
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
    choice.displayRange(x,y,direction);
  }
  public void useSkill(BattleMap map, Skill choice){
    int x = 0;
    int y = 0;
    boolean found = false;
    for(int i = 0; i < map.getCombat().length; i++){
      for(int k = 0; k < map.getCombat()[i].length; k++){
        if(map.getCombat()[i][k] != null && map.getCombat()[i][k].equals("PC")){
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
    choice.useSkill(map,x,y,direction);
  }
  
  public Skill[] getSkills(){
    return Skills;
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
  public ArrayList<Skill> getSkillArray(){
    return UnlockedSkills;
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
  
  public boolean movement(BattleMap map, int x, int y){
    boolean a = map.swap(x, y);
    return a;
  }
  public void setOrientation(String face){
    direction = face;
  }
}
