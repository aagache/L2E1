package wf;


import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author User
 */
public class WordFinderBean implements java.io.Serializable {
    String letters;
    List<String> words = new ArrayList<String>();
    
    public WordFinderBean() {
        
    }

    public WordFinderBean(String letters, List<String> words) {
        this.letters = letters;
        this.words = words;
    }

    public String getLetters() {
        return letters;
    }

    public void setLetters(String theLetters) {
        letters = theLetters;
    }

    public List<String> getWords() {
        return words;
    }

    public void setWords(List<String> theWords) {
        words = theWords;
    }
}
