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
	include_once('admin/classes/FilmeGenero.php');
	include_once('admin/classes/FilmeGeneroDAO.php');
	include_once('admin/classes/FilmeDiretor.php');
	include_once('admin/classes/FilmeDiretorDAO.php');

	$filme = new filme();
	$id = $_GET['id'];
	$filmeDAO = new FilmeDAO();
	$filme = $filmeDAO->get($id);
	$generos = $filmeDAO->getGeneros($id);
	$filmeGeneroDAO = new FilmeGeneroDAO();
	$generoDAO = new GeneroDAO();
	$diretorDAO = new DiretorDAO();
	$filmeDiretorDAO = new FilmeDiretorDAO();
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
				Diretor: <!-- <?= $filme->nome_diretor ?> -->
			</strong>

		</h3>
	</div>
</div>
<div class="row">
	<h3 class="filme_pag">Gênero:</h3>
</div>
<div class="row">
		<?php foreach($generos as $genero): ?>
		<span class="badge badge-primary filme_pag">
				<?= $genero->getNome() ?>
		</span>
		<?php endforeach; ?>
</div> 
<?php  
	include_once('layout/footer.php');
?>