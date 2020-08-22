import java.util.*;

// import sun.reflect.generics.tree.Tree;

import java.io.*;

public class ParseJSON
{
    static ArrayList<Member> members = new ArrayList<Member>();

    public static void main(String[] args) throws IOException
    {
        // ArrayList<ArrayList<ArrayList<String>>> hierarchy = new ArrayList<ArrayList<ArrayList<String>>>();

        formatJSON("updated_real_data.json", "real_data_formated.json");
        // classFirst("real_data.json");
    }

    private static void formatJSON(String filename, String outputFilename) throws IOException
    {
        Scanner inFile = new Scanner(new File(filename));
        Scanner keyboard = new Scanner(System.in);
        String line = "";
        String[] parts = null;

        while (inFile.hasNext())
        {
            String memberName = "";
            String memberMajor = "";
            String memberYear = "";
            boolean hitSpecCharacter = false;

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < 8; i++)
            {
                line = inFile.nextLine().trim();
                // Erases all commas
                line = line.replaceAll(",", "");
                // Erases all quotation marks
                line = line.replaceAll("\"", "");

                // If end of file, break
                if (line.equals("]"))
                {
                    hitSpecCharacter = true;
                    break;
                }

                // Split on the colon
                parts = line.split(":");
                if (parts.length == 1)
                {
                    if (parts[0].charAt(0) != '[' && parts[0].charAt(0) != ']' && parts[0].charAt(0) != '{' && parts[0].charAt(0) != '}')
                        System.out.println("ERROR -- 1 part --> " + parts[0]);

                    hitSpecCharacter = true;

                    break;
                }

                String id = parts[0];
                String value = parts[1];

                if (id.equals("firstName"))
                {
                    // System.out.print(value + " ");
                    memberName = value;
                    // name = value;
                }
                else if (id.equals("lastName"))
                {
                    // System.out.print(value + " -- ");
                    // name += " " + value;
                    memberName = memberName + " " + value;
                }
                else if (id.equals("majorID"))
                {
                    // System.out.print(value + " -- ");
                    // major = value;
                    memberMajor = value;
                }
                else if (id.equals("doubleMajorID"))
                {
                    // System.out.println(value);
                }
                else if (id.equals("yearID"))
                {
                    // System.out.println(value);
                    // System.out.println("");
                    // year = value;
                    memberYear = value;
                }
            }

            if (!hitSpecCharacter)
            {
                sb.append(memberName);
                sb.append(" -- ");
                sb.append(memberMajor);
                sb.append(" -- ");
                sb.append(memberYear);
                // System.out.println(sb.toString());

                members.add(new Member(memberName, memberMajor, memberYear));
            }
        }
        inFile.close();

        MyTree<String> hierarchy = Member.hierarchy;
        
        System.out.println("{");
        System.out.println("  \"name\": \"GDC Data\",");
        System.out.println("  \"children\": [");
        
        // Major >> Year >> Name
        // Member m = null;
        MyNode<String> node = null;
        for (int i = 0; i < hierarchy.root.children.size(); i++)
        {
            // m = members.get(i);
            node = hierarchy.root.children.get(i);
            System.out.println("    {");
            // System.out.println("      \"name\": \"" + m.major + "\",");
            
            System.out.println("      \"name\": \"" + node.data + "\",");
            // System.out.println("      \"value\": \"" + node.quantity + "\"");
            System.out.println("      \"children\": [");
            
            MyNode<String> yearNode = null;
            for (int j = 0; j < node.children.size(); j++)
            {
                yearNode = node.children.get(j);
                System.out.println("        {");
                System.out.println("          \"name\": \"" + yearNode.data + "\",");
                // System.out.println("          \"value\": \"" + yearNode.quantity + "\"");
                System.out.println("          \"children\": [");

                MyNode<String> nameNode = null;
                for (int k = 0; k < yearNode.children.size(); k++)
                {
                    nameNode = yearNode.children.get(k);

                    System.out.println("            {");
                    System.out.println("              \"name\": \"" + nameNode.data + "\",");
                    System.out.println("              \"value\": \"" + 1 + "\"");
                    System.out.print("            }");
        
                    if (k < yearNode.children.size() - 1)
                    {
                        System.out.print(",");
                    }
                    System.out.println("");
                }

                System.out.println("          ]");

                System.out.print("        }");
    
                if (j < node.children.size() - 1)
                {
                    System.out.print(",");
                }
                System.out.println("");
            }

            System.out.println("      ]");
            System.out.print("    }");

            if (i < hierarchy.root.children.size() - 1)
            {
                System.out.print(",");
            }
            System.out.println("");
        }

        System.out.println("  ]");
        System.out.println("}");
    }
}

class Member
{
    static enum SchoolYears {Freshman, Sophomore, Junior, Senior, Masters};
    static int[] years = new int[5];
    ArrayList<String> majors = new ArrayList<String>();
    ArrayList<Integer> numMajors = new ArrayList<Integer>();

    public static MyTree<String> hierarchy = new MyTree<String>("Members");

    String name;
    String major;
    String year;
    String github;
    String discord;
    String googleDrive;

    public Member(String n, String m, String y)
    {
        name = n;
        major = m;
        year = y;

        MyNode<String> majorNode = null;
        boolean found = false;
        for (MyNode<String> node : hierarchy.root.children)
        {
            if (node.data.equals(major))
            {
                node.quantity++;
                
                majorNode = node;
                found = true;
                break;
            }
        }

        if (!found)
        {
            MyNode<String> newNode = new MyNode<String>();
            newNode.data = major;
            newNode.quantity = 1;
            newNode.children = new ArrayList<MyNode<String>>();
            hierarchy.root.children.add(newNode);

            majorNode = newNode;
        }

        MyNode<String> yearNode = null;
        found = false;
        for (MyNode<String> node : majorNode.children)
        {
            if (node.data.equals(year))
            {
                node.quantity++;

                yearNode = node;
                found = true;
                break;
            }
        }

        if (!found)
        {
            MyNode<String> newNode = new MyNode<String>();
            newNode.data = year;
            newNode.quantity = 1;
            newNode.children = new ArrayList<MyNode<String>>();
            majorNode.children.add(newNode);

            yearNode = newNode;
        }

        MyNode<String> nameNode = new MyNode<String>();
        nameNode.data = name;
        yearNode.children.add(nameNode);
    }
}