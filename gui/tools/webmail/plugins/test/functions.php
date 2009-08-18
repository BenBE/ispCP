<?php

/**
  * SquirrelMail Test Plugin
  * @copyright &copy; 2006 The SquirrelMail Project Team
  * @license http://opensource.org/licenses/gpl-license.php GNU Public License
  * @version $Id: functions.php 1638 2009-04-02 02:35:58Z haeber $
  * @package plugins
  * @subpackage test
  */

/**
  * Add link to menu at top of content pane
  *
  * @return void
  *
  */
function test_menuline_do() {

    displayInternalLink('plugins/test/test.php', 'Test', 'right');
    echo "&nbsp;&nbsp;\n";

}


