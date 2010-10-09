<?php

require_once 'PHPUnit/Framework/TestSuite.php';

require_once dirname( __FILE__ ) . '/Common/AllTests.php';
require_once dirname( __FILE__ ) . '/Admin/AllTests.php';
//require_once dirname( __FILE__ ) . '/Customer/AllTests.php';
//require_once dirname( __FILE__ ) . '/Reseller/AllTests.php';


class AllTests
{
    public static function suite()
    {
        $suite = new PHPUnit_Framework_TestSuite('ispCP All Tests');

        $suite->addTest(ispCPCommonAllTests::suite());
        $suite->addTest(ispCPAdminAllTests::suite());
        //$suite->addTest(ispCPCustomerAllTests::suite());
        //$suite->addTest(ispCPResellerAllTests::suite());

        return $suite;
    }
}
