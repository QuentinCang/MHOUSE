<?php
/**
 * Created by PhpStorm.
 * User: Aster
 * Date: 14/05/2017
 * Time: 21:16
 */


function creationPieces(){
    try {
        $bdd = new PDO('mysql:host=localhost;dbname=mhouse_bdd;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }
// Insertion
    $req = $bdd->prepare('INSERT INTO piece(nom_piece,id_utilisateur) VALUES(:nom_piece,:id_utilisateur)');
    $req->bindParam(':nom_piece', $_POST['nom_piece']);
    $req->bindParam(':id_utilisateur', $_SESSION['id_utilisateur']);
    $req->execute();
}
//../Views/pieces.php');


function affichePieces()
{
    try {
        $bdd = new PDO('mysql:host=localhost;dbname=mhouse_bdd;charset=utf8', 'root', '');
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }
    $reponse = $bdd->query('SELECT nom_piece FROM piece ORDER BY ID');
    // Affichage de chaque message (toutes les données sont protégées par htmlspecialchars)
    while ($donnees = $reponse->fetch()) {
        echo '<p>' . htmlspecialchars($donnees['nom_piece']) . '</p>';
    }
    $reponse->closeCursor();
}

function affichePiecesMenu()
{
    try {
        $bdd = new PDO('mysql:host=localhost;dbname=mhouse_bdd;charset=utf8', 'root', '');
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }
    $req = $bdd->prepare('SELECT * FROM piece WHERE id_utilisateur = :id_utilisateur ');
    $req->execute(array('id_utilisateur' => $_SESSION['id_utilisateur']));
    while ($donnees = $req->fetch()) {
        echo '<option value="'.htmlspecialchars($donnees['id_piece']) . '">'.htmlspecialchars($donnees['nom_piece']) .'</option>';
    }
    $req->closeCursor();
}
