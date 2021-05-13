<%-- 
    Document   : index
    Created on : 07/05/2021, 00:17:09
    Author     : Christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Suporte.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto JSP</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
        <style>
            #nome{display: none;}  
            #senha{
                display: none;
                margin-left: 5px;
            }
            #email{
                display: none;
                margin: 0 5px 0 5px;
            }
            #verNome{
                display: none;
                margin-right: 200px;
            }
            #verSenha{
                display: none;
                margin-right: 100px;
            }
            #verEmail{
                display: none;
                margin-right: 50px;
            }
            #card{
                background-color: lightgrey;
                margin-top: 15px;
            }
            .cadastro{float: left;}
            p{color: white;}
            #enviar{display: none;}
            #result{background-color: whitesmoke;}            
            #numero1{margin-left: 50px;}
            #numero2{margin-left: 50px;}
            #op{margin-left: 65px;}
            #radio{margin-left: 65px;}
            #enviaCalc{margin-left: 70px;}
            #limpar{margin-left: 5px;}
        </style>
        <script>
            var v = 0;
            var p = 0;
            function mostraDados() {
                document.getElementById("verNome").style.display = "block";
                document.getElementById("verEmail").style.display = "block";
            }
            function escondeCadastro() {
                if (v === 0) {
                    v++;
                    document.getElementById("enviar").style.display = "block";
                    document.getElementById("dados").style.display = "none";
                    document.getElementById("nome").style.display = "block";
                    document.getElementById("senha").style.display = "block";
                    document.getElementById("email").style.display = "block";
                } else {
                    v--;
                    document.getElementById("enviar").style.display = "none";
                    document.getElementById("dados").style.display = "block";
                    document.getElementById("nome").style.display = "none";
                    document.getElementById("senha").style.display = "none";
                    document.getElementById("email").style.display = "none";
                }
            }
            function limpaCalculadora() {
                document.getElementById("result").contentWindow.document.write();
                document.getElementById("numero1").value = "";
                document.getElementById("numero2").value = "";
            }
        </script>
    </head>
    <body>

        <nav class="navbar navbar-light bg-dark">        
            <div class="container">
                <p>Calculadora</p>
                <form method="get">
                    <input type="text" class="cadastro" id="nome" name="nome" placeholder="Digite seu nome">
                    <input type="password" class="cadastro" id="senha" name="senha" placeholder="Digite sua senha">
                    <input type="email" class="cadastro" id="email" name="email" placeholder="Digite seu email">
                    <input type="submit" class="btn btn-primary" name="enviar" id="enviar" value="Cadastrar">
                </form>
                <button id="dados" class="btn btn-primary" onclick="mostraDados();
                escondeCadastro()">Cadastrar</button>
                <%
                     List<Usuario> u = new ArrayList<Usuario>();
                    u.add(new Usuario(request.getParameter("nome"), request.getParameter("senha"), request.getParameter("email")));
            
                    for(Usuario valor: u){
                        out.print("<p id='verNome'>"+"Nome: "+ valor.getNome()+"</p>");
                        out.print("<p id='verSenha'>"+"Senha: "+valor.getSenha()+"</p>");
                        out.print("<p id='verEmail'>"+"Email: "+ valor.getEmail()+"</p>");
                    }
                %>
            </div>
        </nav>


        <div class="container" id="div_resultado">
            <div class="row align-items-center justify-content-center">
                <div id="card" class="card">
                    <div class="card-body">
                        <iframe id="result" name="result" width="250" height="50"></iframe>
                    </div><br>
                    <div id="divCalculadora">
                        <form action="calculo.jsp" method="get" target="result">
                            <div class="mb-3">
                                <input type="text" id="numero1" name="numero1" placeholder="Digite o primeiro número">
                            </div>
                            <div class="mb-3">
                                <input type="text" id="numero2" name="numero2" placeholder="Digite o segundo número">
                            </div>
                            <div class="mb-3">
                                <label id="op">Selecione a operação</label>

                                <div id="radio" class="form-check">
                                    <input type="radio"  name="operacao" value="adicao" checked>
                                    <label class="form-check-label">+</label>
                                    <input type="radio" name="operacao" value="subtracao">
                                    <label class="form-check-label">-</label>
                                    <input type="radio" name="operacao" value="multiplicacao">
                                    <label class="form-check-label">x</label>
                                    <input type="radio" name="operacao" value="divisao">
                                    <label class="form-check-label">/</label>
                                </div>
                            </div>    
                            <div class="btn-group btn-group-horizontal">
                                <input type="submit" class="btn btn-success" id="enviaCalc" name="enviar" value="Calcular">
                                </form>
                                <button id="limpar" class="btn btn-danger" onclick="limpaCalculadora()">AC</button>
                            </div><br><br>
                        </div>
                    </div>
                </div>
            </div>

    </body>
</html>
