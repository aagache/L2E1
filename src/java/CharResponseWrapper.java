
import java.io.CharArrayWriter;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author User
 */
public class CharResponseWrapper extends HttpServletResponseWrapper {
    private CharArrayWriter output;
    
    public CharResponseWrapper(HttpServletResponse response) {
        super(response);
        output = new CharArrayWriter();
    }
    
    @Override
    public PrintWriter getWriter(){
        // Hide the original writer
        return new PrintWriter(output);
    }
    
    public String toString() {
        return output.toString();
    }
}