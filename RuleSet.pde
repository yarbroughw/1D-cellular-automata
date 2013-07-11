class RuleSet
{
	private IntList ruleValues;
	private int valueDepth;
	
	public RuleSet(long ruleNum, int valueDepth)
	{
		this.valueDepth = valueDepth;
		ruleValues = new IntList();
		
		// transforms ruleNum from decimal to base N,
		// where N = valueDepth, and files digits into
		// ruleValues in ascending order of significance. 
		
		long divisor = ruleNum;
		while(divisor != 0)
		{
			int newDigit = (int)(divisor % valueDepth);
			ruleValues.append(newDigit);
			divisor = (divisor - newDigit) / valueDepth;
		}
		
	}
	
	public int getValue(int index)
	{
		if (index >= ruleValues.size()) 
		return 0;
                  
		return ruleValues.get(index);
	}
	
	public int getValueDepth()
	{
		return valueDepth;
	}
}
