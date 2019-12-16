/*
 * A visual debugging tool.
 * Click on the triangle corners and drag it around to resize
 * I still can't figure out what's wrong with my solution!
 * */

import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

public class p823_tool extends  JPanel implements MouseListener,
       MouseMotionListener
{
/*
    class Blank extends JLabel{
        Dimension minSize = new Dimension(100,50);
        public void paint (Graphics g)
        {
            g.drawLine(0,0,100,100);
        }

        public Dimension getMinimumSize()
        {
            return minSize;
        }
    }
*/
    private static JFrame frame;
    double a, b, c;
    double big[] = new double[3];
    double sm [] = new double[3];
    double x[] = new double[3], y[]=new double[3]; // circle pts based on [0,0]
    boolean inv[] = new boolean[3];
    double px[]=new double[3], py[]=new double[3]; // tri points based on (0,0)

    boolean down = false;

    int sel = -1; // 0-2 for tri points, 3-5 for circle

    int cx,  cy; // pixel screen coords

    private int toScreenX(double x)
    {
        return  (int)(x + cx);
    }

    private double fromScreenX(int x)
    {
        return x - cx;
    }

    private double fromScreenY(int y)
    {
        return cy-y;
    }

    private int toScreenY(double y)
    {
        return (int)(cy-y);
    }

    private double acos(double x){return Math.acos(x);}
    private double asin(double x){return Math.asin(x);}
    private double tan(double x){return Math.tan(x);}
    private double cos(double x){return Math.cos(x);}
    private double sin(double x){return Math.sin(x);}

    // assumes circle center at (0,0) with radiius r
// line segment is [x1,y1] - [x2,y2]
private boolean circleLineIntersect(
	double r, double x1, double y1, double x2, double y2
)
{
	double dx = x2-x1;
	double dy = y2-y1;
	double dr2 = (dx*dx+dy*dy);
	double D = x1*y2 - x2*y1;
    double det = r*r * dr2 - D*D;
    return det >= 0.0;
}

private boolean circleLineInter(
double x, double y, double r, double x1, double y1, double x2, double y2)
{
	return circleLineIntersect(
		r, x1-x, y1-y, x2-x, y2-y
	);
}

// circle 1 : radius r1
// circle 2 : radius r2
// distance dd between their centers
private boolean circlesIntersect(double r1, double r2, double dd)
{
	if(dd >= r1+r2) return false;
	return true;
}

private boolean cc(int i1,int i2){

		double dx = x[i1]-x[i2];
		double dy = y[i1]-y[i2];
		double dd = Math.sqrt(dx*dx+dy*dy);
	if(inv[i1] != inv[i2]){// both diff orientation
		return (circlesIntersect(big[i1]/2,sm[i2]/2,dd) ||
		    circlesIntersect(sm[i1]/2, big[i2]/2,dd));
	}else
	{
		return (circlesIntersect(big[i1]/2,big[i2]/2,dd) ||
		    circlesIntersect(sm[i1]/2, sm[i2]/2,dd));
	}
}

double cross(double a, double b, double c, double d)
{
	return a*d-b*c;
}

boolean sameSide(
double p1x, double p1y,
double p2x, double p2y,
double ax, double ay,
double bx,double by){

	double cp1 = cross(bx-ax, by-ay, p1x-ax,p1y-ay);
	double cp2 = cross(bx-ax, by-ay, p2x-ax,p2y-ay);
	if (cp1*cp2 >= 0.0) return true;
	return false;
}

boolean inTri(
double x, double y,
double ax, double ay,
double bx, double by,
double cx, double cy){

	if (
	sameSide(x,y,ax,ay,bx,by,cx,cy) &&
	sameSide(x,y,bx,by,ax,ay,cx,cy) &&
	sameSide(x,y,cx,cy,ax,ay,bx,by)) return true;
	return false;
}

    private boolean calc(){


	y[0] = big[0]/2.0;
	double alpha = Math.acos((a*a + c*c - b*b)/(2*a*c))/2;
	x[0] = y[0]/Math.tan(alpha);

	double t2 = a*Math.sin(alpha*2);
	double t1 = a*Math.cos(alpha*2);

	// check inter with side b
	if (circleLineInter(x[0],y[0],y[0],t1,t2,
		c,0)) return false;

	double gamma = acos((a*a+b*b-c*c)/(2*a*b))/2;
	double e= Math.PI/2 - 2*alpha - gamma;
	double h = big[1]/2 / sin(gamma);
	y[1] = a*sin(alpha*2) - h*cos(e);
	x[1] = a*cos(alpha*2) - h *sin(e);

	//check inter with side c
	if (circleLineInter(x[1],y[1],big[1]/2.0,0,0,
		c,0)) return false;

	if (cc(0,1)) return false;

	double beta = acos((c*c+b*b-a*a)/(2*c*b))/2;
	y[2] = big[2]/2;
	x[2] = c-y[2]/tan(beta);


	if (circleLineInter(x[2],y[2],big[2]/2.0,t1,t2,
		0,0)) return false;


	if (cc(1,2)) return false;
	if (cc(0,2)) return false;

	int i;
	for(i=0;i<3;i++){
		if (!inTri(x[i],y[i],
			0,0,t1,t2,c,0))return false;
	}

	return true;
    }

    public p823(){
    /*    super(new GridLayout(0,1));
        Blank blankArea = new Blank();
        add(blankArea);

        blank.addMouseListener(this);
        */

        big[0] = 190;
        big[1] = 30;
        big[2] = 50;
        sm[0] = 15;
        sm[1] = 15;
        sm[2] = 15;

        cx = 100;
        cy = 100;
        a = b = c= 200;
        px[0] = 0; py[0] = 0;
        double alpha = Math.acos((a*a+c*c-b*b)/(2*a*c));
        px[1] = px[0] + Math.cos(alpha)*a;
        py[1] = py[0] + Math.sin(alpha)*a;
        px[2] = c;
        py[2] = 0;

        addMouseMotionListener(this);
        addMouseListener(this);
        setPreferredSize(new Dimension(400, 400));
    }

    public void paint(Graphics g)
    {
        super.paint(g);


        cx =(int) getSize().getWidth()/2;
        cy = (int)getSize().getHeight()/2;
        calc();

        for (int i =0 ; i < 3; i++)
            g.drawLine(toScreenX(px[i]), toScreenY(py[i]),
                        toScreenX(px[(i+1)%3]), toScreenY(py[(i+1)%3]));

        for (int i = 0; i < 3;i++){
            drawCircle(g, x[i], y[i], big[i]);
        }
    }

    private void drawCircle(Graphics g, double x, double y, double d)
    {
        int ir = (int)d/2;
        g.drawOval(toScreenX(x)-ir, toScreenY(y)-ir, (int)(d),(int)(d));
    }

    public void mousePressed(MouseEvent e) {
        down=true;

        int x = e.getX();
        int y = e.getY();
        for (int i = 0; i < 3; i ++){
            double dx = x - toScreenX(px[i]);
            double dy = y - toScreenY(py[i]);
            double dd = Math.sqrt(dx*dx+dy*dy);
            if (dd < 5) { sel =i; break;}
        }
    }

    public void mouseReleased(MouseEvent e) {
        down=false;
        sel= -1;
    }

    public void mouseMoved(MouseEvent e) {

    }

    public void mouseDragged(MouseEvent e) {
        if (!down) return;
        Graphics g = getGraphics();
        int x = e.getX();
        int y = e.getY();


        cx =(int) getSize().getWidth()/2;
        cy = (int)getSize().getHeight()/2;

        if (sel <= 0) return;
        if (sel <= 1){ px[1] = fromScreenX(x); py[1]=fromScreenY(y); }
        if (sel == 2){px[2] = fromScreenX(x); }

        c = px[2];
        double dx = px[1] - px[0];
        double dy = py[1] - py[0];
        a = Math.sqrt(dx*dx+dy*dy);
         dx = px[1] - px[2];
         dy = py[1] - py[2];
        b = Math.sqrt(dx*dx+dy*dy);

        if (!calc()) frame.setTitle("impossible");
        else frame.setTitle("possible");
        paint(g);
    }
    public void mouseEntered(MouseEvent e) {
    }

    public void mouseExited(MouseEvent e) {
    }

    public void mouseClicked(MouseEvent e) {
    }


    public static void main (String []args)
    {
        p823 p = new p823();

        JFrame f = new JFrame("p");
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame =f ;
        p.setOpaque(true);
        f.setContentPane(p);
        f.pack();
        f.setVisible(true);
    }
}
