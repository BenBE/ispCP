<?php
/**
 * ispCP ω (OMEGA) complete domain backup tool
 *
 * @copyright 	2010 Thomas Wacker
 * @author 		Thomas Wacker <zuhause@thomaswacker.de>
 *
 * @license
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 */

abstract class BaseController
{
	/**
	 * verbose mode
	 */
	public $verbose = false;
	/**
	 * array of error messages
	 */
	protected $errorMessages = array();

	/**
	 * set error message
	 * @param string $s message
	 */
	protected function addErrorMessage($s)
	{
		$this->errorMessages[] = $s;
	}

	/**
	 * get list of error messages
	 * @return array error messages (strings)
	 */
	public function getErrorMessages()
	{
		return $this->errorMessages;
	}

	protected function shellExecute($cmd, &$a)
	{
		if ($this->verbose) {
			echo $cmd."\n";
		}
		return exec($cmd, $a);
	}
}
