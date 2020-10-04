/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emergentes.controlador;

import com.emergentes.modelo.regus;
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
@WebServlet(name = "ControlUsuario", urlPatterns = {"/ControlUsuario"})
public class ControlUsuario extends HttpServlet {

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
    HttpSession sesu = request.getSession();
    ArrayList<regus> lista = (ArrayList<regus>)sesu.getAttribute("listus");
    //nuevo
    if(op == 1){
        regus p = new regus();
        request.setAttribute("miCur", p);
        request.getRequestDispatcher("editaru.jsp").forward(request, response);
    }
    //editar
    if(op == 2){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        
        regus p1=lista.get(pos);
        
        request.setAttribute("miCur", p1);
        request.getRequestDispatcher("editaru.jsp").forward(request, response);
    }
    
    //eliminar
    if(op==3){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        lista.remove(pos);
        sesu.setAttribute("listus",lista);
        response.sendRedirect("usuarios.jsp");
    }
    
}   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
   int id = Integer.parseInt(request.getParameter("id"));
   String nombre = request.getParameter("nombre");
   String apellido = request.getParameter("apellido");
   String correo = request.getParameter("correo");
   String contra = request.getParameter("contra");
   String nuevo = request.getParameter("nuevo");
   int pos;
   regus cur = new regus();
   
   cur.setId(id);
   cur.setNombre(nombre);
   cur.setApellido(apellido);
   cur.setCorreo(correo);
   cur.setContraseña(contra);
   
   HttpSession sesu = request.getSession();
   ArrayList<regus> lista = (ArrayList<regus>)sesu.getAttribute("listus");
   
   
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
   response.sendRedirect("usuarios.jsp");
   
}      
    private int buscarIndice(HttpServletRequest request, int id)
    {
        HttpSession sesu = request.getSession();
        ArrayList<regus> lista = (ArrayList<regus>)sesu.getAttribute("listus");
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
