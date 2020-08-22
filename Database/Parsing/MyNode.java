import java.util.*;

public class MyNode<T> {
    public T data;
    public int quantity;
    public MyNode<T> parent;
    public List<MyNode<T>> children;
}