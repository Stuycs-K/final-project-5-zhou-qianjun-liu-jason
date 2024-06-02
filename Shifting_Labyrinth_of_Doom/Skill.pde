abstract class Skill{
  private int[][] Range;
  private int Dmg;
  private int Cooldown;
  private int MaxCooldown;
  
  abstract String getName();
  abstract int getCooldown();
  abstract int getMaxCooldown();
  abstract int getDmg();
  abstract void cooldown();
  abstract void useSkill(BattleMap map, int a, int b, String direction);
  abstract void displayRange(int a, int b, String direction);
}
