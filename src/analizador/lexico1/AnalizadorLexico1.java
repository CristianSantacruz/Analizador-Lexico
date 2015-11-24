package analizador.lexico1;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *INTEGRANTES:
 *  Quimbita Lilian
 *  Santacruz Cristian
 */
public class AnalizadorLexico1 {

    public static void main(String[] args) throws IOException {
        Interfaz interfaz = new Interfaz();
        String path = "C:/Users/Cristian/Desktop/Sistema Historial de Clientes/Analizador Lexico1/src/analizador/lexico1/Lex.flex";
	generarLexer(path);
       
        interfaz.probarLexer();       
        interfaz.guardar();
        interfaz.setVisible(true);
    }
    
    public static void generarLexer(String path) {
		File archivo = new File(path);
		jflex.Main.generate(archivo);
	}
}
