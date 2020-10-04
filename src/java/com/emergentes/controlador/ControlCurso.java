/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emergentes.controlador;

import com.emergentes.modelo.inscurso;
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
@WebServlet(name = "ControlCurso", urlPatterns = {"/ControlCurso"})
public class ControlCurso extends HttpServlet {

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
    HttpSession ses = request.getSession();
    ArrayList<inscurso> lista = (ArrayList<inscurso>)ses.getAttribute("listcurso");
    //nuevo
    if(op == 1){
        inscurso p = new inscurso();
        request.setAttribute("miCur", p);
        request.getRequestDispatcher("editarc.jsp").forward(request, response);
    }
    //editar
    if(op == 2){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        
        inscurso p1=lista.get(pos);
        
        request.setAttribute("miCur", p1);
        request.getRequestDispatcher("editarc.jsp").forward(request, response);
    }
    
    //eliminar
    if(op==3){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        lista.remove(pos);
        ses.setAttribute("listcurso",lista);
        response.sendRedirect("curso.jsp");
    }
    
}   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
   int id = Integer.parseInt(request.getParameter("id"));
   String nombre = request.getParameter("nombre");
   String apellido = request.getParameter("apellido");
   String curso = request.getParameter("curso");
   String nuevo = request.getParameter("nuevo");
   int pos;
   inscurso cur = new inscurso();
   
   cur.setId(id);
   cur.setNombre(nombre);
   cur.setApellido(apellido);
   cur.setCurso(curso);
   
   HttpSession ses = request.getSession();
   ArrayList<inscurso> lista = (ArrayList<inscurso>)ses.getAttribute("listcurso");
   
   
   if(nuevo.equals("true")){
       lista.add(cur);
   }
   else{
       //editar
       // buscar el elemento en la coleccion
       pos = buscarIndice(request,id);
       // reemplazar
       lista.set(pos,cur);
       
   }
   response.sendRedirect("curso.jsp");
   
}      
    private int buscarIndice(HttpServletRequest request, int id)
    {
        HttpSession ses = request.getSession();
        ArrayList<inscurso> lista = (ArrayList<inscurso>)ses.getAttribute("listcurso");
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
