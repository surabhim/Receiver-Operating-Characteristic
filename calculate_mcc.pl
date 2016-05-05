#!/usr/bin/perl
use strict;
use warnings;

 my $tp = $ARGV[0];
 my $tn = $ARGV[1];
 my $fp = $ARGV[2];
 my $fn = $ARGV[3];

 my $tpr = 0.0;
 my $fpr = 0.0;
 my $acc = 0.0;
 my $spc = 0.0;
 my $ppv = 0.0;
 my $npv = 0.0;
 my $fdr = 0.0;
 my $mcc = 0.0;

 $tpr = $tp / ($tp + $fn) if ( ($tp + $fn) );
 $fpr = $fp / ($fp + $tn) if ( ($fp + $tn) );
 $acc = ($tp + $tn) / ($tp + $fn + $fp + $tn) if ( ($tp + $fn + $fp + $tn) );
 $spc = $tn / ($fp + $tn) if ( ($fp + $tn) );
 $ppv = $tp / ($tp + $fp) if ( ($tp + $fp) );
 $npv = $tn / ($tn + $fn) if ( ($tn + $fn) );
 $fdr = $fp / ($fp + $tp) if ( ($fp + $tp) );

 $acc = ($tp + $tn) / ($tp + $fn + $fp + $tn) if ( ($tp + $fn + $fp + $tn) );
 $mcc = ($tp*$tn - $fp*$fn)/sqrt(($tp+$fp)*($tp+$fn)*($tn+$fp)*($tn+$fn)) if ( (($tp+$fp)*($tp+$fn)*($tn+$fp)*($tn+$fn)) != 0.0 );

 print "FPR:$fpr TPR:$tpr ACC:$acc SPC:$spc PPV:$ppv MCC:$mcc TP:$tp FP:$fp TN:$tn FN:$fn \n";

