
 __inline int getSum(int a, int b)
{
	 int sum;
	__asm{
				ADD sum,a,b
	  }
	 return sum;
}

// z = x +y
 int z;
int main(void)
{
	int x, y;
	 x = 20;
	 y = 30; 
	while(1)
	{
		z=  getSum(x,y);
	}
}

