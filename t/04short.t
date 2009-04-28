#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

use Most::Util qw(:data :list);

foreach (qw(unbless max any)) {
  ok(defined &{$_}, "$_ imported");
}
foreach (qw(bless lock_hash)) {
  ok(!defined &{$_}, "$_ not imported");
}
