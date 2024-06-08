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

void setup(){
  PImage Cobblestone = loadImage("Cobblestone.png");
  PImage Andesite = loadImage("Andesite.png");
  PImage CrackedStoneBricks = loadImage("Cracked Stone Bricks.png");
  PImage Gravel = loadImage("Gravel.png");
  PImage Stone = loadImage("Stone.png");
  PImage DeadFireCoral = loadImage("Dead Fire Coral.png");
  PImage DeadTubeCoral = loadImage("Dead Tube Coral.png");
  PImage[] textures = new PImage[]{ Cobblestone, Andesite, CrackedStoneBricks, Gravel, Stone, DeadFireCoral, DeadTubeCoral };
  test2 = new BattleMap(newPerson, textures);
  size(1201,800);
  test2.generateFloor();
  test2.generateRoom(test2.CurrentMapType() + "l");
  test2.display();
  //test2.combatEncounter(1);
  test2.displayCombat();
}

void draw(){
  if(test2.allEnemyDead() && test2.CurrentMapType().equals("co")){
    test2.generateRoom(test2.getNextRoom());
    phase = 0;
    test2.display();
    test2.displayCombat();
  }
  //textSize(200);
  //fill(255,255,255);
  //text(test2.getNextRoom(), 420, 69);
  //noFill();
  if(newPerson.getHP()<=0){
    textSize(400);
    fill(0,0,0);
    text("lose", 600,400);
    noFill();
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
      test2.displayCombat();
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
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
      phaseStart = false;
    }
  }
  textSize(100);
  fill(255,255,255);
  text(phase, 10, 70);
  noFill();
  
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
      test2.displayCombat();
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
      test2.displayCombat();
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
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(phase == 1){
    if(keyCode == UP){
      newPerson.setOrientation("up");
      phase = 2;
      test2.display();
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == DOWN){
      newPerson.setOrientation("down");
      phase = 2;
      test2.display();
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == LEFT){
      newPerson.setOrientation("left");
      phase = 2;
      test2.display();
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == RIGHT){
      newPerson.setOrientation("right");
      phase = 2;
      test2.display();
      test2.displayCombat();
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
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(key == 'b'){
      //phase = 3;
      selection = 1;
      phase = 3;
      test2.display();
      newPerson.displaySkill(test2,newPerson.getSkill(1));
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(key == 'c'){
      //phase = 3;
      selection = 2;
      phase = 3;
      test2.display();
      newPerson.displaySkill(test2,newPerson.getSkill(2));
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == ENTER){
      phase = 4;
      test2.display();
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(key == 'x'){
      phase = 1;
      test2.display();
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(phase == 3){
    if(key == 'x'){
      test2.display();
      test2.displayCombat();
      phase = 2;
      test2.display();
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
    if(keyCode == ENTER){
      newPerson.useSkill(test2,newPerson.getSkill(selection));
      phase = 4;
      test2.display();
      test2.displayCombat();
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
    }
  }
  if(key == 'p'){
      phase++;
      test2.display();
      test2.displayCombat();
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
