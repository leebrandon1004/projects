/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab1;
import java.util.*;
import java.text.NumberFormat;
/**
 *
 * @author user
 */
public class Lab1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        double radius = 0.0;
        double width1 = 0.0;
        double width2 = 0.0;
        double depth = 0.0;
        double cost = 0.0;
        
        System.out.print("Please enter the radius of the fountain (10.0 to 15.0 feet): ");
        radius = in.nextDouble();
        while(radius < 10.0 || radius > 15.0)
        {
        System.out.print("(INCORRECT VALUE DETECTED. Please enter a value between 10.0 and 15.0): ");
        radius = in.nextDouble();
        }
        
        System.out.print("Please enter the rectangular pedestal’s x-axis width (2.0 to 8.0 feet): ");
        width1 = in.nextDouble();
        while(width1 < 2.0 || width1 > 8.0)
        {
        System.out.print("(INCORRECT VALUE DETECTED. Please enter a value between 2.0 and 8.0): ");
        width1 = in.nextDouble();
        }
        
        System.out.print("Please enter the rectangular pedestal’s y-axis width (2.0 to 8.0 feet): ");
        width2 = in.nextDouble();
        while(width2 < 2.0 || width2 > 8.0)
        {
        System.out.print("(INCORRECT VALUE DETECTED. Please enter a value between 2.0 and 8.0): ");
        width2 = in.nextDouble();
        }
        
        System.out.print("Please enter the water’s depth when full (1.0 to 3.0 feet): ");
        depth = in.nextDouble();
        while(depth < 1.0 || depth > 3.0)
        {
        System.out.print("(INCORRECT VALUE DETECTED. Please enter a value between 1.0 and 3.0): ");
        depth = in.nextDouble();
        }
        
        double cvolume= (Math.pow(radius,2)*Math.PI*depth);
        double rvolume=(width1*width2*depth);
        double totalvolume=(cvolume-rvolume);
        double gallon=(totalvolume*7.4810);
        cost = (Math.ceil(gallon)*0.10);
        
        System.out.println("Water Volume in cubic feet: " + totalvolume); 
        System.out.println("Water Volume in gallons:" + gallon);
        System.out.println("That amount of water will cost: " + NumberFormat.getCurrencyInstance().format(cost));
    }
    
}
