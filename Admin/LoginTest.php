<?php

require_once 'PHPUnit/Extensions/SeleniumTestCase.php';

class ispCPAdminLoginTest extends PHPUnit_Extensions_SeleniumTestCase
{
    protected function setUp()
    {
        $this->setBrowser("*chrome");
        $this->setBrowserUrl("http://admin.tw.local/");
    }

    public function testMyTestCase()
    {
        $this->open("/");
        $this->type("uname", "admin");
        $this->type("upass", "admin1");
        $this->click("Submit");
        $this->waitForPageToLoad("30000");
        $this->click("link=Server status");
        $this->waitForPageToLoad("30000");
        try {
            $this->assertTrue($this->isTextPresent("ispCP Daemon"));
        } catch (PHPUnit_Framework_AssertionFailedError $e) {
            array_push($this->verificationErrors, $e->toString());
        }
        $this->click("link=Logout");
        $this->waitForPageToLoad("30000");
    }
}
