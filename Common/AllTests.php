<?php
require_once 'PHPUnit/Framework/TestSuite.php';

require_once dirname( __FILE__ ) . '/EMailTest.php';
require_once dirname( __FILE__ ) . '/UsernameTest.php';

class ispCPCommonAllTests
{
    public static function suite()
    {
        $suite = new PHPUnit_Framework_TestSuite('ispCP - CommonAllTests');
        //$suite->addTest(phpucDataLogsAllTests::suite());
        $suite->addTestSuite('ispCPEMailTest');
        $suite->addTestSuite('ispCPUsernameTest');

        return $suite;
    }
}