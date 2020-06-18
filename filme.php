<?php 
	include_once('layout/header.php');
	include_once('layout/menu.php');
    include_once('admin/classes/Filme.php');
    include_once('admin/classes/FilmeDAO.php');
    include_once('admin/classes/Genero.php');
	include_once('admin/classes/GeneroDAO.php');
	include_once('admin/classes/Diretor.php');
	include_once('admin/classes/DiretorDAO.php');
	include_once('admin/classes/Avaliacao.php');
	include_once('admin/classes/AvaliacaoDAO.php');

	$filme = new filme();
	$id = $_GET['id'];
	$filmeDAO = new FilmeDAO();
	$filme = $filmeDAO->get($id);

	$generoDAO = new GeneroDAO();
	$genero = $generoDAO->get($filme->getGenero());

	$diretorDAO = new DiretorDAO();
	$diretor = $diretorDAO->get($filme->getDiretor());
?>

<iframe src="<?= ($filme->getUrl()) ?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<p>&nbsp;</p>
<div class="row">
	<div class="col-md-4">
		<img src="admin/assets/img/filme/<?= ($filme->getImagem()) ?>" class="filme_pag">
	</div>
	<div class="col-md-8">
		<h1 class="filme_pag"><?= ($filme->getNome()) ?></h1>
		<p class="filme_pag" style="text-align: justify;"><?= ($filme->getSinopse()) ?></p>
	</div>
</div>
<div class="row">
	<div class="col-md-4">
		<h3 class="filme_pag">
			<strong>
				Elenco: <?= ($filme->getElenco()) ?>				
			</strong>
		</h3>
		<h3 class="filme_pag">
			<strong>				
				Diretor: <?= ($diretor->getNome()) ?>
			</strong>
		</h3>
	</div>
</div>
<div class="row">
	<h3 class="filme_pag">Gênero:</h3>
</div>
<div class="row">
		<span class="badge badge-primary filme_pag">
				<?= ($genero->getNome()) ?>	
		</span>
</div>
<?php  
	include_once('layout/footer.php');
?>