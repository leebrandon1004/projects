/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab02;
import java.util.Scanner;

/**
 *
 * @author user
 */
public class Lab02 {

    /**
     * @param args the command line arguments
     */
        public static final String START_STRING = "abc def";

        public static void printHelp(String errorMessage)
{
    System.err.println(errorMessage);
    System.err.println("Usage - enter one of the following Commands:");
    System.err.println();
    System.err.println("searchText [text]: prints the index of [text] in "
    + "the String, leaves it unchanged.");
    System.err.println("removeText [text] - deletes all occurences of "
    + "[text] in the String.");
    System.err.println("addText [i] [text] - first argument is an integer "
    + "between 0 and and the length of the string; "
    + "adds [text] at that location in the string.");
    System.err.println("reverseText [no argument] - makes the string into "
    + "its mirror image.");
    System.err.println("reverseEachWord [no argument] - like reverseText "
    + "but applies to each command word individually.");
    System.err.println("printString [no argument] - prints the current "
    + "value of the string.");
    System.err.println("enterNewString [text] - overwites whatever the "
    + "string was with [text] instead.");
    System.err.println("quit [no argument] - exits the program.");
    System.err.println("");
}
     public static String printString(String oldString, String[] commandWords)
{
        System.out.println(oldString);
        return oldString;
}

    private static String searchText(String oldString, String[] commandWords){
        if (commandWords.length < 2)
        {
        printHelp("searchText - requires an argument");
        }
        else {
            String search = commandWords[1];
            int index = oldString.indexOf(search);
            System.out.println(index);
        }
        return oldString;
    }
    
    private static String removeText(String oldString, String[] commandWords){
        switch (commandWords.length)
        {
            case 1:
                printHelp("removeText - requires an argument");
                break;
            case 2:
                String search = commandWords[1];
                search = oldString.replace(commandWords[1], "");
                return search;
        }
        return null;
    }
    
    private static String addText(String oldString, String[] commandWords){
        if (commandWords.length == 1)
        {
        printHelp("addText - requires an argument");
        return combineWordsFrom(commandWords, 1);
        }
        
        int index = Integer.valueOf(commandWords[1]);
        
        if (index < 0)
        {
        printHelp("addText - invalid index (must be int between 0 and string length): -1");
        return combineWordsFrom(commandWords, 1);
        }
        String out = oldString.substring(0, index) + commandWords[2] + oldString.substring(index);
        return out;
    }
    
    public static String reverseText(String oldString, String[] commandWords)
    {
        StringBuilder newString = new StringBuilder(oldString);
        StringBuilder reverse = newString.reverse();
        String newReverse = reverse.toString();
        return newReverse;
    }
    
    public static String reverseEachWord(String oldString)
    {
        String newString = oldString;
        String[] text = oldString.split(" ");
        String reverseWord = "";
        
        for (int i = 0; i < text.length; i++)
        {
            String word = text[i];
            String reverse = "";
            for (int j = word.length()-1; j>=0; j--)
            {
                reverse = reverse + word.charAt(j);
            }
            reverseWord = reverseWord + reverse + " ";
        }
        return reverseWord;
    }
    
    private static String combineWordsFrom(String[] words, int index)
{
        String newString = "";
        for(int i = index; i < words.length; i+=1)
        {
        if(i > 1)
        {
        newString += " ";
        }
        newString += words[i];
        }
        return newString;
}

    public static String enterNewString(String oldString, String[] commandWords)
{
        if (commandWords.length < 2)
        {
        printHelp("enterNewString - requires an argument");
        return oldString;
        }
        else {
            return commandWords[1];   
        }
}

    public static String handleStringCommand(String oldString, String[] commandWords)
{
        if ("printString".equals(commandWords[0]))
        {
        return printString(oldString, commandWords);
        }
        else if ("enterNewString".equals(commandWords[0]))
        {
        return enterNewString(oldString, commandWords);
        }
        else if ("searchText".equals(commandWords[0]))
        {
        return searchText(oldString, commandWords);
        }
        else if ("removeText".equals(commandWords[0]))
        {
        return removeText(oldString, commandWords);
        }
        else if ("addText".equals(commandWords[0]))
        {
        return addText(oldString, commandWords);
        }
        else if ("reverseText".equals(commandWords[0]))
        {
        return reverseText(oldString, commandWords);
        }
        else if ("reverseEachWord".equals(commandWords[0]))
        {
        return reverseEachWord(oldString);
        }
        else
        {
        printHelp("Unknown command: "+commandWords[0]);
        return null;
        }
}
    public static void main(String args[])
{
        String theString = START_STRING;
        Scanner s = new Scanner(System.in);
        boolean run = true;
        do
{
        System.out.print("Enter Command: ");
        String line = s.nextLine();
        String[] commandWords = line.split(" ");
        if ("quit".equals(commandWords[0]))
{
run = false;
}
else
{
String newString = handleStringCommand(theString, commandWords);
if (newString != null)
{
theString = newString;
}
}
} while(run == true);
}
}
