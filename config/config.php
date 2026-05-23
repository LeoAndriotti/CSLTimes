<?php 
require_once dirname(__DIR__) . '/classes/BancoDeDados.php';
$banco_de_dados = new BancoDeDados();
$banco = $banco_de_dados->obterConexao();
?>