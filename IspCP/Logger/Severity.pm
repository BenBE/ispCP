#!/usr/bin/perl

# Copyright (C) 2009  Laurent Declercq <l.declercq@nuxwin.com>
#
# This library is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

package IspCP::Logger::Severity;

use strict;
use warnings;
use diagnostics;

use base qw(Exporter);
our @EXPORT = qw(DEBUG INFO WARN ERROR FATAL UNKNOWN);

BEGIN {
    use vars qw($VERSION);
    $VERSION = '1.00';
}

use constant {
		DEBUG	=> 0, # low-level information for developers
		INFO	=> 1, # generic (useful) information about system operation
		WARN	=> 2, # a warning
		ERROR	=> 3, # a handleable error condition
		FATAL	=> 4, # an unhandleable error that results in a program crash
		UNKNOWN	=> 5
};

1;
