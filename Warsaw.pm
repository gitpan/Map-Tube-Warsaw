package Map::Tube::Warsaw;

# Pragmas.
use strict;
use warnings;
use 5.006;

# Modules.
use File::Share ':all';
use Moo;
use namespace::clean;

# Version.
our $VERSION = 0.01;

# Get XML.
has xml => (
	'is' => 'ro',
	'default' => sub {
		return dist_file('Map-Tube-Warsaw', 'warsaw-map.xml');
	},
);

with 'Map::Tube';

1;

__END__

=encoding utf8

=head1 NAME

Map::Tube::Warsaw - Interface to the Warsaw Tube Map.

=head1 SYNOPSIS

 use Map::Tube::Warsaw;
 my $obj = Map::Tube::Warsaw->new;
 my $route = $obj->get_shortest_route($from, $to);
 my $xml_file = $obj->xml;

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between the two
given nodes.

For more information about Warsaw Map, click L<here|https://en.wikipedia.org/wiki/Warsaw_Metro>.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get_shortest_route($from, $to)>

 Get shortest route between $from and $to node name. Node name is case insensitive.
 Returns back the node sequence in string.

=item C<xml()>

 Get XML specification of Warsaw metro.
 Returns string with XML.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Encode qw(decode_utf8 encode_utf8);
 use Map::Tube::Warsaw;

 # Object.
 my $obj = Map::Tube::Warsaw->new;

 # Get route.
 my $route = $obj->get_shortest_route(decode_utf8('Люлин'), decode_utf8('Вардар'));

 # Print out type.
 print "Route: ".encode_utf8($route)."\n";

 # Output:
 # Route: Люлин (Първи метродиаметър), Западен парк (Първи метродиаметър), Вардар (Първи метродиаметър)

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use utf8;
 use warnings;

 # Modules.
 use Map::Tube::Warsaw;

 # Object.
 my $obj = Map::Tube::Warsaw->new;

 # Get XML file.
 my $xml_file = $obj->xml;

 # Print out XML file.
 print "XML file: $xml_file\n";

 # Output like:
 # XML file: .*/warsaw-map.xml

=head1 DEPENDENCIES

L<File::Share>,
L<Map::Tube>,
L<Moo>,
L<namespace::clean>.

=head1 SEE ALSO

L<Map::Tube>,
L<Map::Tube::Barcelona>,
L<Map::Tube::Delhi>,
L<Map::Tube::London>,
L<Map::Tube::NYC>,
L<Map::Tube::Prague>,
L<Map::Tube::Sofia>,
L<Map::Tube::Tokyo>.

=head1 REPOSITORY

L<https://github.com/Manwar/Map-Tube-Warsaw>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © Michal Špaček 2014
 Artistic License
 BSD 2-Clause License

=head1 VERSION

0.01

=cut