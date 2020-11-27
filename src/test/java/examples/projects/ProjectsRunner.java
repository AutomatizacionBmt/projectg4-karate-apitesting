package examples.projects;

import com.intuit.karate.junit5.Karate;

public class ProjectsRunner {

    @Karate.Test
    Karate testIssues() {
        return Karate.run("issues").relativeTo(getClass());
    }


}
