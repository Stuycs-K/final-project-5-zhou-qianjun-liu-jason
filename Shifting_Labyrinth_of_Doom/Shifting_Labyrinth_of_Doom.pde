public int sizeOfSidebar = 400;
public int sizePerSquare = 50;
int x;
int y;
int drawx;
int drawy;
PlayerCharacter newPerson = new PlayerCharacter();
Skill test = new SkillTest();
int phase = -1;
boolean phaseStart = true;
int selection;
int count;
int prevX = 0;
int prevY = 0;
BattleMap test2;
int floor = 4;
PImage Death;
int diff = 5;

void setup(){
  PImage Cobblestone = loadImage("Cobblestone.png");
  PImage Andesite = loadImage("Andesite.png");
  PImage CrackedStoneBricks = loadImage("Cracked Stone Bricks.png");
  PImage Gravel = loadImage("Gravel.png");
  PImage Stone = loadImage("Stone.png");
  PImage DeadFireCoral = loadImage("Dead Fire Coral.png");
  PImage DeadTubeCoral = loadImage("Dead Tube Coral.png");
  PImage Creeper = loadImage("Creeper.png");
  PImage Zombie = loadImage("Zombie.png");
  PImage Skeleton = loadImage("Skeleton.png");
  PImage DarkPrismarine = loadImage("Dark Prismarine.png");
  PImage OxidizedCopper = loadImage("Oxidized Copper.png");
  PImage OxidizedCutCopper = loadImage("Oxidized Cut Copper.png");
  PImage PrimarineBrick = loadImage("Prismarine Brick.png");
  PImage SeaLantern = loadImage("Sea Lantern.png");
  PImage StrippedWarpedStem = loadImage("Stripped Warped Stem.png");
  PImage TubeCoral = loadImage("Tube Coral.png");
  PImage ElderGuardian = loadImage("ElderGuardian.png");
  PImage Drowned = loadImage("Drowned.png");
  PImage Guardian = loadImage("Guardian.png");
  PImage ChisledPolishedBlackstone = loadImage("Chisled Polished Blackstone.png");
  PImage Basalt = loadImage("Basalt.png");
  PImage Basalt2 = loadImage("Basalt2.png");
  PImage SmoothBasalt = loadImage("Smooth Basalt.png");
  PImage ChisledNetherBricks = loadImage("Chisled Nether Bricks.png");
  PImage NetherBricks = loadImage("Nether Bricks.png");
  PImage PolishedBlackstone = loadImage("Polished Blackstone.png");
  PImage PiglinBrute = loadImage("PiglinBruteFace.png");
  PImage WitherSkeleton = loadImage("WitherSkeletonFace.png");
  PImage Blaze = loadImage("BlazeFace.png");
  PImage Beacon = loadImage("Beacon.png");
  PImage PC = loadImage("TechnoBlade.png");
  PImage Obsidian = loadImage("Obsidian.png");
  PImage Portal = loadImage("Portal.png");
  Death = loadImage("Death.png");
  PImage[] textures = new PImage[]{ 
    Cobblestone, Cobblestone, Andesite, Andesite, Andesite, CrackedStoneBricks, Gravel, Gravel, Stone, Stone, Stone, DeadFireCoral, DeadTubeCoral, Creeper, Zombie, Skeleton,
    DarkPrismarine, DarkPrismarine, OxidizedCopper, OxidizedCopper, OxidizedCopper, TubeCoral, SeaLantern, SeaLantern, PrimarineBrick, PrimarineBrick, PrimarineBrick, StrippedWarpedStem, OxidizedCutCopper, ElderGuardian, Drowned, Guardian,
    Basalt2, Basalt2, NetherBricks, NetherBricks, NetherBricks, ChisledPolishedBlackstone, Basalt, Basalt, SmoothBasalt, SmoothBasalt, SmoothBasalt, ChisledNetherBricks, PolishedBlackstone, PiglinBrute, WitherSkeleton, Blaze,
    Beacon, PC, Obsidian, Portal
  };
  test2 = new BattleMap(newPerson, textures);
  size(1201,800);
  test2.generateFloor();
  test2.generateRoom(test2.CurrentMapType() + "l",floor, diff);
  test2.display();
  //test2.combatEncounter(1);
  test2.displayCombat(floor);
}

