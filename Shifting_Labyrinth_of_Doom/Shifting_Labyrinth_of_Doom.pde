public int sizeOfSidebar = 400;
public int sizePerSquare = 50;
int x;
int y;
BattleMap test2 = new BattleMap();
PlayerCharacter newPerson = new PlayerCharacter();
Skill test = new SkillTest();
int phase = 0;
boolean phaseStart = true;
int selection;
int phaseAt = 0;

void setup(){
  size(1201,800);
  test2.display();
  test2.displayCombat();
}

void draw(){
  if(phase == 0){
    if(phaseStart){
      test2.display();
      newPerson.displayMovement(test2);
      test2.displayCombat();
      phaseStart = false;
    }
  }
  textSize(100);
  text(phase, 10, 70);
  if(phase == 5){
    phase = 0;
  }
  textSize(20);
  String a = returnPhaseString(phase);
  if(phaseAt != phase){
      fill(color(0, 0, 0));
      test2.display();
      text(a, 0, 420); 
      noFill();
      a= "";
      test2.displayCombat();
    phaseAt = phase;
  }
} 

void mouseClicked(){
  x = (mouseX-sizeOfSidebar)/sizePerSquare;
  y = (mouseY)/sizePerSquare;
  if(phase == 0){
    if(newPerson.movement(test2, x, y)){
      
      phase = 1;
      phaseStart = true;
    }
  }
}

void keyPressed(){
  if(phase == 1){
    if(keyCode == UP){
      newPerson.setOrientation("up");
      phase = 2;
      test2.display();
      test2.displayCombat();
    }
    if(keyCode == DOWN){
      newPerson.setOrientation("down");
      phase = 2;
    }
    if(keyCode == LEFT){
      newPerson.setOrientation("left");
      phase = 2;
    }
    if(keyCode == RIGHT){
      newPerson.setOrientation("right");
      phase = 2;
    }
  }
  if(phase == 2){
    if(key == 'a'){
      phase = 3;
      newPerson.displaySkill(test2,newPerson.getSkill(0));
      test2.displayCombat();
      selection = 0;
      phase = 3;
    }
    if(key == 'b'){
      phase = 3;
      newPerson.displaySkill(test2,newPerson.getSkill(1));
      test2.displayCombat();
      selection = 1;
      phase = 3;
    }
    if(key == 'c'){
      phase = 3;
      newPerson.displaySkill(test2,newPerson.getSkill(2));
      test2.displayCombat();
      selection = 1;
      phase = 3;
    }
    if(keyCode == ENTER){
      phase = 5;
    }
    if(key == 'x'){
      phase = 1;
    }
  }
  if(phase == 3){
    if(key == 'x'){
      test2.display();
      test2.displayCombat();
      phase = 2;
    }
    if(keyCode == ENTER){
      newPerson.useSkill(test2,newPerson.getSkill(selection));
      phase = 4;
    }
  }
  if(key == 'p'){
      phase++;
  }
}

String returnPhaseString(int phase){
  if(phase == 0){
    return "Movement Phase: Click where you would like to go.";
  }
  if(phase == 1){
    return "Direction Phase: Which direction do you want your skill to go. (use arrow keys)";
  }
  if(phase == 2){
    return "Skill Phase: Choose which skill you want (A, B, C). Or click enter to skip. Or click x to go back to Direction Phase.";
  }
  if(phase == 3){
    return "Comfirmation Phase: Click enter to continue. Or click x to go back to Skill Phase.";
  }
  //if(phase == 4){
  //  return "Enemies turn.";
  //}
  return "";
}
