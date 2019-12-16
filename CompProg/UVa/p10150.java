import java.util.*;
import java.io.*;

public class Main
{
    static String words[] = new String[26000];
    static List<List<Integer>> edges = new ArrayList<List<Integer>>();
    static int n = 0;
    static Map<String,Integer> map = new HashMap<String,Integer>();
   static  Queue<Node> q = new LinkedList<Node>();
   static int used[] = new int[26000];
   static Node nodes[] = new Node[26000];
   static List<String> out = new ArrayList<String>();
    static boolean isadj(String s1, String s2){
        int mismatch = 0;
        if (s1.length()!=s2.length()) return false;
        for (int i = s1.length()-1; i>=0;i--){
            if (s1.charAt(i) != s2.charAt(i)){
                mismatch++;
                if (mismatch > 1) return false;
            }
        }
        return mismatch==1;
    }
    private static class Node{
        public Node back ;
        public int idx;
    }
    
         static List<Integer> calc(int i){
            List<Integer> e = new ArrayList<Integer>();
            for (int j = 0; j < n;j++){
                
                if (i!=j && isadj(words[i], words[j])){
                    e.add(j);
                 //   edges.get(j).add(i);
                }
            }return e;
        }
    static boolean find(int iter, int src, int target){
        
        q.clear();
        
        Node root = nodes[0];
        int nnidx = 1;
        root.back=null;
        root.idx = src;
        q.add(root);
        Node cur = null;
        used[src] = iter;
        while (q.peek() != null){
             cur = q.remove();
           List<Integer> e = edges.get(cur.idx);
           if (cur.idx == target) break;
           if (e==null) edges.set(cur.idx, e=calc(cur.idx));
          
           for (int ed: e){
            if (iter != used[ed]){
                Node nn = nodes[nnidx++];
                nn.back  = cur;
                nn.idx = ed;
                q.offer(nn);
                used[ed] = iter;
            }
           }
           
        }
       
        if (cur.idx == target){ out.clear();
            while (cur != null){
                out.add(words[cur.idx]);
                cur = cur.back;
                }
            for (int i = out.size()-1; i>=0;i--){
                System.out.println(out.get(i));
            }
            return true;
        }
        return false;
    }
    
    public static void main(String []args){
        Scanner  s =new Scanner(System.in);
        String line = null;
        boolean first = !false;
        while ((line = s.nextLine()) != null){
            line = line.trim();
            if (line.length()==0) break;
            if (map.containsKey(line)) continue;
            words[n] = line;
            
            map.put(line,n);
            n++;
        }
        
        for (int i = 0;i < n;i++){
        //    List<Integer> e = new ArrayList<Integer>();
            edges.add(null);
            nodes[i]=new Node();
        }

       
        int iter =0;
        while (s.hasNext()){
        line = s.nextLine();
            line = line.trim();
            if (line.length()==0) break;
            int spc = line.indexOf(' ');
           
            if (!first) System.out.println();
            first = false;
            String sf = line.substring(0, spc);
            String sss = line.substring(spc+1).trim();
            Integer f = map.get(sf);
            Integer ss = map.get(sss);
            iter++;
            if (f==null || ss==null || sf.length()!=sss.length()|| ! find(iter,f,ss)){
                System.out.println("No solution.");
            }
        }
    }
    
}
