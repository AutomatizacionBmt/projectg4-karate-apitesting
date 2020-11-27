package examples.issues;

import com.intuit.karate.junit5.Karate;

public class IssuesRunner {

    @Karate.Test
    Karate testProjects() {
        return Karate.run("projects").relativeTo(getClass());
    }


}
