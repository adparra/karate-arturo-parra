package petstore;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

class PetStoreRunner {

    @Test
    void testParallel() {
        String karateOutputPath = "build/karate-reports";

        Results results = Runner.path("classpath:petstore")
                .outputCucumberJson(true)
                .reportDir(karateOutputPath)
                .parallel(1);
        
        generateReport(karateOutputPath);
        
        assertTrue(results.getFailCount() == 0, results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        if (jsonFiles.isEmpty()) {
            System.out.println("ADVERTENCIA: No se encontraron archivos .json en " + karateOutputPath);
            return;
        }

        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        
        File reportDir = new File("build/cucumber-html-report");
        
        Configuration config = new Configuration(reportDir, "karate-petstore");
        config.setBuildNumber("1");

        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}