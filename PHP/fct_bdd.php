<?php

//Connection à la bdd
function connect_bd(){
	$dsn="mysql:dbname=".BASE.";host=".SERVER;
	try{
		$connexion=new PDO($dsn,USER,PASSWD);
	}
	catch(PDOException $e){
		printf("Echec de la connexion : %s\n", $e->getMessage());
		exit();
	}
	$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $connexion;
}

//Obtenir note d'un élève
function getNote($connexion){
	$req = 'SELECT lib_matiere, nom, prenom, valeur, id_note
			FROM matiere, compte, note
			WHERE matiere.id_matiere = note.id_matiere and compte.id_compte = note.id_compte
			ORDER BY nom, lib_matiere;';

	try{
		//Préparer et exécuter la requête
		$stmt = $connexion->query($req);
		//On récupère les données sous forme d'un tableau
		while($donnees = $stmt->fetch(PDO::FETCH_ASSOC)){
			$note[]=$donnees;
		}
		//On ferme la base
		$stmt->closeCursor();
		return $note;
	}
	catch(PDOException $e){
		echo "Erreur : ".$e->getMessage();
	}
}

//Modifer note
function updateNote($connexion, $idnote, $valeur){
	$req = 'UPDATE note
			SET valeur = :valeur
			WHERE id_note = :id_note;';

	try{
		$stmt = $connexion->prepare($req);

		$stmt->bindValue(':valeur',$valeur,PDO::PARAM_STR);
		$stmt->bindValue(':id_note',$idnote,PDO::PARAM_STR);

		$stmt->execute();

		$stmt->closeCursor();
	}
	catch(PDOException $e){
		echo "Erreur : ".$e->getMessage();
	}
}

//Obtenir moyenne des élèves par matiere
function getMoyenne($connexion){
	/*$req = 'SELECT lib_matiere, nom, prenom, ROUND(avg(valeur),2) as moyenne
			FROM matiere, compte, note
			WHERE matiere.id_matiere = note.id_matiere and compte.id_compte = note.id_compte
			GROUP BY lib_matiere, nom
			ORDER BY nom, lib_matiere;';*/
	$req = 'SELECT *
			FROM moyenne;';

	try{
		//Préparer et exécuter la requête
		$stmt = $connexion->query($req);
		//On récupère les données sous forme d'un tableau
		while($donnees = $stmt->fetch(PDO::FETCH_ASSOC)){
			$moy[]=$donnees;
		}
		//On ferme la base
		$stmt->closeCursor();
		return $moy;
	}
	catch(PDOException $e){
		echo "Erreur : ".$e->getMessage();
	}
}

//Fonction acceptant un nb variable d'argument
function test(... $var){

}


?>