<?php

require_once 'config.php';
if (!defined('ISPCP_GUI_PATH')) {
	exit(-1);
}

require_once ISPCP_GUI_PATH.'/include/ispcp-lib.php';
require_once dirname(__FILE__).'/utils.php';
require_once dirname(__FILE__).'/Base.php';

Config::set('DB_TYPE', Config::get('DATABASE_TYPE'));
Config::set('DB_HOST', Config::get('DATABASE_HOST'));
Config::set('DB_USER', Config::get('DATABASE_USER'));
Config::set('DB_PASS', decrypt_db_password(Config::get('DATABASE_PASSWORD')));
Config::set('DB_NAME', Config::get('DATABASE_NAME'));