void draw(){
  if(floor == 4){
    phase = -10;
    fill(255,255,255);
    rect(0, 0, 1201, 800);
    noFill();
    fill(0, 0, 0);
    textSize(20);
    String end = "You. You. You are alive. \n and sometimes the player believed the universe had spoken to it through the sunlight that came through the shuffling leaves of the summer trees \n and sometimes the player believed the universe had spoken to it through the light that fell from the crisp night sky of winter, where a fleck of light in the corner of the player's eye might be a star a million times as massive as the sun, boiling its planets to plasma in order to be visible for a moment to the player, walking home at the far side of the universe, suddenly smelling food, almost at the familiar door, about to dream again \n and sometimes the player believed the universe had spoken to it through the zeros and ones, through the electricity of the world, through the scrolling words on a screen at the end of a dream \n And the game was over and the player woke up from the dream. And the player began a new dream. And the player dreamed again, dreamed better. And the player was the universe. And the player was love. \n You are the player. \n Wake up.";
    text(end, 0, 20);
    noFill();
  }
  if(test2.CurrentMapType().equals("ex") && test2.leaveFloor()){
    floor++;
    diff += 3;
    test2.generateFloor();
    test2.generateRoom(test2.CurrentMapType() + "l",floor, diff);
    test2.display();
    test2.displayCombat(floor);
  }
  if(phase == 0 && test2.CurrentMapType().equals("tr")){
    test2.generateRoom(test2.getNextRoom(),floor, diff);
    phaseStart = false;
    phase = 0;
    
    test2.display();
    test2.displayCombat(floor);
    phaseStart = true;
    textSize(20);
    text(returnPhaseString(phase), 5, 420); 
  }
  if(test2.allEnemyDead() && test2.CurrentMapType().equals("co")){
    test2.generateRoom(test2.getNextRoom(),floor, diff);
    phase = 0;
    test2.display();
    test2.displayCombat(floor);
    textSize(20);
    text(returnPhaseString(phase), 5, 420); 
  }
  if(test2.enterenceExitArrive()){
    test2.generateRoom(test2.getNextRoom(),floor, diff);
    phase = 0;
    test2.display();
    test2.displayCombat(floor);
    textSize(20);
    text(returnPhaseString(phase), 5, 420); 
  }
  if(test2.enounterRoomLeave()){
    test2.generateRoom(test2.getNextRoom(),floor, diff);
    phase = 0;
    test2.display();
    test2.displayCombat(floor);
    textSize(20);
    text(returnPhaseString(phase), 5, 420); 
  }
  if(!test2.CurrentMapType().equals("co") && !test2.CurrentMapType().equals("tr")){
    phase = 0;
    textSize(20);
    text(returnPhaseString(phase), 5, 420); 
  }
  if(test2.CurrentMapType().equals("tr")){
    phase = -1;
    textSize(20);
    text(returnPhaseString(phase), 5, 420); 
  }
  if(test2.CurrentMapType().equals("en")){
    test2.getEnemy().get(0).useSkill(test2);
  }
  //textSize(200);
  //fill(255,255,255);
  //text(test2.getNextRoom(), 420, 69);
  //noFill();
  if(newPerson.getHP()<=0){
    phase = -200;
    image(Death,0,0);
  }
  textSize(20);
  Skill[] SkillHave = newPerson.getSkills();
  for(int i = 0; i < SkillHave.length; i++){
    if(SkillHave[i] != null){
      fill(0,0,0);
      text(SkillHave[i].getName(), 5, 600 + i * (20));
      noFill();
    }
  }
  if(phase == -1){
    ArrayList<Skill> possibleSkill = newPerson.getSkillArray();
    if(phaseStart){
      count = 3;
      prevX = 0;
      prevY = 0;
      newPerson.clearSkill();
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      for(int i = 0; i < possibleSkill.size(); i++){
        text(possibleSkill.get(i).getName(), 5, 420 + i * (20));
      }
      phaseStart = false;
    }
    
    if((prevX != drawx || prevY != drawy) && count > 0){
      if(drawy > 400 && drawy < 400 + (possibleSkill.size() * 20)){
        newPerson.addSkill(possibleSkill.get((drawy - 400) / 20));
        count--;
        prevX = drawx;
        prevY = drawy;
      }
    }
    if(count <= 0){
      phaseStart = true;
      //text(count,5,700);
      phase = 0;
    }
  }
  if(phase == 0){
    if(phaseStart){
      test2.display();
      newPerson.displayMovement(test2);
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
      phaseStart = false;
    }
  }
  //textSize(100);
  //fill(255,255,255);
  //text(phase, 10, 70);
  //noFill();
  
} 

