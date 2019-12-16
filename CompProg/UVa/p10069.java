import java.util.*;
import java.math.*;

public class Main
{
	static int n;
	static BigInteger f[][] = new BigInteger[2][102];
	static String seq, sub;

	static BigInteger add(BigInteger a,BigInteger b){
		if (a==null) return b;
		if (b==null) return a;
		return a.add(b);
	}

	static void doit()
	{
		int seqlen = seq.length();
		int sublen = sub.length();
		f[0][0] = BigInteger.ONE;
		for (int i = 1; i <= sublen;i++) f[0][i] = null;
		int cur = 1, prev = 0;

		for (int i = 1; i <= seqlen; i++){

			f[cur][0] = BigInteger.ONE;			
			char c = seq.charAt(i-1);
			for (int j =1; j <= sublen;j++){
				char c2 = sub.charAt(j-1);
				if (c==c2){
					f[cur][j] = add(f[prev][j-1],f[prev][j]);
			
				}
				else f[cur][j] = f[prev][j];
			}
			cur ^= 1; prev ^= 1;
		}
		System.out.println(f[prev][sublen]==null ?
			"0": f[prev][sublen].toString());
	}
	public static void main(String args[]){

		Scanner s = new Scanner(System.in);
		n = s.nextInt();s.nextLine();
		for (int i =0;i < n;i++){
			seq=s.nextLine().trim();
			sub=s.nextLine().trim();
			doit();
		}
	}
}

