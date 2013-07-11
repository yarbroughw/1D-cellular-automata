int scale = 5;
int valueDepth = 3;
int[] neighborhood = { 1 };
long ruleNumber = 110;
boolean randomStart = true;

boolean saveAutomaton = false;

RuleSet ruleSet;
Grid grid;
Automator automator;

void setup()
{
	background(0,0,255);
  
	size(800, 800);

	ruleSet = new RuleSet(ruleNumber, valueDepth);

	grid = new Grid(width/scale, height/scale, valueDepth);

	automator = new Automator(neighborhood, ruleSet, grid, randomStart);

        println("Total number of rules: " + automator.getTotalNumberOfRules());
}

void draw()
{
	grid.drawGrid(scale);
	automator.calculateRow();
  
	if(automator.getRow() > grid.getRows())
	{
                if(saveAutomaton)
                {
                  
                  String neighborhoodString = "";
                  
                  for(int i = 0; i < neighborhood.length; i++)
                  {
                            neighborhoodString += neighborhood[i];
                  }
                  
                  String path = "/Users/willemyarbrough/Pictures/Photos/art/1Dautomata/";
                  
                  path += randomStart ? "randomstart/" : "basicstart/";
                  
                  String filename = "D" + valueDepth + "N" + neighborhoodString + "-R" + ruleNumber + ".jpg" + "-S" + scale;
                  
                  save(path + filename + ".jpg");
                  println("Saved " + filename + "!");
                  
                  saveAutomaton = false;
                }
  
		grid.clearGrid();
		ruleNumber = automator.getRandomRuleNum();
                println(ruleNumber);
		ruleSet = new RuleSet(ruleNumber, valueDepth);
		automator = new Automator(neighborhood, ruleSet, grid, randomStart);
	}
}

void keyPressed()
{
  if (keyCode == 's' || keyCode == 'S')
  {
    saveAutomaton = true;
  }
}

