package ## no critic: Modules::RequireFilenameMatchesPackage
    # hide from PAUSE
    TableDataRole::Business::ID::BPOM::FoodCategory;

use 5.010001;
use strict;
use warnings;

use Role::Tiny;
with 'TableDataRole::Source::AOA';

around new => sub {
    require App::BPOMUtils::Table;

    my $orig = shift;
    my $self = shift;

    $orig->(
        $self,
        column_names => [ sort {
            $App::BPOMUtils::Table::meta_idn_bpom_kategori_pangan->{fields}{$a}{pos} <=>
            $App::BPOMUtils::Table::meta_idn_bpom_kategori_pangan->{fields}{$b}{pos};
        } keys %{ $App::BPOMUtils::Table::meta_idn_bpom_kategori_pangan->{fields} } ],
        aoa => $App::BPOMUtils::Table::data_idn_bpom_kategori_pangan,
        @_,
    );
};

package TableData::Business::ID::BPOM::FoodCategory;

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

with 'TableDataRole::Business::ID::BPOM::FoodCategory';

# STATS

1;
# ABSTRACT: Food categories in BPOM processed food division

=head1 DESCRIPTION

Keyword: BPOM, pangan olahan, kategori pangan


=head1 SEE ALSO

L<TableData::Business::ID::BPOM::FoodType>
