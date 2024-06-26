package ## no critic: Modules::RequireFilenameMatchesPackage
    # hide from PAUSE
    TableDataRole::Business::ID::BPOM::FoodType;

use 5.010001;
use strict;
use warnings;

use Role::Tiny;
with 'TableDataRole::Source::AOA';

around new => sub {
    require App::BPOMUtils::Table::FoodType;

    my $orig = shift;
    my $self = shift;

    $orig->(
        $self,
        column_names => [ sort {
            $App::BPOMUtils::Table::FoodType::meta_idn_bpom_jenis_pangan->{fields}{$a}{pos} <=>
            $App::BPOMUtils::Table::FoodType::meta_idn_bpom_jenis_pangan->{fields}{$b}{pos};
        } keys %{ $App::BPOMUtils::Table::FoodType::meta_idn_bpom_jenis_pangan->{fields} } ],
        aoa => $App::BPOMUtils::Table::FoodType::data_idn_bpom_jenis_pangan,
        @_,
    );
};

package TableData::Business::ID::BPOM::FoodType;

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

with 'TableDataRole::Business::ID::BPOM::FoodType';

# STATS

1;
# ABSTRACT: Food types in BPOM processed food division

=head1 DESCRIPTION

Keyword: BPOM, pangan olahan, jenis pangan


=head1 SEE ALSO

L<TableData::Business::ID::BPOM::FoodCategory>
