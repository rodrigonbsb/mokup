<?php
require_once 'Model.php';

class UsuarioDAO extends Model
{
	public function __construct() 
	{
		parent::__construct();
		$this->tabela = 'usuario';
		$this->class = 'Usuario';
	}

	public function insereUsuario(Usuario $usuario) {
		$values = "null,
				  '{$usuario->getNome()}',
				  '{$usuario->getDataNascimentoBD()}',
				  '{$usuario->getEmail()}',
				  '{$usuario->getTipo()}',
				  '{$usuario->getSenha()}',
				  '{$usuario->getImagem()}'
				  ";
		return $this->inserir($values);
	}

	public function alteraUsuario(Usuario $usuario) 
	{
		$altera_senha = ($usuario->getSenha() != '' ? ", senha = '{$usuario->getSenha()}'" : '');
		$altera_imagem = ($usuario->getImagem() != '' ? ", imagem = '{$usuario->getImagem()}'" : '');

		$values = "nome = '{$usuario->getNome()}',
					dataNascimento = '{$usuario->getDataNascimentoBD()}',
					email = '{$usuario->getEmail()}',
					tipo = '{$usuario->getTipo()}'
					{$altera_imagem}
					{$altera_senha}";
		$this->alterar($usuario->getId(), $values);
	}

    public function getLogin($email, $senha)
    {
    	$sql = "SELECT * FROM {$this->tabela} 
                WHERE email = :email AND senha = :senha AND tipo = 1;";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':senha', $senha);
    	$stmt->setFetchMode(PDO::FETCH_CLASS, $this->class);
    	$stmt->execute();
    	return $stmt->fetch();
    }

    public function getLoginUsuario($email, $senha)
    {
        $sql = "SELECT * FROM {$this->tabela} 
                WHERE email = :email AND senha = :senha;";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':senha', $senha);
        $stmt->setFetchMode(PDO::FETCH_CLASS, $this->class);
        $stmt->execute();
        return $stmt->fetch();
    }
    
	public function listar($pesquisa = '')
	{
		if ($pesquisa != '') {
			$sql = "SELECT * FROM {$this->tabela}
					WHERE nome like '%{$pesquisa}%'
						OR dataNascimento like '%{$pesquisa}%'
						OR email like '%{$pesquisa}%'";
		} else {
			$sql = "SELECT * FROM {$this->tabela}";
		}
		$stmt = $this->db->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_CLASS, $this->class);
		$stmt->execute();
		return $stmt->fetchAll();
	}
}