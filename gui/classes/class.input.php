<?php
abstract class input {

	protected $content=array();

	abstract protected function init();

	protected function __construct(){
		$this->init();
	}

	protected function filter(&$value){
		if(is_array($value)){
			foreach ($value as $key=>$content){
				$this->filter($value[$key]);
			}
		} else {
			if (get_magic_quotes_gpc())$value=stripslashes($value);
			$value=trim($value);
		}
	}

	public function getVar($var, $mode = 'raw'){
		if(!array_key_exists($var,$this->content)) return false;
		switch ($mode){
			case 'raw':
				return $this->content[$var];
				break;
			case 'int':
			case 'integer':
				return (int) $this->content[$var];
				break;
			case 'float':
			case 'double':
			case 'real':
				return (float) $this->content[$var];
				break;
			case 'string':
				return (string) $this->content[$var];
				break;
			case 'bool':
			case 'boolean':
				return (string) $this->content[$var];
				break;
// As of PHP v6
// 			case 'binary':
// 				return (binary) $this->content[$var];
// 				break;
			case 'array':
				return (array) $this->content[$var];
				break;
			case 'object':
				return (object) $this->content[$var];
				break;
			case 'unset':
				return (unset) $this->content[$var];
				break;
		}
	}

	public function unsetVar($var){
		if(array_key_exists($var, $this->content))unset($this->content[$var]);
	}
	public function varIsSet($var){
		if(array_key_exists($var, $this->content))return true;
		return false;
	}
	public function getAll(){return $this->content;}

}