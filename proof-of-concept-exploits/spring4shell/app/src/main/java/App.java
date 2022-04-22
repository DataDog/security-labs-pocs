import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.boot.SpringApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@EnableAutoConfiguration
@RestController
public class App extends SpringBootServletInitializer
{
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
         return application.sources(App.class);
    }

    public static void main(final String[] args) {
        SpringApplication.run(App.class, args);
    }
    
    @RequestMapping("/")
    String home(final User user) {
        System.out.println("=================");
        System.out.println(user);
        System.out.println("=================");
        return "Hello Spring!";
    }

    @RequestMapping("/ping")
    String ping() {
        return "Pong!";
    }
}
