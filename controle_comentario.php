<?php 

require 'admin/classes/Comentario.php';
require 'admin/classes/ComentarioDAO.php';

$comentario = new Comentario();
$comentarioDAO = new ComentarioDAO();

$id_filme= $_GET['id'];


	$comentario->setComentario($_POST['comentario']);
	$comentario->setDataComentario($_POST['data_comentario']);

	$id = $comentarioDAO->insereComentario($comentario);
	$msg = 'comentario cadastrado com sucesso';

	header("Location: filme.php?id=$id_filme");