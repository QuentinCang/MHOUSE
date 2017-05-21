<?php
/**
 * Created by PhpStorm.
 * User: Aster
 * Date: 16/05/2017
 * Time: 15:16
 */



function afficheProfil(){
    $bdd=connexionBdd();
    $req = $bdd->prepare('SELECT pseudo, prenom, nom, adresse, sexe, date_naissance, email FROM utilisateur
WHERE id_utilisateur= ? ');
    $req=execute(array(
        $_POST['id_utilisateur']
    ));
    while ($donnees = $req->fetch()) {
        echo '<p>' . htmlspecialchars($donnees['pseudo']) . htmlspecialchars($donnees['prenom']) . htmlspecialchars($donnees['nom']) .
            htmlspecialchars($donnees['adresse']) . htmlspecialchars($donnees['sexe']) . htmlspecialchars($donnees['date_naissance']) .
            htmlspecialchars($donnees['email']) . '</p>';
    }
    $req->closeCursor();
}

// UTILISER LA FONCTION QUI REGARDE SI LE PSEUDO EST LIBRE

function updateProfil()
{
    $bdd=connexionBdd();
    $requpdate = $bdd->prepare('
UPDATE utilisateur 
SET pseudo = :nv_pseudo, prenom = :nv_prenom, nom = :nv_nom, adresse = :nv_adresse, sexe = :nv_sexe, date_naissance = :date_naissance, email = :nv_email, numero_tel = :numero_tel
WHERE id_utilisateur = :id_utilisateur ');
    $requpdate -> execute(array(
        'nv_pseudo' => $_POST['pseudo'],
        'nv_prenom' => $_POST['prenom'],
        'nv_nom' => $_POST['nom'],
        'nv_adresse' => $_POST['adresse'],
        'nv_sexe' => $_POST['sexe'],
        'date_naissance' => $_POST['date_naissance'],
        'nv_email' => $_POST['email'],
        'id_utilisateur' => $_SESSION['id_utilisateur'],
        'numero_tel' => $_SESSION['numero_tel']
    ));
}
