<?php
class get extends input{

	public static function getInstance(){
		static $instance=NULL;
		if($instance===NULL)$instance=new self;
		return $instance;
	}

	protected function init(){
		foreach($_GET as $key=>$get){
			$this->filter($_GET[$key]);
			$this->content[$key] = $_GET[$key];
			unset($_GET[$key]);
		}
	}
}
?>