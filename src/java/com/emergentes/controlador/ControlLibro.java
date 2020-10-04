/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emergentes.controlador;

import com.emergentes.modelo.reglibros;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author wwwsd
 */
@WebServlet(name = "ControlLibro", urlPatterns = {"/ControlLibro"})
public class ControlLibro extends HttpServlet {

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
    HttpSession sesl = request.getSession();
    ArrayList<reglibros> lista = (ArrayList<reglibros>)sesl.getAttribute("listlib");
    //nuevo
    if(op == 1){
        reglibros p = new reglibros();
        request.setAttribute("miCur", p);
        request.getRequestDispatcher("editarl.jsp").forward(request, response);
    }
    //editar
    if(op == 2){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        
        reglibros p1=lista.get(pos);
        
        request.setAttribute("miCur", p1);
        request.getRequestDispatcher("editarl.jsp").forward(request, response);
    }
    
    //eliminar
    if(op==3){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        lista.remove(pos);
        sesl.setAttribute("listcurso",lista);
        response.sendRedirect("libros.jsp");
    }
    
}   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
   int id = Integer.parseInt(request.getParameter("id"));
   String titulo = request.getParameter("titulo");
   String autor = request.getParameter("autor");
   String resumen = request.getParameter("resumen");
   String medio = request.getParameter("medio");
   String nuevo = request.getParameter("nuevo");
   int pos;
   reglibros cur = new reglibros();
   
   cur.setId(id);
   cur.setTitulo(titulo);
   cur.setAutor(autor);
   cur.setResumen(resumen);
   cur.setMedio(medio);
   
   HttpSession ses = request.getSession();
   ArrayList<reglibros> lista = (ArrayList<reglibros>)ses.getAttribute("listlib");
   
   
   if(nuevo.equals("true")){
       lista.add(cur);
   }
   else{
       pos = buscarIndice(request,id);

       lista.set(pos,cur);
       
   }
   response.sendRedirect("libros.jsp");
   
}      
    private int buscarIndice(HttpServletRequest request, int id)
    {
        HttpSession ses = request.getSession();
        ArrayList<reglibros> lista = (ArrayList<reglibros>)ses.getAttribute("listlib");
        int i=0;
        if (lista.size()>0){
            while(i<lista.size()){
                if(lista.get(i).getId()==id){
                    break;
                }
                else i++;
            }
        }
        return i;
    }

}
