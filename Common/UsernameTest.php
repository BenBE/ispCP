<?php


class ispCPUsernameTest extends PHPUnit_Framework_TestCase {

	protected function setUp() {
        include_once '/var/www/ispcp/gui/include/ispcp-lib.php';
    }

	public static function usernameprovider() {
		return array(
            array('aa', true),
            array('a', false),
            array('...', false),
        );
	}

    /**
     * @dataProvider usernameprovider
     */
	public function testUsername($email, $expected) {
        $this->assertEquals($expected, validates_username($email));
    }
}