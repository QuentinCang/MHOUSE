<?php
/**
 * Created by PhpStorm.
 * User: Aster
 * Date: 10/05/2017
 * Time: 14:16
 */
try
{
    $bdd = new PDO('mysql:host=localhost;dbname=bdd;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
}
catch (Exception $e)
{
    die('Erreur : ' . $e->getMessage());
}

//A RAJOUTER LE HASHAGE

// Insertion

$req=$bdd->prepare('INSERT INTO membres(pseudo, pass, email) VALUES(:pseudo,:pass,:email)');
// $req->execute(array($_POST['pseudo'], $_POST['pass'], $_POST['email']));       
$req->bindParam(':pseudo',$_POST['pseudo']);
$req->bindParam(':pass',$_POST['pass']);
$req->bindParam(':email',$_POST['email']);
$req->execute();


// On prend le marqueur :pseudo et on lui attribue le POST pseudo qui vient du champ pseudo



header('Location: ../index.php');