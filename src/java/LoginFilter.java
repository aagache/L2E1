import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebFilter("/app/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig config)
        throws ServletException {
        // If you have any <init-param> in web.xml, then you could get them
        // here by config.getInitParameter("name") and assign it as field.
    }
    

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
        throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String requestPath = request.getRequestURI();
        System.out.println(requestPath);
        
        if (session == null || session.getAttribute("user") == null) { 
            response.sendRedirect(request.getContextPath() + "/index.jsp"); 
        } else {
            CharResponseWrapper wrapper = new CharResponseWrapper( (HttpServletResponse)response );
            chain.doFilter(req, wrapper);           
        
            //Get the dynamically generated content from the decorator
            String content = wrapper.toString();

            // Modify the content
            StringWriter sw = new StringWriter();
            sw.write(content);
            sw.write("<h2>Thank you for using our WordFinder service</h2>");

            //Send the modified content using the original response
            PrintWriter out = response.getWriter();
            out.write(sw.toString());
            //out.close();
        }
    }

    @Override
    public void destroy() {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
    }
}