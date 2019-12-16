import java.util.*;

public class p29
{
	static int isprime[];

	private static String gen(int num, int b)
	{
		int fact[] = new int[num];
		int pow [] = new int[num];
		int idx = 0;
		for (int i = 2; num>1; i++)
		{
			if (0==isprime[i]) continue;
			if (0==num % i){
				fact[idx] = i;
				while (num % i==0)
				{
					num/=i; pow[idx]++;
				}
				idx++;
			}
		}
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < idx;i++)
			sb.append(fact[i]+"-"+pow[i]*b+"/");

		return sb.toString();
	}

	public static void main(String [] args)
	{
		isprime = new int[10000];
		for (int i = 0; i < isprime.length;i++) isprime[i] = 1;

		for (int i = 2; i <isprime.length; i++){
			if (0==isprime[i])continue;
			for (int j = i*i; j < isprime.length;j+=i)
				isprime[j] = 0;
		}

		Set<String> s = new HashSet<String>();
		for (int a = 2; a <= 100; a++)
			for (int b = 2; b <= 100;b++)
				s.add(gen(a,b));
	
		System.out.println(s.size());
		}

}
