<?php

$x = 200;
$y = 50;
// Schritt 1:
$img = ImageCreate($x, $y);
// Schritt 2:
$php_blau = imageColorAllocate($img, 119, 123, 180);
// Schritt 3:
imageFilledRectangle($img, 0, 0, $x, $y, $php_blau);
// Schritt 4: Grafik im Browser ausgeben
header('Content-type: image/png');
imagePng($img);

// Speicher freigeben
imageDestroy($img);

?>
