class Cell 
{
	private int value;
	private int valueDepth;

	public Cell(int valueDepth) 
	{
		value = 0;
		this.valueDepth = valueDepth;
	}

	int getValue()
	{
		return value;
	}

	void setValue(int newValue)
	{
		this.value = newValue;
	}

	void render(int x, int y, int size)
	{
		noStroke();

		if (value == 0)
		{
			fill(0);
		}
		else
		{    
			int fillValue = value * 255 / valueDepth;
			fillValue = (fillValue * -1) + 255;
			fill(fillValue);
		}

		rect(x, y, size, size);
	}
}
