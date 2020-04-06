# Appending to a file
#!/usr/bin/perl
use strict;
use warnings;

use Path::Tiny;
# die if problem reading or writing a file
use autodie;

my $dir = path("/tmp"); 
my $file = $dir->child("file.txt"); 
my $file_handle = $file->opena_utf8();

my @list = ('a', 'list', 'of', 'words');

foreach my $line ( @list ) {
    $file_handle->print($line . "\n");
}