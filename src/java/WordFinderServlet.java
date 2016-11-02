import java.io.BufferedReader;
import static java.io.FileDescriptor.err;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class WordFinderServlet extends HttpServlet {
    
    public static String[] getAllLists(String[] elements, int lengthOfList) {
        String[] allLists = new String[(int)Math.pow(elements.length, lengthOfList)];
        
        if(lengthOfList == 1) {
            return elements;
        } else {
            String[] allSublists = getAllLists(elements, lengthOfList - 1);
            int arrayIndex = 0;

            for(int i = 0; i < elements.length; i++){
                for(int j = 0; j < allSublists.length; j++){
                    allLists[arrayIndex] = elements[i] + allSublists[j];
                    arrayIndex++;
                }
            }
            return allLists;
        }
    }
    
    public List<String> getWords(String letters) throws FileNotFoundException {
        String words = "", line;
        String[] strings = letters.split("");
        List<String> wordList = new ArrayList<>();
        
        try (BufferedReader br = new BufferedReader(new FileReader("D:\\Facultate\\master Anul I\\Semestrul I\\Tehnologii Java\\2016\\L2E1\\src\\java\\en_words.txt"));
             FileWriter logFile = new FileWriter("D:\\Facultate\\master Anul I\\Semestrul I\\Tehnologii Java\\2016\\L2E1\\src\\java\\log.txt", true)) {    
            
//            logFile.append("\n");
//            logFile.append("input: " + letters);
//            logFile.append("\n");
            
            while ((line = br.readLine()) != null) {
                for(int i = 1; i < strings.length; i++) { 
                    String[] result = getAllLists(strings, i);
                    
                    for(int j=0; j < result.length; j++) {
                        if(result[j].length() > 1 && line.contains(result[j])) {
                           words += "\n" + line;
                           logFile.append(line);
                           logFile.append("\n");
                           wordList.add(words);
                       }   
                    }   
                }
            }
        } catch(IOException ioe){
            words += ioe;
        }
        
        return wordList;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String letters = request.getParameter("letters");
        List<String> wordsList = getWords(letters);

        WordFinderBean wf = new WordFinderBean(letters, wordsList);
        response.setContentType("text/plain");
        request.setAttribute("bean", wf);
        request.getRequestDispatcher("/app/result.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (PrintWriter out = response.getWriter()) {        
            out.println("POST request");
            out.close();
        }
    }
}