<?php
class errors {

	public static function getInstance(){
		static $instance = null;
		if( $instance === null ) $instance = new self();
		return $instance;
	}
	protected function __construct(){
	}
	public function Add($string){
		$this->errors .= $string;
	}
}