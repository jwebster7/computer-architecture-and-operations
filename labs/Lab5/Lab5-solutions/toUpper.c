//
// toUpper - function to convert character to upper-case
//
char toUpper(char x)
{
	char y = x;

	if ((x>='a')&&(x<='z'))
		y = x + 'A'-'a';

	return(y);
}
