/**
Algorithm:
Simple string replacement ...

Gotchas:
- Don't trim any input
- Always search restarting from first char
*/

import java.io.*;
import java.util.*;

public class Main
{
    static void doit()
    {
        for (int i = 0; i < num;i++){
            String f = find[i];
            String r = replace[i];
            while ( line.indexOf(f)>=0){
                line = line.replaceFirst(f,r);
            }
            
        }
        System.out.println(line);
    }
    static String line;
    static String[] find = new String [100];
    static String[] replace = new String[100];
    static int num;
    public static void main (String []a ) throws Exception
    {
        Scanner s = new Scanner(System.in);
        while (true){
            int n = s.nextInt();
            
            if (n==0) break;
            s.nextLine();

            for (int i = 0; i < n; i++){
                find[i] = s.nextLine();
                replace[i] = s.nextLine();
            }
            num=n;
            line = s.nextLine();
            doit();
        }
    }
}
