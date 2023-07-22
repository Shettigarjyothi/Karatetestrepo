package apitests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.*;


public class testRunner {
	@Test
    void testParallel() {
        Results results = Runner.path("classpath:apitests").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
	
}
