
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'fast, low-level GFF3 manipulation',
  'AUTHOR' => 'Robert Buels <rmb32@cornell.edu>',
  'BUILD_REQUIRES' => {
    'IO::Scalar' => '0',
    'IO::String' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Bio-GFF3',
  'EXE_FILES' => [
    'bin/gff3_insert_sync_directives',
    'bin/gff3_from_fasta'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'Bio::GFF3',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Exporter' => '0',
    'File::Copy' => '0',
    'File::ReadBackwards' => '0',
    'File::Temp' => '0',
    'Getopt::Std' => '0',
    'Pod::Usage' => '0',
    'Scalar::Util' => '0',
    'URI::Escape' => '0'
  },
  'VERSION' => '0.3',
  'test' => {
    'TESTS' => 't/*.t t/transforms/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



