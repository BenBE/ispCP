<?php
class randoms{
	
	static function getInstance(){return new randoms();}

	public function __construct(){;}

	public function genereateRandom($length=24){
		$random='';
		for($i=1;$i<=$length;$i++){
			$select=rand(0,2);
			switch($select){
				case 0:
					$random.=chr(rand(97,122));
					break;
				case 1:
					$random.=chr(rand(65,90));
					break;
				case 2:
					$random.=chr(rand(48,57));
					break;
			}
		}
		return (time().$random);
	}
}
?>