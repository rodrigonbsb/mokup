<?php include 'layout/header.php';?>
<?php include 'layout/menu.php';?>

<?php

require 'admin/classes/Usuario.php';
require 'admin/classes/UsuarioDAO.php';

$usuario = new Usuario();
	if(isset($_GET['id_usuario']) && $_GET['id_usuario'] != '') {
		$id = $_GET['id_usuario'];
		$usuarioDAO = new UsuarioDAO();
		$usuario = $usuarioDAO->get($id);
	}
?>
<div class="container">
	<div class="row" style="margin-top:40px">
		<div class="col-6 offset-3">
			<h2>Perfil do usuário <?= ($_SESSION['nome']) ?></h2>
		</div>
		</div>
			<form action="controle_usuario.php?acao=<?= ( $usuario->getId() != '' ? 'editar' : 'cadastrar' )?>" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-3 text-center">
						<img src="./assets/img/usuario/<?= ($usuario->getImagem() != '' && file_exists('assets/img/usuario/'.$usuario->getImagem()) ? $usuario->getImagem() : 'usuario.png') ?>" alt="" width="150" class="rounded-circle img-thumbnail" id="fotopreview">
						<br>
						<br>
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="imagem" id="imagem">
							<label class="custom-file-label" for="imagem">Escolher...</label>
						</div>
					</div>
					<div class="col">		
						<div class="form-group">
							<label for="nome">Nome</label>
							<input type="text" class="form-control" name="nome" id="nome" required value="<?=($usuario->getNome() != '' ? $usuario->getNome() : '')?>">
						</div>
								
						<div class="form-group">
							<label for="dataNascimento">Data de nascimento</label>
							<input type="date" class="form-control" name="dataNascimento" id="dataNascimento" value="<?=($usuario->getDataNascimento() != '' ? $usuario->getDataNascimentoBD() : '')?>">
						</div>
								
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" class="form-control" name="email" id="email" required value="<?=($usuario->getEmail() != '' ? $usuario->getEmail() : '')?>">
						</div>
								
						<div class="form-group">
							<label for="password">Senha</label>
							<input type="password" class="form-control" name="senha" id="senha" <?= ($usuario->getId() == '' ? ' required' : '' ) ?>>
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-primary">Salvar</button>
							<button type="reset" class="btn btn-warning">Resetar</button>
						</div>
					</div>
			</form>
		</div>
	</div>




<?php  
	include_once('layout/footer.php');
?>