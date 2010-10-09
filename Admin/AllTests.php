<?php
require_once 'PHPUnit/Framework/TestSuite.php';

require_once dirname( __FILE__ ) . '/LoginTest.php';

class ispCPAdminAllTests
{
    public static function suite()
    {
        $suite = new PHPUnit_Framework_TestSuite('ispCP - AdminAllTests');
        $suite->addTestSuite('ispCPAdminLoginTest');

        return $suite;
    }
}