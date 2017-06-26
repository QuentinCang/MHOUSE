<form action="../Models/capteurs.php" method="post" >
   <fieldset>
       <legend>Ajout de capteurs</legend>
    <p>
    <label for="nom_capteur">Le nom du capteur :</label>
    <input type="text" name="nom_capteur" id="nom_capteur" placeholder="capteur1" autofocus="" /> 
    <br />

       <label for="type_capteur">Type de capteurs :</label>
      <select name="type_capteur" id="type_capteur">
        <option value="lumiere">Lumière</option>
        <option value="temperature">Température</option>
    </select>
      <br />
<!--
       <label for="pass">Retapez votre mot de passe : </label>
        <input type="password" name="verify_pass" id="pass" placeholder="*********"/>
        <br /> -->

        <input type="submit" value="Envoyer" />
    </p>
   </fieldset>
</form>

<fieldset>
    <legend>Les capteurs :</legend>
<?php
try
{
    $bdd = new PDO('mysql:host=localhost;dbname=bdd;charset=utf8', 'root', '');
}
catch(Exception $e)
{
    die('Erreur : '.$e->getMessage());
}
// Récupération des 20 derniers messages
$reponse = $bdd->query('SELECT nom_capteur, type_capteur FROM capteurs ORDER BY id_capteur DESC LIMIT 0, 20');
while ($donnees = $reponse->fetch())
{
    echo '<p><strong>' . htmlspecialchars($donnees['nom_capteur']) . '</strong> : ' . htmlspecialchars($donnees['type_capteur']) . '</p>';
}
$reponse->closeCursor();
?>
</fieldset>
