class Grid
{
	private Cell[][] grid;
	int columns, rows;
	int valueDepth;
 
	public Grid(int columns, int rows, int valueDepth)
	{
		grid = new Cell[columns][rows];
		this.columns = columns;
		this.rows = rows;
		this.valueDepth = valueDepth;
	
		for (int i = 0; i < columns; i++) 
		{
			for (int j = 0; j < rows; j++) 
			{
				// Initialize each cell
				grid[i][j] = new Cell(valueDepth);
			}
		}
	}
  
	public Cell getCell(int i, int j)
	{
		i = (i + columns) % columns;
		j = (j + rows) % rows;
		return grid[i][j];
	}
	
	public int getColumns()
	{
		return columns;
	}
  
	public int getRows()
	{
		return rows;
	}
  
	public void drawGrid(int scale)
	{
		for(int j = 0; j < rows; j++)
		{
			for(int i = 0; i < columns; i++)
			{
				Cell currentCell = getCell(i,j);
				currentCell.render(i*scale, j*scale, scale);
			}
		}
	}

	public void clearGrid()
	{
		for(int j = 0; j < rows; j++)
		{
			for(int i = 0; i < columns; i++)
			{
				getCell(i,j).setValue(0);
			}
		}
	}
}
