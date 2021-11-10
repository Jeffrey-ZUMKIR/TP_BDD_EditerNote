<?php
	session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../CSS/style.css">
	<style type="text/css">
		table, th, td{
			border:black solid 1px;
		}
	</style>
</head>
<body>
	<?php
		include 'fct_bdd.php';	

		define('USER',"root");
		define('PASSWD',"");
		define('SERVER',"localhost");
		define('BASE',"exlogin");

		//Connexion à la base
		$connexion = connect_bd();

		//Change chaque note qui doit etre editer
		if(isset($_POST["changeNote"])){
			$post=$_POST;
			if(!empty($post)){
				for ($i=0; $i < sizeof($post['idNote']); $i++) { 
					updateNote($connexion, $post['idNote'][$i], $post['val'][$i]);
				}
			}
			
		}
	?>

	<div class="row">
		<div class="column">

	<?php
		$note = getNote($connexion);

		//Form des notes possible à modifer
		echo '<form action="#" method="post" id="formModifNote">
			<table id="tabNote">
				<thead>
					<tr>
						<th>Matière</th>
						<th>Etudiant</th>
						<th>Note</th>
						<th>Editer</th>
					</tr>
				</thead>
				<tbody>';
		//Check si le tableau de note existe ou s'il n'est pas vide
		if(isset($note) and !empty($note)){
			//Affiche chaque note des élèves
			foreach ($note as $key => $value) {
				echo '<tr>
						<td class="colMat">'.$value["lib_matiere"].'</td>
						<td class="colEtud">'.$value["nom"].' '.$value["prenom"].'</td>
						<td class="colNote"><input type="number" name="val[]" min="0" max="20" value="'.$value["valeur"].'" disabled required></td>
						<td class="colEdit"><input type="checkbox" name="idNote[]" value="'.$value["id_note"].'" onchange="changeInputNote(this)"></td>
					</tr>';
			}
			
		//Si pas de valeur ou n'existe pas
		}else{
			echo '<tr>
					<td colspan="4">No data</td>
				</tr>';
		}
		


		echo '	</tbody>
			</table>
			<input type="submit" name="changeNote">
			</form>';

	?>
</div>
<div class="column">

	<?php
		$moy = getMoyenne($connexion);
		
		//Tableau des moyennes
		echo '<table id="tabMoy">
				<thead>
					<tr>
						<th>Matière</th>
						<th>Etudiant</th>
						<th>Moyenne</th>
					</tr>
				</thead>
				<tbody>';
		//Check si le tableau de note existe ou s'il n'est pas vide
		if(isset($moy) and !empty($note)){
			//Affiche chaque note des élèves
			foreach ($moy as $key => $value) {
				echo '<tr>
						<td class="colMat">'.$value["lib_matiere"].'</td>
						<td class="colEtud">'.$value["nom"].' '.$value["prenom"].'</td>
						<td class="colMoy">'.$value["moyenne"].'</td>
					</tr>';
			}
			
		//Si pas de valeur ou n'existe pas
		}else{
			echo '<tr>
					<td colspan="3">No data</td>
				</tr>';
		}
		


		echo '	</tbody>
			</table>';

	?>
</div>
</div>
	<script type="text/javascript">
		//Modifie le enabled de l'input number en fonction de si le checkbox est coché
		function changeInputNote(val){
			if(val.checked == true){
				val.parentNode.parentNode.querySelector('.colNote').querySelector("input").disabled = false;
			}else{
				val.parentNode.parentNode.querySelector('.colNote').querySelector("input").disabled = true;
			}
		}
		


	</script>


</body>
</html>