<%@page language="java" import="java.sql.*" %>

<%
    // cria as variaveis e armazena as informações digitadas pelo usuario
    String vnome  = request.getParameter("txtNome");
    String vsobrenome = request.getParameter("txtSobrenome");
    String vemail  = request.getParameter("txtEmail");
    String vsenha = request.getParameter("password");
    String vconfirmas = request.getParameter("confirmpassword");
    String vdate = request.getParameter("date");
    String vendereco = request.getParameter("txtAdress");
    String vtelefone = request.getParameter("nunTell");
    String vgenero = request.getParameter("male");

    // variaveis para o banco de dados
    String banco    = "aula";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "INSERT INTO usuario (nome,sobrenome,email,senha,confirmpassword,datanasc,endereco,telefone,genero) values(?,?,?,?,?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setString(2, vsobrenome);
    stm.setString(3, vemail);
    stm.setString(4, vsenha);
    stm.setString(5, vconfirmas);
    stm.setString(6, vdate);
    stm.setString(7, vendereco);
    stm.setString(8, vtelefone);
    stm.setString(9, vgenero);

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>");
    out.print("<a href='final.html'>Voltar</a>");
%>