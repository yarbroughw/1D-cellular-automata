int scale = 2;
int valueDepth = 2;
int[] neighborhood = { 1 };
int ruleNumber = 30;
boolean randomStart = false;

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
}

void draw()
{
	grid.drawGrid(scale);
	automator.calculateRow();
  
	if(automator.getRow() > grid.getRows())
	{
		grid.clearGrid();
		ruleNumber++;
		ruleSet = new RuleSet(ruleNumber, valueDepth);
		automator = new Automator(neighborhood, ruleSet, grid, randomStart);
	}
}

