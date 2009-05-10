<?php


class UserIOTest extends PHPUnit_Framework_TestCase {

	protected function setUp() {
		include_once '../gui/include/class.UserIO.php';
    }

	public static function emailprovider() {
		return array(
        	array('joe@example.com', true, 'joe@example.com'),
        	array('', false, ''),
        	array('joe@example', true, false),
			array('joe_at_example.com', true, false),
			array('', true, false),
        	array('joe', true, false)
        );		
	}

    /**
     * @dataProvider emailprovider
     */    
	public function testEMail($email, $mandatory, $expected) {
		$key = 'email';
		$_GET[$key] = $email;
		$result = UserIO::GET_EMail($key, $mandatory);
        $this->assertEquals($expected, $result);
    }
    
    public static function stringprovider() {
    	return array(
    		array("Test\n123 ", 	true, 	true,	"Test123"),
    		array("", 				false, 	false,	""),
    		array(" Test\\\'", 		false, 	true,	"Test\\'"),
    		array(" X", 			true, 	false,	" X"),
    		array("", 				true, 	false,	false)
    	);
    }
    
    /**
     * @dataProvider stringprovider
     */
    public function testString($string, $mandatory, $trim, $expected) {
		$key = 'test';
		$_GET[$key] = $string;
		$result = UserIO::GET_String($key, $mandatory, $trim);
        $this->assertEquals($expected, $result);
    }
    
    public static function memoprovider() {
    	return array(
    		array("Test\n123 ", 	true, 	true,	"Test\n123"),
    		array("", 				false, 	false,	""),
    		array(" Test\\\'", 		false, 	true,	"Test\\'"),
    		array(" X\nX\n ", 		true, 	true,	"X\nX"),
    		array(" X\n", 			true, 	false,	" X\n"),
    		array("", 				true, 	false,	false)
    	);
    }
    
    /**
     * @dataProvider memoprovider
     */
    public function testMemo($string, $mandatory, $trim, $expected) {
		$key = 'test';
		$_POST[$key] = $string;
		$result = UserIO::POST_Memo($key, $mandatory, $trim);
        $this->assertEquals($expected, $result);
    }
    
    public static function intprovider() {
    	return array(
    		array('5', 		true, 5),
    		array(" 3\\", 	true, 3),
    		array('2.9', 	true, 2),
    		array('x', 		true, 0),
    		array(false, 	true, false)
    	);
    }
    
    /**
     * @dataProvider intprovider
     */
	public function testInteger($value, $mandatory, $expected) {
		$key = 'id';
		$_GET[$key] = $value;
		$result = UserIO::GET_Int($key, $mandatory);
        $this->assertEquals($expected, $result);
	}
}