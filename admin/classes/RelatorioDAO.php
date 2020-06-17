<?php
require_once 'Model.php';
class RelatorioDAO extends Model
{
	public function __construct()
    {
        parent::__construct();
    }
	public function contar($table = 'usuario', $condicao = '')
	{
		$where = '';
		if($condicao != ''){
			$where = "where {$condicao}";
		}
		$sql = "SELECT count(*) as total FROM {$table} {$where};";
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		return $stmt->fetch(PDO::FETCH_ASSOC);
	}
}