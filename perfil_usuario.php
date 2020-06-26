<?php include_once 'layout/header.php';?>
<?php include_once 'layout/menu.php';?>

<?php

require 'admin/classes/Usuario.php';
require 'admin/classes/UsuarioDAO.php';

$usuario = new Usuario();
	if(isset($_GET['id']) && $_GET['id'] != '') {
		$id = $_GET['id'];
		$usuarioDAO = new UsuarioDAO();
		$usuario = $usuarioDAO->get($id);
	}
?>
<div class="container">
	<div class="row perfil">
		<div class="col">
			<h2>Perfil do usuário <?= ($usuario->getNome()) ?></h2>
		</div>
	</div>
	<form  action="controle_usuario.php?acao=>editar">
		<div class="col text-center perfil">
			<img src="admin/assets/img/usuario/<?= (($usuario->getImagem()) != '' && file_exists('admin/assets/img/usuario/'.$usuario->getImagem()) ? $usuario->getImagem() : 'usuario.png') ?>" alt="" width="150" class="rounded-circle img-thumbnail" id="fotopreview">
			<br>
			<br>
			<div class="custom-file">
				<input type="file" class="custom-file-input" name="imagem" id="imagem">
				<label class="custom-file-label" for="imagem">Trocar Imagem</label>
			</div>
		</div>
		<div class="col perfil">	
			<div class="form-group">
				<label for="nome">Nome</label>
				<input type="text" class="form-control" name="nome" id="nome" required value="<?=(($usuario->getNome()))?>">
			</div>		
			<div class="form-group">
				<label for="dataNascimento">Data de nascimento</label>
				<input type="date" class="form-control" name="dataNascimento" id="dataNascimento" value="<?=($usuario->getDataNascimentoBD())?>">
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

<?php  
	include_once('layout/footer.php');
?>
<script type="text/javascript">
var uploadfoto = document.getElementById('imagem');
var fotopreview = document.getElementById('fotopreview');

uploadfoto.addEventListener('change', function(e) {
	fotopreview.src = '/assets/img/loading.gif';
    showThumbnail(this.files);
});

function showThumbnail(files) {
    if (files && files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
       fotopreview.src = e.target.result;
    }

        reader.readAsDataURL(files[0]);
    }
}

</script>