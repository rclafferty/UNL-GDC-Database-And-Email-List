import java.util.*;

public class MyTree<T> {
    public MyNode<T> root;

    public MyTree(T rootData) {
        root = new MyNode<T>();
        root.data = rootData;
        root.children = new ArrayList<MyNode<T>>();
    }
}