class Automator
{
	private int row;
	
	private int[] neighborhood;
	private RuleSet ruleSet;
	private Grid grid;
	
	public Automator(int[] neighborhood, RuleSet ruleSet, Grid grid, boolean randomStart)
	{
		this.neighborhood = neighborhood;
		this.ruleSet = ruleSet;
		this.grid = grid;
		
                if (randomStart)
                {
      		         for(int i = 0; i < neighborhood.length; i++)
      		         {
      			         randomizeRow(i);
      		         }
                }
                else
                {
                         for(int i = 0; i < neighborhood.length; i++)
                         {
                                 middleCellOn(i);
                         }
                }
		
		// sets row pointer to first after randomized rows
		row = neighborhood.length;
	}
	
	public void calculateRow()
	{
		if(row <= grid.getRows())
		{
			for(int x = 0; x < grid.getColumns(); x++)
			{
				evaluateCell(x,grid);
			}
		}
		
		row++;
	}
	
	void evaluateCell(int x, Grid grid)
	{
		// transform neighborhood values into single integer
		int neighborhoodValue = neighborhoodToInt(x);
		// use this number as an index value to retrieve value from ruleset
		int ruleValue = ruleSet.getValue(neighborhoodValue);
		// set the current cell to this new value
		grid.getCell(x,row).setValue(ruleValue);
	}
	
	int neighborhoodToInt(int x)
	{
		int neighborhoodValue = 0;
		int iterations = 0;
		
		for (int t = 0; t < neighborhood.length; t++)
		{
			int currentRadius = neighborhood[t];
						
			for(int i = 0; i <= currentRadius*2; i++)
			{
				// gets value of cell currently pointed to
				int unscaledCellValue = grid.getCell(x + currentRadius - i, row-(t+1)).getValue();
				// scales value of cell by placement in neighborhood and by value depth,
				// treating it as a digit with a significance determined by "iterations"
				
				int scaledCellValue = unscaledCellValue * (int) pow( (float) ruleSet.getValueDepth(), (float) iterations);

				// add this scaled cell value to the total value of the neighborhood
				neighborhoodValue += scaledCellValue;
				// increment iterations variable, so that scaling reflects shift in neighborhood
				iterations++;
			}
		}
		
		return neighborhoodValue;
	}

	private void randomizeRow(int row)
	{
		for(int x = 0; x < grid.getColumns(); x++)
		{
			Cell currentCell = grid.getCell(x,row);
			int randomValue = (int) random(ruleSet.getValueDepth());
			currentCell.setValue(randomValue);
		}
	}

        private void middleCellOn(int row)
        {
          int columns = grid.getColumns();
          int halfway = (columns - (columns % 2)) / 2;
          grid.getCell(halfway, row).setValue(ruleSet.valueDepth);
        }

        public int getRow()
        {
                return row;
        }
        
        public long getRandomRuleNum()
        {
                           
                 return (long)random(getTotalNumberOfRules() - 1);
        }

        public long getTotalNumberOfRules()
        {
                 int neighborhoodSize = 0;
                 
                 for(int i = 0; i < neighborhood.length; i++)
                 {
                         neighborhoodSize = neighborhoodSize + ( 2*neighborhood[i] ) + 1;
                 }
                 
                 return (long)pow(ruleSet.getValueDepth(),pow(ruleSet.getValueDepth(),neighborhoodSize));

        }
}




