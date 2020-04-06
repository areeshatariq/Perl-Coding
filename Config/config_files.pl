#!/usr/bin/perl
use strict;
use warnings;

use Config::Any;

my @conf_files = (
        'path/to/config_file.json',
        'path/to/config.pl',
        'path/to/config.xml'
);

my $conf = Config::Any->load_files( { files => \@conf_files } );