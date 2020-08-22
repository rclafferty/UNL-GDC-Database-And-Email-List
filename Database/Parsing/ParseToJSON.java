import java.util.*;

// import sun.reflect.generics.tree.Tree;

import java.io.*;

public class ParseToJSON
{
    static ArrayList<Member> members = new ArrayList<Member>();

    public static void main(String[] args) throws IOException
    {
        // ArrayList<ArrayList<ArrayList<String>>> hierarchy = new ArrayList<ArrayList<ArrayList<String>>>();

        String filename = "../FakeData/JSON/fake_data.json";
        // String filename = "../RealData/JSON/updated_real_data.json";
        // printContents("updated_real_data.json");
        
        // formatJSON("real_data.json");
        // printContents(filename);
        formatJSON(filename);
    }

    private static void printContents(String filename) throws IOException
    {
        Scanner thisFile = new Scanner(new File(filename));
        while (thisFile.hasNext())
        {
            String line = thisFile.nextLine();
            // if (line.contains("firstName"))
            // {
            //     System.out.println(line);
            // }

            System.out.println(line);
        }

    }

    private static void formatJSON(String filename) throws IOException
    {
        Scanner inFile = new Scanner(new File(filename));
        Scanner keyboard = new Scanner(System.in);
        String line = "";
        String[] parts = null;

        // String[] keywords = {"firstName", "lastName", "majorID", "yearID"};
        ArrayList<String> keywords = new ArrayList<String>();
        keywords.add("firstName");
        keywords.add("lastName");
        keywords.add("majorID");
        keywords.add("yearID");

        while (inFile.hasNext())
        {
            String memberName = "";
            String memberMajor = "";
            String memberYear = "";
            boolean hitSpecCharacter = false;

            StringBuilder sb = new StringBuilder();

            // for (int i = 0; i < 8; i++)
            while (!hitSpecCharacter)
            {
                line = inFile.nextLine().trim();
                // System.out.println(line);
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
                // System.out.print(parts.length + " part");
                // if (parts.length != 1)
                // {
                //     System.out.print("s");
                // }
                // System.out.println("");

                for (int i = 0; i < parts.length; i++)
                {
                    parts[i] = parts[i].trim();
                    String s = parts[i];
                    // System.out.println(s);
                }

                if (parts.length == 1)
                {
                    if (parts[0].charAt(0) != '[' && parts[0].charAt(0) != ']' && parts[0].charAt(0) != '{' && parts[0].charAt(0) != '}')
                        System.out.println("ERROR -- 1 part --> " + parts[0]);

                    hitSpecCharacter = true;

                    break;
                }

                String id = parts[0];
                String value = parts[1];

                // if (keywords.contains(id))
                //     System.out.println("id: " + id + "\tvalue: " + value);

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

            // System.out.println();

            if (!hitSpecCharacter)
            {
                sb.append(memberName);
                sb.append(" -- ");
                sb.append(memberMajor);
                sb.append(" -- ");
                sb.append(memberYear);
                // System.out.println(sb.toString());

                members.add(new Member(memberName, memberMajor, memberYear));
                // System.out.println(members.size());
            }
        }
        inFile.close();

        printTree(Member.hierarchy.root, 0);

        printJSON();
    }

    public static void printTree(MyNode<String> node, int i)
    {
        for (int x = 0; x < i; x++)
            System.out.print("\\");
        System.out.println(node.data);

        for (MyNode<String> child : node.children)
        {
            printTree(child, i+1);
        }
    }

    public static void printJSON()
    {
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
            System.out.println("Adding " + major);
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
            System.out.println("Adding " + year);
            newNode.quantity = 1;
            newNode.children = new ArrayList<MyNode<String>>();
            majorNode.children.add(newNode);

            yearNode = newNode;
        }

        MyNode<String> nameNode = new MyNode<String>();
        nameNode.data = name;
        System.out.println("Adding " + name);
        yearNode.children.add(nameNode);
    }
}