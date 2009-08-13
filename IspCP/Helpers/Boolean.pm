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

package IspCP::Helpers::Boolean;

use strict;
use warnings;

use base qw(Exporter);
our @EXPORT_OK = qw(FALSE TRUE false true is_bool);
our @EXPORT = qw(FALSE TRUE false true);

our %EXPORT_TAGS = ( all => [@EXPORT_OK] );

BEGIN {

    use vars qw($VERSION $TRUE $FALSE);
    $VERSION = '0.01';

	# Boolean object
	$TRUE = do { bless \(my $true = 1), __PACKAGE__ };
	$FALSE = do { bless \(my $false = 0), __PACKAGE__ };

	# Overloads several logical operators for the boolean objects
	use overload '""' => sub { ${$_[0]}; }, fallback => 1;

}

# The constants defined here are references to booleans objects
use constant { TRUE => $TRUE, FALSE => $FALSE };

# Pseudo alias for the FALSE and TRUE constants.
# Provides support for use in lowercase.
sub true { TRUE; }
sub false { FALSE; }

#: is_bool - Finds out whether a variable is a boolean
#
# @params $var The variable being evaluated. 
# @returns boolean Returns TRUE if var is a boolean, FALSE otherwise. 
#
# Examples
#
# my $a = false;
# my $b = 0;
#
# # Since $a is a boolean, this is true
# if (is_bool($a)) {
#    print "Yes, this is a boolean";
# }
#
#
# # Since $b is not a boolean, this is not true
# if (is_bool($b)) {
#    print "Yes, this is a boolean";
# }
#
sub is_bool($) {

	my $var = shift;

	return FALSE unless( ref(${var}) eq __PACKAGE__ );

	return TRUE;

}

1;
