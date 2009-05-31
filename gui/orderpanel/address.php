<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: address.php 1744 2009-05-07 03:21:47Z haeber $
 * @link		http://isp-control.net
 * @author		ispCP Team
 *
 * @license
 *   This program is free software; you can redistribute it and/or modify it under
 *   the terms of the MPL General Public License as published by the Free Software
 *   Foundation; either version 1.1 of the License, or (at your option) any later
 *   version.
 *   You should have received a copy of the MPL Mozilla Public License along with
 *   this program; if not, write to the Open Source Initiative (OSI)
 *   http://opensource.org | osi@opensource.org
 */

require '../include/ispcp-lib.php';

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::get('PURCHASE_TEMPLATE_PATH') . '/address.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('purchase_header', 'page');
$tpl->define_dynamic('purchase_footer', 'page');

/*
 * functions start
 */

function gen_address(&$tpl, &$sql, $user_id, $plan_id) {
	if (UserIO::POST_isset('fname')) {
		$first_name = UserIO::POST_String('fname');
	} else if (isset($_SESSION['fname'])) {
		$first_name = $_SESSION['fname'];
	} else {
		$first_name = '';
	}

	if (UserIO::POST_isset('lname')) {
		$last_name = UserIO::POST_String('lname');
	} else if (isset($_SESSION['lname'])) {
		$last_name = $_SESSION['lname'];
	} else {
		$last_name = '';
	}

	if (UserIO::POST_isset('email')) {
		$email = UserIO::POST_String('email');
	} else if (isset($_SESSION['email'])) {
		$email = $_SESSION['email'];
	} else {
		$email = '';
	}

	if (UserIO::POST_isset('gender') && (in_array(UserIO::POST_String('gender'), array('M', 'F', 'U')))) {
		$gender = UserIO::POST_String('gender');
	} else if (isset($_SESSION['gender'])) {
		$gender = $_SESSION['gender'];
	} else {
		$gender = 'U';
	}

	if (UserIO::POST_isset('firm')) {
		$company = UserIO::POST_String('firm');
	} else if (isset($_SESSION['firm'])) {
		$company = $_SESSION['firm'];
	} else {
		$company = '';
	}

	if (UserIO::POST_isset('zip')) {
		$postal_code = UserIO::POST_String('zip');
	} else if (isset($_SESSION['zip'])) {
		$postal_code = $_SESSION['zip'];
	} else {
		$postal_code = '';
	}

	if (UserIO::POST_isset('city')) {
		$city = UserIO::POST_String('city');
	} else if (isset($_SESSION['city'])) {
		$city = $_SESSION['city'];
	} else {
		$city = '';
	}

	if (UserIO::POST_isset('state')) {
		$state = UserIO::POST_String('state');
	} else if (isset($_SESSION['state'])) {
		$state = $_SESSION['state'];
	} else {
		$state = '';
	}

	if (UserIO::POST_isset('country')) {
		$country = UserIO::POST_String('country');
	} else if (isset($_SESSION['country'])) {
		$country = $_SESSION['country'];
	} else {
		$country = '';
	}

	if (UserIO::POST_isset('street1')) {
		$street1 = UserIO::POST_String('street1');
	} else if (isset($_SESSION['street1'])) {
		$street1 = $_SESSION['street1'];
	} else {
		$street1 = '';
	}

	if (UserIO::POST_isset('street2')) {
		$street2 = UserIO::POST_String('street2');
	} else if (isset($_SESSION['street2'])) {
		$street2 = $_SESSION['street2'];
	} else {
		$street2 = '';
	}

	if (UserIO::POST_isset('phone')) {
		$phone = UserIO::POST_String('phone');
	} else if (isset($_SESSION['phone'])) {
		$phone = $_SESSION['phone'];
	} else {
		$phone = '';
	}

	if (UserIO::POST_isset('fax')) {
		$fax = UserIO::POST_String('fax');
	} else if (isset($_SESSION['fax'])) {
		$fax = $_SESSION['fax'];
	} else {
		$fax = '';
	}

	$tpl->assign(
		array(
			'VL_USR_NAME'		=> UserIO::HTML($first_name),
			'VL_LAST_USRNAME'	=> UserIO::HTML($last_name),
			'VL_EMAIL'			=> UserIO::HTML($email),
			'VL_USR_FIRM'		=> UserIO::HTML($company),
			'VL_USR_POSTCODE'	=> UserIO::HTML($postal_code),
			'VL_USRCITY'		=> UserIO::HTML($city),
			'VL_USRSTATE'		=> UserIO::HTML($state),
			'VL_COUNTRY'		=> UserIO::HTML($country),
			'VL_STREET1'		=> UserIO::HTML($street1),
			'VL_STREET2'		=> UserIO::HTML($street2),
			'VL_PHONE'			=> UserIO::HTML($phone),
			'VL_FAX'			=> UserIO::HTML($fax),
			'VL_MALE'			=> (($gender === 'M') ? 'selected="selected"' : ''),
			'VL_FEMALE'			=> (($gender === 'F') ? 'selected="selected"' : ''),
			'VL_UNKNOWN'		=> (($gender == 'U') ? 'selected="selected"' : '')
		)
	);
}

