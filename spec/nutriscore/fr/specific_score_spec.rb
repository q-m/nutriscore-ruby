require_relative '../../spec_helper'
require 'nutriscore/fr/specific_score'

describe Nutriscore::FR::SpecificScore do
  subject(:score) { described_class.new(nutrients) }

  context 'without any nutrients' do
    let(:nutrients) { {} }
    its(:score) { is_expected.to be nil }
    its(:score_class) { is_expected.to be nil }
  end

  # example from "Nutrient Profiling Technical Guidance January 2011" page 14
  context 'fruits fromage frais' do
    let(:nutrients) {{
      energy: 459,                       # kJ/100g
      fat_saturated: 1.8,                #  g/100g
      sugar: 13.4,                       #  g/100g
      sodium: 0.1 / 1000,                #  g/100g
      fruits_vegetables_nuts: 8,         #  g/100g (= weight-%)
      fibres: 0.6,                       #  g/100g
      proteins: 6.5,                     #  g/100g
    }}
    its(:score) { is_expected.to eq 0 }
    its(:score_class) { is_expected.to eq 'B' }
  end

  # https://hak.be/assortiment/doperwtjes-met-worteltjes
  # https://be.openfoodfacts.org/product/8720600061103/pois-et-carottes-hak
  context 'green peas and carrots' do
    let(:nutrients) {{
      energy: 206,                        # kJ/100g
      fat_total: 0.2,                     #  g/100g
      fat_saturated: 0.1,                 #  g/100g
      carbohydrates: 7.8,                 #  g/100g
      sugar: 3.1,                         #  g/100g
      fruits_vegetables_nuts: 85,         #  g/100g (= weight-%)
      fibres: 3.6,                        #  g/100g
      proteins: 2.2,                      #  g/100g
      sodium: 0.31 / 2.5,                 #  g/100g
    }}
    its(:score) { is_expected.to eq(-9) } # @todo check
    its(:score_class) { is_expected.to eq 'A' }
  end

  # https://view.publitas.com/belgium-pdf-nl/nutriscore_120918_nl_ld/page/4
  context 'crunchy muesli' do
    let(:nutrients) {{
      energy: 1580,                       # kJ/100g
      fat_saturated: 4.2,                 #  g/100g
      sugar: 4.3,                         #  g/100g
      fruits_vegetables_nuts: 4,          #  g/100g (= weight-%)
      fibres: 24.9,                       #  g/100g
      proteins: 11.4,                     #  g/100g
      sodium: 0.15 / 2.5,                 #  g/100g
    }}
    its(:score) { is_expected.to eq(-2) }
    its(:score_class) { is_expected.to eq 'A' }
  end
end
