require_relative '../../spec_helper'
require 'nutriscore/fr/cheese_score'

describe Nutriscore::FR::CheeseScore do
  subject(:score) { described_class.new(nutrients) }

  context 'without any nutrients' do
    let(:nutrients) { {} }
    its('score.single') { is_expected.to be nil }
    its('score_class.single') { is_expected.to be nil }
  end
end
