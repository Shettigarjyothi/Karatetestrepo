package apitests;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class testPostRunner {
  
	
	@Test
	public Karate postRunner() {
		
	return Karate.run("postMethod.feature").relativeTo(getClass());
	
	}
	
	
}
