import java.util.*;
import java.io.*;
import java.text.*;

public class CreateFakeDataFromReal
{
    public static void main(String[] args) throws IOException
    {
        Scanner inFile = new Scanner(new File("../../PopulateFakeData2/TXT/random_names.txt"));

        ArrayList<String> memberFirstNames = new ArrayList<String>();
        ArrayList<String> memberLastNames = new ArrayList<String>();

        DecimalFormat df = new DecimalFormat("0000");

        while (inFile.hasNext())
        {
            String line = inFile.nextLine();
            String[] parts = line.split(" ");
            memberFirstNames.add(parts[0].replaceAll("[^a-zA-Z0-9]", ""));
            memberLastNames.add(parts[1].replaceAll("[^a-zA-Z0-9]", ""));
            System.out.println(line);
        }

        FileWriter fw = new FileWriter(new File("../SQL/update_fake_data.sql"));
        fw.write("USE Class;\n\n");
        
        inFile = new Scanner(new File("../JSON/updated_real_data.json"));
        int fakeNameIndex = 0;
        boolean endOfMember;
        while (inFile.hasNext())
        {
            for (int i = 0; i < 8; i++)
            {
                String line = inFile.nextLine();
                char firstChar = line.trim().charAt(0);
                if (firstChar == '[' || firstChar == ']' || firstChar == '{' || firstChar == '}')
                {
                    System.out.println(line);
                    if (firstChar == '}')
                    {
                        fakeNameIndex++;
                        fw.write("\n");
                    }
                    break;
                }

                String[] parts = line.split(":");
                if (line.contains("firstName"))
                {
                    System.out.println(parts[0] + ":\"" + memberFirstNames.get(fakeNameIndex) + "\",");
                    fw.write("UPDATE Members SET firstName = '" + memberFirstNames.get(fakeNameIndex) + "' WHERE id = " + fakeNameIndex + ";\n");
                }
                else if (line.contains("lastName"))
                {
                    String lastName = memberLastNames.get(fakeNameIndex).replaceAll("[^a-zA-Z0-9]", "");
                    System.out.println(parts[0] + ":\"" + memberLastNames.get(fakeNameIndex) + "\",");
                    fw.write("UPDATE Members SET lastName = '" + memberLastNames.get(fakeNameIndex) + "' WHERE id = " + fakeNameIndex + ";\n");
                }
                else if (line.contains("github"))
                {
                    String github = (memberFirstNames.get(fakeNameIndex).trim().charAt(0) + "" + memberLastNames.get(fakeNameIndex)).toLowerCase();
                    System.out.println(parts[0] + ":\"" + github + "\",");
                    fw.write("UPDATE Members SET github = '" + github + "' WHERE id = " + fakeNameIndex + ";\n");
                }
                else if (line.contains("discord"))
                {
                    String github = (memberFirstNames.get(fakeNameIndex).trim().charAt(0) + "" + memberLastNames.get(fakeNameIndex)).toLowerCase();
                    Random r = new Random();
                    int randNumber = r.nextInt(9999);
                    String discord = github + "#" + df.format(randNumber);
                    System.out.println(parts[0] + ":\"" + discord.toLowerCase() + "\",");
                    fw.write("UPDATE Members SET discord = '" + discord + "' WHERE id = " + fakeNameIndex + ";\n");
                }
                else if (line.contains("googleDrive"))
                {
                    String github = (memberFirstNames.get(fakeNameIndex).trim().charAt(0) + "" + memberLastNames.get(fakeNameIndex)).toLowerCase();
                    String googleDrive = github + "@gmail.com";
                    System.out.println(parts[0] + ":\"" + googleDrive + "\",");
                    fw.write("UPDATE Members SET googleDrive = '" + googleDrive + "' WHERE id = " + fakeNameIndex + ";\n");
                    fw.write("INSERT INTO Emails (memberID, email) VALUES (" + (fakeNameIndex + 1) + ", '" + googleDrive + "');\n");
                }
                else
                {
                    System.out.println(line);
                }
            }
        }

        fw.close();
    }
}