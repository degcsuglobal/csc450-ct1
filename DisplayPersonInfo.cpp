#include <iostream>
using namespace std;

int main(int argc, char **argv) {
	
	char firstName[] = "John";
	char lastName[] = "Smith";
	char address[] = "123 Outtamy Way";
	char city[] = "Walla Walla, WA";
	int zip = 90210;
	
	// Print this out 
	cout << "DIRECTORY INFO:" << endl;
	cout << firstName << " " << lastName << endl;
	cout << address << endl;
	cout << city << " " << zip;
	
	return 0;
}
