#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::GraphViz;
use Map::Tube::GraphViz::Utils qw(node_color_without_label);
use Map::Tube::Warsaw;

# Object.
my $obj = Map::Tube::Warsaw->new;

# GraphViz object.
my $g = Map::Tube::GraphViz->new(
        'callback_node' => \&node_color_without_label,
        'driver' => 'neato',
        'tube' => $obj,
);

# Get graph to file.
$g->graph('Warsaw.png');

# Print file.
system "ls -l Warsaw.png";

# Output like:
# -rw-r--r-- 1 skim skim 71382 Dec 28 19:58 Warsaw.png