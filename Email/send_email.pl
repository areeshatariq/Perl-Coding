#!/usr/bin/perl
use strict;
use warnings;

# create message
use Email::MIME;
my $message = Email::MIME->create(
  header_str => [
    From    => 'me@perlcode.com',
    To      => 'teacher@perlcode.com',
    Subject => 'You are Best!',
  ],
  attributes => {
    encoding => 'quoted-printable',
    charset  => 'ISO-8859-1',
  },
  body_str => "You are the best teacher ever!\n",
);

# send the message
use Email::Sender::Simple qw(sendmail);
sendmail($message);