import static org.junit.Assert.*;
import org.junit.Test;

public class ZillowCodingExerciseTests {

	@Test
	public void test_stringToLongReturnsValidLong() {
		StringToLong z = new StringToLong();
		assertEquals(z.stringToLong("123"), 123l);
	}
	
	@Test
	public void test_stringToLongHandlesNegativeInString() {
		StringToLong z = new StringToLong();
		assertEquals(z.stringToLong("-123"), -123l);
	}
	
	@Test
	public void test_stringToLongHandlesReallyLongNumbers() {
		StringToLong z = new StringToLong();
		assertEquals(z.stringToLong("-123123123123123123"), -123123123123123123l);
	}
	
	@Test(expected = NumberFormatException.class)
	public void test_stringToLongThrowsNumberFormatExceptionForInvalidStrings() {
		StringToLong z = new StringToLong();
		z.stringToLong("123x");
	}
	
	@Test
	public void test_insertToTrinaryTree(){
		TrinaryTree tt = new TrinaryTree();
		tt.insert(5);
		tt.insert(4);
		tt.insert(9);
		assertTrue(tt.checkNodeExists(4));
	}
	
	@Test
	public void test_insertNodeExistsInTree(){
		TrinaryTree tt = new TrinaryTree();
		tt.insert(5);
		tt.insert(4);
		assertTrue(tt.checkNodeExists(4));
	}
	
	@Test
	public void test_deleteFromTrinaryTree(){
		TrinaryTree tt = new TrinaryTree();
		tt.insert(5);
		tt.insert(4);
		tt.insert(9);
		tt.delete(4);
		assertFalse(tt.checkNodeExists(4));
	}
	
	@Test
	public void test_deleteChangesTreeStructure(){
		TrinaryTree tt = new TrinaryTree();
		tt.insert(5);
		tt.insert(4);
		tt.insert(9);
		tt.insert(7);
		tt.delete(5);
		assertEquals(tt.root.value, 7);
	}

}