function check_address_data(&$tpl) {

	UserIO::GET_unset('edit'); // @todo why unset GET['edit']?
	if ((UserIO::POST_isset('fname') && UserIO::POST_String('fname') != '')
		&& (UserIO::POST_isset('email') && UserIO::POST_String('email') != '')
		&& UserIO::POST_EMail('email', true)
		&& (UserIO::POST_isset('lname') && UserIO::POST_String('lname') != '')
		&& (UserIO::POST_isset('zip') && UserIO::POST_String('zip') != '')
		&& (UserIO::POST_isset('city') && UserIO::POST_String('city') != '')
		&& (UserIO::POST_isset('state') && UserIO::POST_String('state') != '')
		&& (UserIO::POST_isset('country') && UserIO::POST_String('country') != '')
		&& (UserIO::POST_isset('street1') && UserIO::POST_String('street1') != '')
		&& (UserIO::POST_isset('phone') && UserIO::POST_String('phone') != '')
		) {
		$_SESSION['fname']		= UserIO::POST_String('fname');
		$_SESSION['lname']		= UserIO::POST_String('lname');
		$_SESSION['email']		= UserIO::POST_String('email');
		$_SESSION['zip']		= UserIO::POST_String('zip');
		$_SESSION['city']		= UserIO::POST_String('city');
		$_SESSION['state']		= UserIO::POST_String('state');
		$_SESSION['country']	= UserIO::POST_String('country');
		$_SESSION['street1']	= UserIO::POST_String('street1');
		$_SESSION['phone']		= UserIO::POST_String('phone');

		if (UserIO::POST_isset('firm') && UserIO::POST_String('firm') != '') {
			$_SESSION['firm'] = UserIO::POST_String('firm');
		}

		if (UserIO::POST_isset('gender')
			&& get_gender_by_code(UserIO::POST_String('gender'), true) !== null) {
			$_SESSION['gender'] = UserIO::POST_String('gender');
		} else {
			$_SESSION['gender'] = '';
		}

		if (UserIO::POST_isset('street2') && UserIO::POST_String('street2') != '') {
			$_SESSION['street2'] = UserIO::POST_String('street2');
		}

		if (UserIO::POST_isset('fax') && UserIO::POST_String('fax') != '') {
			$_SESSION['fax'] = UserIO::POST_String('fax');
		}

		user_goto('chart.php');
	} else {
		set_page_message(tr('Please fill out all needed fields!'));
		UserIO::GET_set('edit', 'yes'); // @todo: why GET var? 
	}
}

/*
 * functions end
 */

/*
 *
 * static page messages.
 *
 */

if (isset($_SESSION['user_id']) && isset($_SESSION['plan_id'])) {
	$user_id = $_SESSION['user_id'];
	$plan_id = $_SESSION['plan_id'];
} else {
	system_message(tr('You do not have permission to access this interface!'));
}

if (UserIO::POST_String('uaction') == 'address')
	check_address_data($tpl);

if ((isset($_SESSION['fname']) && $_SESSION['fname'] != '')
	&& (isset($_SESSION['email']) && $_SESSION['email'] != '')
	&& (isset($_SESSION['lname']) && $_SESSION['lname'] != '')
	&& (isset($_SESSION['zip']) && $_SESSION['zip'] != '')
	&& (isset($_SESSION['city']) && $_SESSION['city'] != '')
	&& (isset($_SESSION['state']) && $_SESSION['state'] != '')
	&& (isset($_SESSION['country']) && $_SESSION['country'] != '')
	&& (isset($_SESSION['street1']) && $_SESSION['street1'] != '')
	&& (isset($_SESSION['phone']) && $_SESSION['phone'] != '')
	&& !UserIO::GET_isset('edit')
	) {
	user_goto('chart.php');
}

gen_purchase_haf($tpl, $sql, $user_id);
gen_address($tpl, $sql, $user_id, $plan_id);

gen_page_message($tpl);

$tpl->assign(
	array(
		'TR_ADDRESS'	=> tr('Enter Address'),
		'TR_FIRSTNAME'	=> tr('First name'),
		'TR_LASTNAME'	=> tr('Last name'),
		'TR_COMPANY'	=> tr('Company'),
		'TR_POST_CODE'	=> tr('Zip/Postal code'),
		'TR_CITY'		=> tr('City'),
		'TR_STATE'		=> tr('State/Province'),
		'TR_COUNTRY'	=> tr('Country'),
		'TR_STREET1'	=> tr('Street 1'),
		'TR_STREET2'	=> tr('Street 2'),
		'TR_EMAIL'		=> tr('Email'),
		'TR_PHONE'		=> tr('Phone'),
		'TR_GENDER'		=> tr('Gender'),
		'TR_MALE'		=> tr('Male'),
		'TR_FEMALE'		=> tr('Female'),
		'TR_UNKNOWN'	=> tr('Unknown'),
		'TR_FAX'		=> tr('Fax'),
		'TR_CONTINUE'	=> tr('Continue'),
		'NEED_FILLED'	=> tr('* denotes mandatory field.'),
		'THEME_CHARSET'	=> tr('encoding')
	)
);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
unset_messages();
