#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 7;

use Most::Util;

# check at least one known function from each
foreach (qw(blessed max any lock_hash unbless)) {
  ok(defined &{$_}, "$_ imported");
}

# check we can call at least one of them
ok(blessed(bless {}, "foo"), "can call blessed");
ok(Most::Util::blessed(bless {}, "foo"), "can call blessed directly");