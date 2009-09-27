<?php
class session{

	protected $preserve=array('md5');

	public static function getInstance(){
		static $instance=NULL;
		if($instance===NULL)$instance=new self;
		return $instance;
	}
	
	protected function __construct(){
		$this->initializeSession();
	}

	protected function initializeSession(){
		try {
			session_name(Config::get('mysession_name'));
		} catch (Exception $e) {}
		try {
			if(Config::get('session_cookie_path'))ini_set('session.cookie_path',session_cookie_path);
		} catch (Exception $e) {}

		try {
			if(Config::get('session_referer_check'))ini_set('session.referer_check',session_referer_check);
		} catch (Exception $e) {}

		session_start();
		try {
			if(Config::get('session_regenerate_id')){
				if(!session_regenerate_id(true)){
					$this->closeSession();
					throw new Exception(tr('Error regenerating session!'));
				}
			}
		} catch (Exception $e) {}
		$this->selfCheck();
		if(!isset($_SESSION['RandomId']))$_SESSION['RandomId']=randoms::getInstance()->genereateRandom(40);
		$this->setCheckpoint();
	}
	protected function setCheckpoint(){
		if(isset($_SESSION['md5']))
			unset($_SESSION['md5']);
		$_SESSION['md5']=md5(serialize($_SESSION));
	}
	public function selfCheck(){
		try {
			if(Config::get('session_bypass_selfCheck'))return true;
		} catch (Exception $e) {}
		if(!isset($_SESSION['md5'])&&($_SESSION!=array())){
			errors::getInstance()->Add(tr('Session integrity ckeck fail!'));
			$this->closeSession();
			$this->initializeSession();
			$this->setCheckpoint();
			return false;
		}
		if(isset($_SESSION['md5'])){
			$md5=$_SESSION['md5'];
			unset($_SESSION['md5']);
			if($md5!==md5(serialize($_SESSION))){
				errors::getInstance()->Add(tr('Session integrity ckeck fail!'));
				$this->closeSession();
				$this->initializeSession();
				$this->setCheckpoint();
				return false;
			}
		}
		$this->setCheckpoint();
		return true;
	}
	public function closeSession(){
		session_unset();
		if(!session_destroy())
			errors::getInstance()->Add(tr('Error closing session!'));
		session_write_close();
	}
	public function Restart(){
		foreach($_SESSION as $key=>$value) if(!in_array($key,$this->preserve)){
			unset($_SESSION[$key]);
		}
		$this->setCheckpoint();
	}
	public function addPreserveValue($name){
		if(is_array($name))foreach ($name as $value)$this->addPreserveValue($value);
		elseif(!in_array($name,$this->preserve))$this->preserve[]=$name;
	}
	public function setVar($name,$var){$_SESSION[$name]=$var;$this->setCheckpoint();}
	public function varIsSet($name){
		if(array_key_exists($name,$_SESSION))return true;
		return false;
	}
	public function getVar($name){
		if(!isset($_SESSION[$name])){
			return false;
		}
		return $_SESSION[$name];
	}
	public function unsetVar($name){
		if(!array_key_exists($name, $_SESSION)) {
			return false;
		}
		unset($_SESSION[$name]);
		$this->setCheckpoint();
		return true;
	}
	function getAll(){return $_SESSION;}
	function getSessionId(){return session_id();}
}