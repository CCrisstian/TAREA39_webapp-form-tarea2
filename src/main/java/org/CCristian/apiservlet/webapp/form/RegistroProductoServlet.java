package org.CCristian.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/crear")
public class RegistroProductoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String nombre = req.getParameter("nombre");
        String precioStr = req.getParameter("precio");
        String fabricante = req.getParameter("fabricante");
        String categoria = req.getParameter("categoria");
        int precio = 0;
        boolean habilitar = req.getParameter("habilitar") != null && req.getParameter("habilitar").equals("on");

        Map<String, Object> errores = new HashMap<>();

        if (nombre == null || nombre.isBlank()) {
            errores.put("nombre", "El Nombre es requerido!");
        }

        if (precioStr == null || precioStr.isBlank()) {
            errores.put("precio", "El Precio no puede ser vacío!");
        } else {
            try {
                precio = Integer.parseInt(precioStr);
            } catch (NumberFormatException e) {
                errores.put("precio", "El Precio debe ser un número entero válido!");
            }
        }
        if (fabricante == null || fabricante.isBlank()) {
            errores.put("fabricante", "El fabricante es requerido!");
        } else if (!fabricante.matches("^.{4,10}$")) {
            errores.put("fabricante", "El Fabricante debe tener entre 4 y 10 caracteres!");
        }
        if (categoria == null || categoria.equals("") || categoria.equals(" ")) {
            errores.put("categoria", "La categoria es requerida!");
        }
        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("    <head>");
                out.println("        <meta charset=\"UTF-8\">");
                out.println("        <title>TAREA 39 - Resultado Registro de Productos</title>");
                out.println("    </head>");
                out.println("    <body>");
                out.println("        <h1>TAREA 39 - Resultado Registro de Productos</h1>");
                out.println("        <ul>");
                out.println("            <li>Nombre: " +nombre+"</li>");
                out.println("            <li>Precio: " +precio+"</li>");
                out.println("            <li>Fabricante: "+fabricante+"</li>");
                out.println("            <li>Categoría: "+categoria+"</li>");
                out.println("        </ul>");
                out.println("    </body>");
                out.println("</html>");
            }
        } else {
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
        }
    }
}
