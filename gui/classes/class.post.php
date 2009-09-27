<?php
class post extends input{

	public static function getInstance(){
		static $instance=NULL;
		if($instance===NULL)$instance=new self;
		return $instance;
	}

	protected function init(){
		foreach($_POST as $key=>$get){
			$this->filter($_POST[$key]);
			$this->content[$key] = $_POST[$key];
			unset($_POST[$key]);
		}
	}
}
?>