<%-- 
    Document   : calculo
    Created on : 07/05/2021, 00:35:54
    Author     : Christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="tratarErro.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            try{
                String n1Txt, n2Txt;
                float n1 = 0f, n2 = 0f;
                
                n1Txt = request.getParameter("numero1");
                n2Txt = request.getParameter("numero2");
                        
                n1 = Float.parseFloat(n1Txt);
                n2 = Float.parseFloat(n2Txt);
                
                float result = 0;
                
                if(request.getParameter("operacao") != null){
                    if(request.getParameter("operacao").equals("adicao")){
                       result = n1 + n2;
                }
                
                if(request.getParameter("operacao").equals("subtracao")){
                        result = n1 - n2;
                }
                
                if(request.getParameter("operacao").equals("multiplicacao")){
                        result = n1 * n2;
                }
                
                if(request.getParameter("operacao").equals("divisao")){
                        result = n1 / n2;
                }
            }
                
                out.println(result);
                
            }catch(NumberFormatException ex){
                out.print("Erro.<br>Digite apenas números!");
            }
        %>
    </body>
</html>
