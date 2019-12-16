import java.io.*;
import java.util.*;

public class p1
{
    private static enum Direction
    {
        EAST, NORTH, SOUTH, WEST;
    }

    /** Helper class presenting a prism */
    private static class Prism
    {
        /** Zero-based row index of prism */
        public int row;
        public int col;

        public Direction dir;

        /** Whether visited */
        public boolean visited;

        /** Points to next prism if the laser were to hit this prism.
         * null if will hit wall. */
        public Prism next;
    }

    /** No. of rows in map */
    private static int nRows;

    /** No. of cols in map */
    private static int nCols;

    private static long distToWall(Prism cur)
    {
        if (cur.dir.equals(Direction.EAST))
            return nCols - cur.col;
        
        if (cur.dir.equals(Direction.WEST))
            return cur.col + 1;

        if (cur.dir.equals(Direction.SOUTH))
            return nRows - cur.row;
        
        // north
        return cur.row + 1;
    }

    private static long distBetween(Prism cur, Prism next)
    {
        if (cur.dir.equals(Direction.EAST))
            return next.col - cur.col;
        
        if (cur.dir.equals(Direction.WEST))
            return cur.col - next.col;

        if (cur.dir.equals(Direction.SOUTH))
            return next.row - cur.row;
   
        // north
        return cur.row - next.row;
    }

    public static void main(String[] args)
        throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // assume first line is not null
        String line = br.readLine().trim();

        nCols = line.length();
        
        // the line prior
        Prism[] prevRow = new Prism[nCols];

        // starting laser
        Prism start = null;

        // laser's next destination
        Prism startNext = null;

        nRows = 0;

        do
        {
            line = line.trim();
            if (line.length() == 0) break;

            nRows++;

            // previous prism on this line
            Prism prev = null;
            
            // loop thru each char in current line
            mainLoop:
            for (int i = 0; i < nCols; i++)
            {
                final char ch = line.charAt(i);
            
                Prism cur = new Prism();
                cur.row = nRows-1;
                cur.col = i;


                // check type of char
                switch(ch)
                {
                case 'V':
                case 'v':
                    cur.dir = Direction.SOUTH;
                    break;

                case '>':
                    cur.dir = Direction.EAST;
                    break;

                case '<':
                    cur.dir = Direction.WEST;
                    if (prev != null)
                    {
                        cur.next = prev;
                    }
                    break;

                case '^':
                    cur.dir = Direction.NORTH;

                 {
                    Prism prevRowPrism = prevRow[i];
                    if (prevRowPrism != null)
                    {
                        cur.next = prevRowPrism;
                    }
                 }
                    break;

                case '@': // treat as prism
                    start = cur;
                    cur.dir = Direction.EAST;
                    // fall thru

                case '-':
                    continue mainLoop;
                }

                if (start != null && startNext == null && start.row == cur.row)
                    startNext = cur;
                
                if (prev != null && prev.dir.equals(Direction.EAST))
                {
                    prev.next = cur;
                }

                Prism prevRowPrism = prevRow[i];
                if (prevRowPrism != null && prevRowPrism.dir.equals(Direction.SOUTH))
                {
                    prevRowPrism.next = cur;
                }

                prevRow[i] = cur;
                prev = cur;
            }
        }
        while ((line = br.readLine()) != null);

        Prism cur = null;
        
        // total distance, use long just in case
        long dist = 0;

        if (start != null)
        {
            if (startNext != null)
            {
                dist += distBetween(start, startNext);
                cur = startNext;
            }
            else 
            {
                dist += distToWall(start);
            }
        }

        // now start the journey :)
        while (cur != null)
        {
            if (cur.visited)
            {
                dist = -1;
                break;
            }

            cur.visited = true;
            Prism next = cur.next;

            if (next == null)
            {
                dist += distToWall(cur);
                break;
            }

            dist += distBetween(cur, next);
            cur = next;
        }   

        System.out.println(dist);
    }
}
