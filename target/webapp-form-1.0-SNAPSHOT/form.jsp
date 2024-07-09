<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
 Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>TAREA 39 Registro de Productos</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h3>TAREA 39 Registro de Productos</h3>

<%
if(errores != null && errores.size()>0){
%>
<ul class="alert alert-danger mx-5 px-5">
<% for(String error: errores.values()){%>
<li><%=error%></li>
<%}%>
</ul>
<%}%>
<div class="px-5">
<form action="/webapp-form/crear" method="post">

  <div class="row mb-3">
    <label for="nombre" class="col-form-label col-sm-2">Nombre</label>
    <div class="col-sm-4">
        <input type="text" name="nombre" id="nombre" class="form-control" value="${param.nombre}">
    </div>
  <%
    if(errores != null && errores.containsKey("nombre")){
        out.println("<div class='row mb-3 alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("nombre") + "</div>");
  }
  %>
  </div>

  <div class="row mb-3">
    <label for="precio" class="col-form-label col-sm-2">Precio</label>
    <div class="col-sm-4">
        <input type="text" name="precio" id="precio" class="form-control" value="${param.precio}">
    </div>
    <%
       if(errores != null && errores.containsKey("precio")){
            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("precio") + "</small>");
       }
    %>
  </div>

  <div class="row mb-3">
    <label for="fabricante" class="col-form-label col-sm-2">Fabricante</label>
    <div class="col-sm-4">
        <input type="text" name="fabricante" id="fabricante" class="form-control" value="${param.fabricante}">
    </div>
    <%
       if(errores != null && errores.containsKey("fabricante")){
            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("fabricante") + "</small>");
       }
    %>
  </div>

  <div class="row mb-3">
    <label for="categoria" class="col-form-label col-sm-2">Categoría</label>
    <div class="col-sm-4">
      <select name="categoria" id="categoria" class="form-select">
        <option value="">-- seleccionar --</option>
        <option value="C1" ${param.categoria.equals("C1")? "selected": ""}>Categoría 1</option>
        <option value="C2" ${param.categoria.equals("C2")? "selected": ""}>Categoría 2</option>
        <option value="C3" ${param.categoria.equals("C3")? "selected": ""}>Categoría 3</option>
        <option value="C4" ${param.categoria.equals("C4")? "selected": ""}>Categoría 4</option>
        <option value="C5" ${param.categoria.equals("C5")? "selected": ""}>Categoría 5</option>
      </select>
    </div>
    <%
        if(errores != null && errores.containsKey("categoria")){
             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("categoria") + "</small>");
        }
        %>
  </div>

  <div class="row mb-3">
    <div>
      <input type="submit" value="Enviar" class="btn btn-primary">
    </div>
  </div>
</form>
</div>
</body>
</html>