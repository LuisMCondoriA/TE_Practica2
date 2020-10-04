/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emergentes.controlador;

import com.emergentes.modelo.regprod;
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
@WebServlet(name = "ControlProducto", urlPatterns = {"/ControlProducto"})
public class ControlProducto extends HttpServlet {

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
    HttpSession sesp = request.getSession();
    ArrayList<regprod> lista = (ArrayList<regprod>)sesp.getAttribute("listprod");
    //nuevo
    if(op == 1){
        regprod p = new regprod();
        request.setAttribute("miCur", p);
        request.getRequestDispatcher("editarp.jsp").forward(request, response);
    }
    //editar
    if(op == 2){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        
        regprod p1=lista.get(pos);
        
        request.setAttribute("miCur", p1);
        request.getRequestDispatcher("editarp.jsp").forward(request, response);
    }
    
    //eliminar
    if(op==3){
        id=Integer.parseInt(request.getParameter("id"));
        pos=buscarIndice(request,id);
        lista.remove(pos);
        sesp.setAttribute("listprod",lista);
        response.sendRedirect("productos.jsp");
    }
    
}   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
   int id = Integer.parseInt(request.getParameter("id"));
   String producto = request.getParameter("producto");
   String categoria = request.getParameter("categoria");
   int existencia = Integer.parseInt(request.getParameter("existencia"));
   int precio = Integer.parseInt(request.getParameter("precio"));
   String nuevo = request.getParameter("nuevo");
   int pos;
   regprod cur = new regprod();
   
   cur.setId(id);
   cur.setProducto(producto);
   cur.setCategoria(categoria);
   cur.setExistencia(existencia);
   cur.setPrecio(precio);
   
   HttpSession sesp = request.getSession();
   ArrayList<regprod> lista = (ArrayList<regprod>)sesp.getAttribute("listprod");
   
   
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
   response.sendRedirect("productos.jsp");
   
}      
    private int buscarIndice(HttpServletRequest request, int id)
    {
        HttpSession sesp = request.getSession();
        ArrayList<regprod> lista = (ArrayList<regprod>)sesp.getAttribute("listprod");
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
