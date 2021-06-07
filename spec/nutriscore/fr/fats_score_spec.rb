require_relative '../../spec_helper'
require 'nutriscore/fr/fats_score'

describe Nutriscore::FR::FatsScore do
  subject(:score) { described_class.new(nutrients) }

  context 'without any nutrients' do
    let(:nutrients) { {} }
    its('score.single') { is_expected.to be nil }
    its('score_class.single') { is_expected.to be nil }
  end

  context 'with a missing nutrient' do
    let(:nutrients) { { fat_total: 100 } }
    its('score.single') { is_expected.to be nil }
    its('score_class.single') { is_expected.to be nil }
  end

  context 'with saturated fat half of total fat' do
    let(:nutrients) { { fat_total: 50, fat_saturated: 25 } }
    its(:score) { is_expected.to eq 7 }
    its(:score_class) { is_expected.to eq 'C' }
  end

  context 'without saturated fat' do
    let(:nutrients) { { fat_total: 50, fat_saturated: 0 } }
    its(:score) { is_expected.to eq 0 }
    its(:score_class) { is_expected.to eq 'B' }
  end

  context 'with only saturated fat' do
    let(:nutrients) { { fat_total: 50, fat_saturated: 50 } }
    its(:score) { is_expected.to eq 10 }
    its(:score_class) { is_expected.to eq 'C' }
  end
end
