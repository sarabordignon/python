#importa a biblioteca 
#serve para conectar o banco de dados python
import mysql.connector

#executa uma funcao da lib (biblioteca) que realiza a conexao
conexao = mysql.connector.connect(
#parametros de conexao ao banco de dados
    host = "localhost",
    user = "root",
    password = "",
    database = "oficina"
)

print ("conectado")

#funcao cursor() da lib
#serve para manipular os dados de envio para o banco
cursor = conexao.cursor()

#comandos e valores para envio de dados em sql
sql = "INSERT INTO funcionarios (nome, funcao, turno, telefone) VALUES (%s, %s, %s, %s)"
values = ("pedrinho", "soldador", "manha", 123456162)

#executar cursor
cursor.execute(sql, values)
conexao.commit()

#exibir lista sql
cursor.execute("SELECT * FROM funcionarios")

#organizar
resultados = cursor.fetchall()

#exibir
for i in resultados:
    print (i)
