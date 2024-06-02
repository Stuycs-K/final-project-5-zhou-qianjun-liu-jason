abstract class Enemy{
  private int HP;
  private Skill Skills;
  private int Movement;
  abstract String get();
  abstract void useSkill(BattleMap map);
  abstract void hpChange(int Extent);
  abstract void movement(BattleMap map);
}
