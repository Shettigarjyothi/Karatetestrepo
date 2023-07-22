package apitests;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class testRunner1 {
	
	@Test
	public Karate runner() {
		
		//return Karate.run("getMethod","validatejsonarray",).relativeTo(getClass());
	
		return	Karate.run("schemavalidation.feature" ,"ValidateDatafile").relativeTo(getClass());
	}

}
