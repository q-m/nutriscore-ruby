require_relative '../../spec_helper'
require 'nutriscore/uk/specific_score'

describe Nutriscore::UK::SpecificScore do
  subject(:score) { described_class.new(nutrients) }

  context 'without any nutrients' do
    let(:nutrients) { {} }
    its(:score) { is_expected.to be nil }
  end

  # example from "Nutrient Profiling Technical Guidance January 2011" page 14
  context 'fruits fromage frais' do
    let(:nutrients) {{
      energy: 459,                       # kJ/100g
      fat_saturated: 1.8,                #  g/100g
      sugar: 13.4,                       #  g/100g
      sodium: 0.1 * 1e-3,                #  g/100g
      fruits_vegetables_nuts: 8,         #  g/100g (= weight-%)
      fibres: 0.6,                       #  g/100g
      proteins: 6.5,                     #  g/100g
    }}
    its(:score) { is_expected.to eq 0 }
    its(:less_healthy?) { is_expected.to be false }
  end

  # example from "Nutrient Profiling Technical Guidance January 2011" page 15
  context 'vanilla ice-cream' do
    let(:nutrients) {{
      energy: 741,                       # kJ/100g
      fat_saturated: 6.1,                #  g/100g
      sugar: 18.7,                       #  g/100g
      sodium: 60 * 1e-3,                 #  g/100g
      fruits_vegetables_nuts: 0,         #  g/100g (= weight-%)
      fibres: 0,                         #  g/100g
      proteins: 3.6,                     #  g/100g
    }}
    its(:score) { is_expected.to eq 12 }
    its(:less_healthy?) { is_expected.to be true }
  end

  # example from "Nutrient Profiling Technical Guidance January 2011" page 17
  context 'cup soup, tomato flavour' do
    let(:nutrients) {{
      energy: 155,                       # kJ/100g
      fat_saturated: 0.4,                #  g/100g
      sugar: 3.6,                        #  g/100g
      sodium: 471 * 1e-3,                #  g/100g
      fruits_vegetables_nuts: 0,         #  g/100g (= weight-%)
      fibres: 0.2,                       #  g/100g
      proteins: 0.3,                     #  g/100g
    }}
    its(:score) { is_expected.to eq 5 }
    its(:less_healthy?) { is_expected.to be true }
  end

  # example from "Nutrient Profiling Technical Guidance January 2011" page 18
  context 'fruit and nut cereal bars' do
    let(:nutrients) {{
      energy: 1504,                      # kJ/100g
      fat_saturated: 1.4,                #  g/100g
      sugar: 35.7,                       #  g/100g
      sodium: 0 * 1e-3,                  #  g/100g
      fruits_vegetables_nuts: 46,        #  g/100g (= weight-%)
      fibres: 4.8,                       #  g/100g
      proteins: 4.3,                     #  g/100g
    }}
    its(:score) { is_expected.to eq 6 }
    its(:less_healthy?) { is_expected.to be true }
  end
end