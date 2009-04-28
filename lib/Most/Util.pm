package Most::Util;
use base qw(Exporter);

use strict;
use warnings;

our $VERSION = "1.00";

my @modules = qw(
  Scalar::Util
  List::Util
  List::MoreUtils
  Hash::Util
  Data::Structure::Util
);

foreach my $module (@modules) {
  # use the module
  eval "use $module ();";

  # work out what they import
  my @function_list = do {
    no strict 'refs';
    @{$module."::EXPORT_OK"};
  };

  # import those functions
  $module->import(@function_list);

  # automatically re-export it
  our @EXPORT;
  our %EXPORT_TAGS;
  push @EXPORT, @function_list;
  $EXPORT_TAGS{$module} = \@function_list;
  $module =~ s/:.*//x;
  $module = lc $module;
  $EXPORT_TAGS{$module} ||= [];
  push @{ $EXPORT_TAGS{$module} }, @function_list;
}

=head1 NAME

Most::Util - access functions from common util modules

=head1 SYNOPSIS

  use Most::Util;
  if (blessed $foo) {
    print join ", ", shuffle $foo->members
      if any { $_->can_walk_on_water } $foo->members
  }

=head1 DESCRIPTION

This module imports all functions from the following modules into
your namespace

  Scalar::Util
  List::Util
  List::MoreUtils
  Hash::Util
  Data::Structure::Util

If you're worried about poluting your namespace you can specfify indvidual
functions to import:

  use More::Util qw(blessed max any);

Or by module name:

  use More::Util qw(:Scalar::Util :List::Util);

Or with C<:scalar>, C<:list> (for both functions from B<List::Util>
nd C<List::MoreUtil), C<:hash> or C<:data>:

  use More::Util qw(:list :data);

Or you can import nothing and use a fully qualified function name (why you'd want
to do this is beyond me though):

  use More::Util qw();
  print "Yep" if More::Util::blessed($fred);

=head1 AUTHOR

Written by Mark Fowler E<lt>mark@twoshortplanks.comE<gt>

Copyright Photobox 2009.  All Rights Reserved.

This program is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=head1 BUGS

This polutes your namespace chronically.  You can avoid this by
specifying what you want to import in the arguments when you
use the module.  You can avoid exposing imported functions as
methods with B<namespace::clean>.

Please see http://twoshortplanks.com/dev/mostutil for
details of how to submit bugs, access the source control for
this project, and contact the author.

People will complain about this module not doing it the way
they thought it should.  This is a bug with those people, not
with this module.

=head1 SEE ALSO

L<Scalar::Util>, L<List::Util>, L<List::MoreUtils>, L<Hash::Util>,
L<Data::Structure::Util>, L<namespace::clean>

=cut

1;