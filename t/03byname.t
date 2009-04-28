#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

use Most::Util qw(blessed);

foreach (qw(blessed)) {
  ok(defined &{$_}, "$_ imported");
}
foreach (qw(max any lock_hash unbless)) {
  ok(!defined &{$_}, "$_ not imported");
}
