<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 21/05/2017
 * Time: 21:08
 */

require'../Models/contactAdmin.php';
$donnees=contactAdmin();


?>
<div class="block">
    <div> <img src="../public/images/18678848_1664162940290601_2025009995_n.png" width="24" height="24"> <?php echo $donnees['adresse']?></div>
    <div> <img src="../public/images/18643553_1664162936957268_1022541758_n.png" width="24" height="24"> <?php echo $donnees['numero_tel']?></div>
    <div> <img src="../public/images/18622995_1664162933623935_1982767871_n.png" width="24" height="24"> <?php echo $donnees['email']?></div>
</div>
<br />
<div class="map">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2625.6723360750684!2d2.3259462154355663!3d48.845388409576486
    !2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e671ce3fd4afd3%3A0xb729389a530d1380!2s28+Rue+Notre+Dame+des+Champs%2C+75006
    +Paris!5e0!3m2!1sfr!2sfr!4v1495021372339" width="1000" height="500" frameborder="5" style="border:0" allowfullscreen></iframe>
</div>