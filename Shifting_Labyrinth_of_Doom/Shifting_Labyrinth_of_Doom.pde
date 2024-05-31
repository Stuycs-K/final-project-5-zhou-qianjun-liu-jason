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
      textSize(20);
      text(returnPhaseString(phase), 5, 420); 
      phaseStart = false;
    }
  }
  textSize(100);
  text(phase, 10, 70);
  if(phase == 5){
    phase = 0;
  }
  //textSize(20);
  //String a = returnPhaseString(phase);
  //if(phaseAt != phase){
  //    fill(color(0, 0, 0));
  //    test2.display();
  //    text(a, 0, 420); 
  //    noFill();
  //    a= "";
  //    test2.displayCombat();
  //  phaseAt = phase;
  //}
} 

void mouseClicked(){
  x = (mouseX-sizeOfSidebar)/sizePerSquare;
  y = (mouseY)/sizePerSquare;
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
  test2.getEnemy()[0].movement(test2);
  test2.getEnemy()[1].movement(test2);
  test2.getEnemy()[2].movement(test2);
  test2.getEnemy()[3].movement(test2);
  //test2.display();
}

void keyPressed(){
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
      phase = 5;
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
  //if(phase == 4){
  //  return "Enemies turn.";
  //}
  return "";
}
