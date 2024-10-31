<%@page import="org.alunos.Aluno"%>
<%@page import="org.alunos.AlunoDAO"%>
<%@page import="org.libertas.Pessoa"%>
<%@page import="org.libertas.PessoaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gravar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
	body {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		background-color: #f9f9f9;
	
	}
	
	.conteudoTela {
		background-color: white;
		padding: 20px;
		border-radius: 10px;
		box-shadow: 0 2px 6px 0px rgba(0, 0, 0, 0.15);
		width: 550px
	}
	
	h1 {
		margin-bottom:20px;
		text-align: center;
		font-size: 32px;
	}
	
	
	button a {
		text-decoration: none;
		color: white;
	}
	.botoes {
	    display: flex;
	    flex-direction: column;
		gap: 20px;
	}
</style>
</head>
<body>
	<%
		String tituloTela = "Aluno adicionado com sucesso!";
		AlunoDAO dao = new AlunoDAO();
		Aluno a = new Aluno();
		a.setIdaluno(Integer.parseInt(request.getParameter("idaluno")));
		a.setNome(request.getParameter("nome"));
		a.setTelefone(request.getParameter("telefone"));
		a.setEmail(request.getParameter("email"));
		a.setCurso(request.getParameter("curso"));
		
		if (a.getIdaluno() > 0) {
			dao.alterar(a);
			tituloTela = "Aluno atualizado com sucesso!";
		} else {
			dao.inserir(a);
			tituloTela = "Aluno adicionado com sucesso!";
		}
		
	%>
	
	<div class="conteudoTela">
		<h1><%= tituloTela %></h1>
		<div class="botoes">
			<button type="button" class="btn btn-primary" onclick="window.location.href='index.jsp';">
					P�gina inicial
			</button>
			<button type="button" class="btn btn-primary" onclick="window.location.href='listar.jsp';">
					Listar alunos
			</button>
			
		</div>
	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>