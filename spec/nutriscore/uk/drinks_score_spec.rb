require_relative '../../spec_helper'
require 'nutriscore/uk/drinks_score'

describe Nutriscore::UK::DrinksScore do
  subject(:score) { described_class.new(nutrients) }

  context 'without any nutrients' do
    let(:nutrients) { {} }
    its('score.single') { is_expected.to be nil }
    its(:less_healthy?) { is_expected.to be nil }
  end

  # example from "Nutrient Profiling Technical Guidance January 2011" page 16
  context 'powdered milkshake' do
    let(:nutrients) {{
      energy: 299,                       # kJ/100g
      fat_saturated: 1.0,                #  g/100g
      sugar: 8.9,                        #  g/100g
      sodium: 41 * 1e-3,                 #  g/100g
      fruits_vegetables_nuts: 0,         #  g/100g (= weight-%)
      fibres: 0.5,                       #  g/100g
      proteins: 3.2,                     #  g/100g
    }}
    its(:score) { is_expected.to eq 0 }
    its(:less_healthy?) { is_expected.to be false }
  end

  # example from "Nutrient Profiling Technical Guidance January 2011" page 18
  context 'raspberry and cranberry juice drink' do
    let(:nutrients) {{
      energy: 184,                       # kJ/100g
      fat_saturated: 0,                  #  g/100g
      sugar: 10.3,                       #  g/100g
      sodium: 0 * 1e-3 ,                 #  g/100g
      fruits_vegetables_nuts: 15,        #  g/100g (= weight-%)
      fibres: 0,                         #  g/100g
      proteins: 0.1,                     #  g/100g
    }}
    its(:score) { is_expected.to eq 2 }
    its(:less_healthy?) { is_expected.to be true }
  end
end