class PlayerCharacter{
  private int HP;
  private Skill[] Skills;
  private ArrayList<Skill> UnlockedSkills;
  private int Movement;
  
  public PlayerCharacter(){
    HP = 0;
    Skills = {SkillA,SkillB,SkillC};
    UnlockedSkills = new ArrayList<Skill>;
    UnlockedSkills.add(SkillA);
    UnlockedSkills.add(SkillB);
    UnlockedSkills.add(SkillC);
    movement = 0;
  }
  public void useSKill(Skill choice){
  }
  public void addSkill(Skill choice){
  }
  public void gainSkill(Skill choice){
  }
  public void clearSkill(Skill choice){
  }
  public void cooldown(){
  }
  public void hpChange(int extent){
  }
  public void displayMovement(BattleMap map){
  }
  public void movement(BattleMap map){
  }
}
