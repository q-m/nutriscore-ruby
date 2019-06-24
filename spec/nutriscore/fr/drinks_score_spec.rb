require_relative '../../spec_helper'
require 'nutriscore/fr/drinks_score'

describe Nutriscore::FR::DrinksScore do
  subject(:score) { described_class.new(nutrients) }

  context 'without any nutrients' do
    let(:nutrients) { {} }
    its(:score) { is_expected.to be nil }
    its(:score_class) { is_expected.to be nil }
  end
end
