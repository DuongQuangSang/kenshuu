/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication49;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author user
 */
public class FileWriterTest {
    public static void main(String args[]) {
    // Assigning the file content
        // Note: Custom contents taken as input to
        // illustrate

 
        // Try block to check for exceptions
        try {
 
            // Step 1: Create an object of BufferedWriter
            BufferedWriter f_writer
                = new BufferedWriter(new FileWriter(
                    "C:\\Users\\user\\Desktop\\sang\\test.txt",true));
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("duong");
            stringBuilder.append("\n");
            stringBuilder.append("quang");
            stringBuilder.append("\n");
            stringBuilder.append("sang");
            stringBuilder.append("\n");
            stringBuilder.append("java");
            
            
 
            // Step 2: Write text(content) to file
            f_writer.write(stringBuilder.toString());
 
            // Step 3: Printing the content inside the file
            // on the terminal/CMD
            System.out.print(stringBuilder.toString());
 
            // Step 4: Display message showcasing
            // successful execution of the program
            System.out.println(
                "File is created successfully with the content.");
 
            // Step 5: Close the BufferedWriter object
            f_writer.close();
        }
 
        // Catch block to handle if exceptions occurs
        catch (IOException e) {
 
            // Print the exception on console
            // using getMessage() method
            System.out.print(e.getMessage());
        }
    }
}
