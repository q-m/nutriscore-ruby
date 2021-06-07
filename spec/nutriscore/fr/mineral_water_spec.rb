require_relative '../../spec_helper'
require 'nutriscore/fr/mineral_water_score'

describe Nutriscore::FR::MineralWaterScore do
  subject(:score) { described_class.new(nutrients) }

  context 'without any nutrients' do
    let(:nutrients) { {} }
    its('score.single') { is_expected.to eq nil }
    its('score_class.single') { is_expected.to eq 'A' }
  end
end
