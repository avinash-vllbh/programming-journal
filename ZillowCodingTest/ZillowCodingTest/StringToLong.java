import java.util.Scanner;
import java.util.InputMismatchException;
public class StringToLong {
	/**
	 * Converts a string to long
	 * Limitation => Routine expects string to be a valid number
	 * Throws NumberFormatException if any character ASCII value is not a number equivalent  
	 * @param s
	 * @return
	 * @throws NumberFormatException
	 */
	long stringToLong(String s) throws NumberFormatException{
		long l = 0l;
		long factor = 1;
		int i = s.length()-1;
		int j = 0;
		boolean isNegative = false;
		// Determine if the number is negative
		if( s.charAt(0) == '-' ) {
			isNegative = true;
			j = 1;
		}
		// Traverse string from right to left
		while(i >= j){
			char c = s.charAt(i);
			// Throws number format exception if ASCII value of character is not in between 0 - 9
			if(c < 48 || c > 57 ){
				throw new NumberFormatException("Given string " + s +" cannot be converted to a valid number");
			}
			int k = c-48;
			l = (factor*k) + l;
			factor = factor * 10; // 10th power increases from right to left 
			i--;
		}
		if(isNegative){
			l = -l;
		}
		return l;
	}

	/**
	 * Test method as given in coding test pdf
	 * Returns either Success or Failure based on comparison inside if loop
	 * 
	 */
	void test() {
		// To catch the NumberFormatException thrown by stringToLong
		try {
			long i = stringToLong("123");
			if(i==123){
				System.out.println("Success");
			} else {
				System.out.println("Failure");
			}
		} 
		catch (NumberFormatException e) {
			System.out.println(e);
		}
	}

	/**
	 * Main method to play with different types of String inputs1
	 * 
	 * @param args
	 */
	public static void main(String[] args){
		StringToLong z = new StringToLong();
		z.test();
		int option = 1;
		while(option <= 1){
			System.out.println("Choose any one option");
			System.out.println("1 - Test new string, 2 - exit");
			try {
				Scanner in = new Scanner(System.in);
				option = in.nextInt();
				if(option == 1){
					System.out.println("Enter a string to be converted to long");
					String input = in.next();
					try {
						System.out.print("coverted string to long number is - ");
						System.out.println(z.stringToLong(input));
					} 
					catch(NumberFormatException e) {
						System.err.println(e.getMessage());
					}
				} else {
					System.out.println("Exiting the application...");
					// Do nothing - Exit the application
				}
			}
			catch(InputMismatchException e){
				System.err.println("InputMismatchExcption: Enter a valid integer as option");
			}
		}
	}
}
