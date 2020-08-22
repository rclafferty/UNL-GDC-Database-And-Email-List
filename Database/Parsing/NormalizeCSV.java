import java.util.*;
import java.io.*;

public class NormalizeCSV
{
    public static void main(String[] args) throws IOException
    {
        Scanner inFile = new Scanner(new File("../CSV/unemployment2.csv"));
        ArrayList<String> majors = new ArrayList<String>();

        String[] parts = null;

        System.out.println(inFile.nextLine());
        while (inFile.hasNext())
        {
            String line = inFile.nextLine().trim();
            parts = line.split(",");

            if (!majors.contains(parts[1]))
            {
                majors.add(parts[1]);
                // System.out.println("Major: " + parts[1]);
            }
        }

        boolean[] hasBeenUsed = new boolean[majors.size()];
        for (int i = 0; i < hasBeenUsed.length; i++)
        {
            hasBeenUsed[i] = false;
        }

        inFile = new Scanner(new File("../CSV/unemployment2.csv"));
        inFile.nextLine();
        String currDate = "";
        while(inFile.hasNext())
        {
            String line = inFile.nextLine().trim();
            parts = line.split(",");

            if (currDate.equals(""))
            {
                currDate = parts[0];
            }
            else
            {
                if (!currDate.equals(parts[0]))
                {
                    for (int i = 0; i < hasBeenUsed.length; i++)
                    {
                        if (hasBeenUsed[i])
                            continue;
                        
                        System.out.println(currDate + "," + majors.get(i) + ",0");

                        hasBeenUsed[i] = false;
                    }

                    currDate = parts[0];
                }
            }

            // System.out.println(parts[1]);
            int index = majors.indexOf(parts[1]);
            hasBeenUsed[index] = true;

            System.out.println(line);
        }
    }
}