void mouseClicked(){
  x = (mouseX-sizeOfSidebar)/sizePerSquare;
  y = (mouseY)/sizePerSquare;
  drawx = mouseX;
  drawy = mouseY;
  if(phase == 0){
    if(newPerson.movement(test2, x, y)){
      phase = 1;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
      phaseStart = true;
    }
  }
}

void keyPressed(){
  if(phase == 5){
    for(int i = 0; i < test2.getEnemy().size(); i++){
      test2.getEnemy().get(i).useSkill(test2);
    }
    if(key == ENTER){
      phase=0;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(phase == 4){
    for(int i = 0; i < test2.getEnemy().size(); i++){
      test2.getEnemy().get(i).movement(test2);
    }
    if(key == ENTER){
      phase=5;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(phase == 1){
    if(keyCode == UP){
      newPerson.setOrientation("up");
      phase = 2;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == DOWN){
      newPerson.setOrientation("down");
      phase = 2;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == LEFT){
      newPerson.setOrientation("left");
      phase = 2;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == RIGHT){
      newPerson.setOrientation("right");
      phase = 2;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(phase == 2){
    if(key == 'a'){
      //phase = 3;
      selection = 0;
      phase = 3;
      test2.display();
      newPerson.displaySkill(test2,newPerson.getSkill(0));
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(key == 'b'){
      //phase = 3;
      selection = 1;
      phase = 3;
      test2.display();
      newPerson.displaySkill(test2,newPerson.getSkill(1));
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(key == 'c'){
      //phase = 3;
      selection = 2;
      phase = 3;
      test2.display();
      newPerson.displaySkill(test2,newPerson.getSkill(2));
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == ENTER){
      phase = 4;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(key == 'x'){
      phase = 1;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(phase == 3){
    if(key == 'x'){
      test2.display();
      test2.displayCombat(floor);
      phase = 2;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == ENTER){
      newPerson.useSkill(test2,newPerson.getSkill(selection));
      phase = 4;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(key == 'p'){
      phase++;
      test2.display();
      test2.displayCombat(floor);
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
  }
}

String returnPhaseString(int phase){
  if(phase == 0){
    return "Movement Phase: Click where you would like \nto go.";
  }
  if(phase == 1){
    return "Direction Phase: Which direction do you want \nyour skill to go. (use arrow keys)";
  }
  if(phase == 2){
    return "Skill Phase: Choose which skill you want \n(A, B, C). Or click enter to skip. Or click x to go \nback to Direction Phase.";
  }
  if(phase == 3){
    return "Comfirmation Phase: Click enter to continue. \nOr click x to go back to Skill Phase.";
  }
  if(phase == 4){
    return "Enemies Movement Phase: Click enter to \ncontinue.";
  }
  if(phase == 5){
    return "Enemies Attack Phase: Click enter to \ncontinue.";
  }
  return "";
}
