import java.util.*;
import java.io.*;


public  class p902
{

	public static void main (String []args)
throws IOException 
{
		Map<String,Integer> map = new HashMap<String,Integer>();

		Scanner s = new Scanner(System.in);
		while (s.hasNext())
		{
			int n = s.nextInt();
			String msg = s.next();
			msg=msg.trim();int len = msg.length();
			for (int i =  0;  i < len - n+1;i++)
			{
				String sub = msg.substring(i,i+n);
				Integer f = map.get(sub);
				if (f==null) map.put(sub, 1);
				else map.put(sub, f+1);
			}

			int max = 0;
			String sub = null;
			for (Map.Entry<String,Integer> e : map.entrySet())
			{
			Integer f= e.getValue();
				if (f > max){ max=f; sub = e.getKey(); }
			}

			System.out.println(sub);
		}

}
}
