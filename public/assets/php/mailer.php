<?php
    $from       = $_SERVER['argv'][1];
    $fromName   = $_SERVER['argv'][2];
    $to         = $_SERVER['argv'][3];
    $subject    = $_SERVER['argv'][4];
    $message    = $_SERVER['argv'][5];
    
    require('phpmailer/class.phpmailer.php');
    
    //Instanz von PHPMailer bilden
    $mail = new PHPMailer();
						
    //Absenderadresse der Email setzen
    $mail->From = $from;
						
    //Name des Abenders setzen
    $mail->FromName = $fromName;

    //Empfängeradresse setzen
    $mail->AddAddress($to);
						  
    //Betreff der Email setzen
    $mail->Subject = $subject;
						
    //Text der EMail setzen
    $mail->Body  = $message;
									 
    $mail->IsHTML(true);
    //EMail senden und überprüfen ob sie versandt wurde
    if(!$mail->Send()){
        //$mail->Send() liefert FALSE zurück: Es ist ein Fehler aufgetreten
        echo "false";
    } else {
        //$mail->Send() liefert TRUE zurück: Die Email ist unterwegs
        echo "true";
    }
?>
