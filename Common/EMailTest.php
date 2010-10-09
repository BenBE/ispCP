<?php


class ispCPEMailTest extends PHPUnit_Framework_TestCase {

	protected function setUp() {
        include_once '/var/www/ispcp/gui/include/ispcp-lib.php';
    }

	public static function emailprovider() {
		return array(
            array('@a', false),
            array('a@', false),
        	array('joe@example.com', true),
        );
	}

    /**
     * @dataProvider emailprovider
     */
	public function testEMail($email, $expected) {
        $this->assertEquals($expected, chk_email($email));
    }
}