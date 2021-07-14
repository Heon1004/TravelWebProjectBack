package junit.test;


import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Test;


class CustomerTest {
	@Test
	public void testhash() {
		HashMap<String,Integer> list = new HashMap<String,Integer>();
		list.put("1", 1);
		System.out.println(list.get("2"));
	}

}
