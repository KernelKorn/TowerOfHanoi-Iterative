import java.util.Arrays;
import java.util.Scanner;

public class TowersOfHanoi
{
	public static void main(String[] args)
	{
		Scanner input = new Scanner(System.in);

		System.out.print("Please input number of rings: ");
		int numRings = input.nextInt();

		int[][] pegs = new int[3][numRings];
		int[] pegA = new int[3];
		int[] pegB = new int[3];
		int numMoves = 0;
		int cyclemove = 0;		

		for (int i = 0; i < numRings; i++)
		{
			pegs[0][i] = i + 1;
			pegs[1][i] = 99;
			pegs[2][i] = 99;
		}

		if (numRings % 2 != 0)
		{
			pegA[0] = 0;
			pegA[1] = 0;
			pegA[2] = 1;
			
			pegB[0] = 2;
			pegB[1] = 1;
			pegB[2] = 2;
		}
		else
		{
			pegA[0] = 0;
			pegA[1] = 0;
			pegA[2] = 1;
			
			pegB[0] = 1;
			pegB[1] = 2;
			pegB[2] = 2;
		}

		long startTime = System.currentTimeMillis();
		
		while (pegs[0][0] != pegs[1][0])
		{
			numMoves++;
			cyclemove = ((numMoves - 1) % 3);			
			if ( pegs[ pegA [ cyclemove ] ][0] < pegs[ pegB[ cyclemove ] ][0])
			{
				pegs[ pegB[ cyclemove ] ][ (numRings - 1) ] = pegs[ pegA[ cyclemove ] ][0];
				pegs[ pegA[ cyclemove ] ][ 0 ] = 99;
				System.out.printf("Moving ring %d from peg %d to peg %d\n",
						pegs[ pegB [ cyclemove ] ][ (numRings - 1) ], pegA[cyclemove], pegB[cyclemove]);
			}
			else
			{
				pegs[ pegA[ cyclemove ] ][ (numRings - 1) ] = pegs[ pegB[ cyclemove ] ][ 0 ];
				pegs[ pegB[ cyclemove ] ][ 0 ] = 99;
				System.out.printf("Moving ring %d from peg %d to peg %d\n",
						pegs[ pegA[ cyclemove ] ][ (numRings - 1)], pegB[ cyclemove ], pegA[ cyclemove]);
			}			
			Arrays.sort(pegs[ pegA[ cyclemove ] ]);
			Arrays.sort(pegs[ pegB[ cyclemove ] ]);
			
		}// end while
		long endTime = System.currentTimeMillis();
        long totalTime = endTime - startTime;
        
        System.out.printf("Took approximately %d ms to solve Towers of Hanoi with %d rings\n", totalTime, numRings );
        System.out.printf("Number of moves: %d\n",numMoves);
	}// end main
}// end class TowersOfHanoi
