import java.util.Scanner;
import java.util.InputMismatchException;
public class TrinaryTree {
	// Instance variable to hold reference to root of the tree
	Node root;
	
	/**
	 * Inserts a new node to the tree
	 * Assigns the new node as root if root is null
	 * If root is not null, inserts the node at the correct position to root 
	 * @param value
	 */
	public void insert(int value){
		if(this.root == null){
			this.root = new Node(value);
		} else {
			this.addToTree(this.root, value);
		}
	}
	
	/**
	 * Delete a node with matching value from the tree
	 * @param value
	 */
	public void delete(int value){
		// System.out.println("Deleting node with value "+value);
		this.root = this.deleteFromTree(this.root, value);
	}
	
	/**
	 * Recursively prints all child nodes in pre-order traversal
	 * @param node
	 */
	public void print(Node node){
		if(node == null){
			return;
		}
		System.out.println(node.value);
		print(node.left);
		print(node.middle);
		print(node.right);
	}
	
	/**
	 * Check if a node exists in the tree
	 * Returns true if node exists in the tree, else returns false
	 * @param value
	 * @return boolean
	 */
	public boolean checkNodeExists(int value){
		Node currentNode = this.root;
		while(currentNode != null){
			if(currentNode.value == value){
				return true;
			} else if (currentNode.value > value) {
				currentNode = currentNode.left;
			} else {
				currentNode = currentNode.right;
			}
		}
		return false;
	}
	
	public static void main(String[] args){
		TrinaryTree tt = new TrinaryTree();
		int option = 1;
		while(option <= 3){
			System.out.println("Choose any one option");
			System.out.println("1 - Insert, 2 - Delete, 3 - Print Tree, 4 - Exit");
			try {
				Scanner in = new Scanner(System.in);
				option = in.nextInt();
				if(option == 1){
					System.out.println("Enter a node to insert to tree");
					int input = in.nextInt();
					tt.insert(input);
				} else if(option == 2){
					System.out.println("Enter a node to delete from tree");
					int input = in.nextInt();
					tt.delete(input);
				} else if(option == 3){
					System.out.println("Printing Trinary tree in pre-order traversal");
					tt.print(tt.root);
				} else {
					// Do nothing - Exit loop
					System.out.println("Exiting the application...");
				}
			}
			catch(InputMismatchException e){
				System.err.println("InputMismatchExcption: Enter a valid integer");
			}
		}
	}
	
	/**
	 * Add a new node to the tree
	 * Add the node to right child if it's value greater than current node
	 * Add the node to left child if it's value less than current node
	 * Add the node to middle child if it's value is equal to current node
	 * @param node
	 * @param value
	 */
	protected void addToTree(Node node, int value) {
		if(node.value > value){
			if(node.left == null){
				node.left = new Node(value);
			} else {
				addToTree(node.left, value);
			}
		} else if(node.value < value) {
			if(node.right == null){
				node.right = new Node(value);
			} else {
				addToTree(node.right, value);
			}
		} else {
			if(node.middle == null){
				node.middle = new Node(value);
			} else {
				addToTree(node.middle, value);
			}
		}
	}
	
	/**
	 * Delete the node with value from tree
	 * Rearranging nodes if needed
	 * If a node has both left and right node but no middle node,
	 * Node can be removed by changing it's value to the minimum child node in right subtree
	 * removing the minimum child node from right subtree 
	 * @param node
	 * @param value
	 * @return
	 */
	protected Node deleteFromTree(Node node, int value){
		// Break condition where node not in the tree
		if (node == null){
			System.out.println("No such node in the tree1");
			return null;
		}
		if (node.value > value) {
			node.left = deleteFromTree(node.left, value);
		} else if(node.value < value) {
			node.right = deleteFromTree(node.right, value);
		} else {
			if(node.middle != null){
				node.middle = deleteFromTree(node.middle, value);
			} else if(node.right != null){
				// Find the minimum value node in the right sub-tree.
				// Assign the current value to minimum value
				// Remove the node from right subtree
				Node minNode = findMinElementNode(node.right);
				node.value = minNode.value; 
				node.right = deleteFromTree(node.right, minNode.value);
			} else {
				// No right subtree make left subtree as current node
				node = node.left;
			}
		}
		return node;
	}
	
	/**
	 * Recursively finds the minimum child of given node
	 * finding minimum child is achieved by looking for left-most reachable node.
	 * @param node
	 * @return node
	 */
	protected Node findMinElementNode(Node node){
		if(node != null){
			while(node.left != null){
				return findMinElementNode(node.left);
			}
		}
		return node;
	}
}

/**
 * Node Class to hold the nodes of a tri-nary tree
 * Each Node has a reference to left, right and middle nodes along with a value.
 */
class Node {
	Node left;
	Node right;
	Node middle;
	int value;
	
	// Constructor for the Node - to set the value of node
	public Node(int value){
		this.value = value;
	}
}