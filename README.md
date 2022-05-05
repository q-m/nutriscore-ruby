# Nutriscore

[![Gem Version](https://badge.fury.io/rb/nutriscore.svg)](https://rubygems.org/gems/nutriscore)

Consumer food products in some countries have a nutritional score, indicating
how healthy the product is to eat. Each country has its own approach, but in
the European Union the _Nutri-Score_ in several countries.

This gem implements the Nutri-Score for Ruby and includes adaptations for different
countries. The maintainer would be open to integrating other nutritional scores as well.

_**Note:** this is currently under development, the API may change without notice,
and scoring has not yet been fully verified. Be very careful using this in production._

## Nutri-Score

There are currently two versions of the Nutri-Score in use. The first was
[developed](https://www.food.gov.uk/business-guidance/nutrient-profiling-model-for-children)
in the UK by the Food Standards Agency and
[currently maintainted](https://www.gov.uk/government/publications/the-nutrient-profiling-model)
by the Department of Health. It is used for regulating food advertisements.

In France, an adapted
[Nutri-Score](https://www.santepubliquefrance.fr/Sante-publique-France/Nutri-Score)
was adopted in 2017 for use as a voluntary label on the packaging.
In 2018, Belgium and Spain adopted the same scheme.

Other countries are evaluating adopting the Nutri-Score as well, including
The Netherlands. There was also a
[European citizen's initiative](http://ec.europa.eu/citizens-initiative/public/initiatives/ongoing/details/2019/000008_en)
to adopt it Europe-wide, but this has been withdrawn.

## Installation

```
gem install nutriscore
```

## Usage

The input for all nutritional scores are a product category and nutritional values.
Which nutrients are required depends on the product category. Note that `fvnp` stands
for the amount of fruits, vegetables, nuts and pulses (and, since Oct 2019, also
rapeseed, walnuts and olive oils).

```ruby
require 'nutriscore'

# Fruit fromage frais
product_a = {
  energy: 459,          # kJ/100g
  fat_saturated: 1.8,   #  g/100g
  sugar: 13.4,          #  g/100g
  sodium: 0.1,          #  g/100g
  fvnp: 8,              #  g/100g (= weight-%)
  fibres: 0.6,          #  g/100g
  proteins: 6.5,        #  g/100g
}

# Compute the french Nutri-Score for a generic product.
score = Nutriscore::FR::SpecificScore.new(product_a)
#<Nutriscore::FR::SpecificScore score=0
#  positive_score=#<Nutriscore::FR::PositiveScore score=4
#                    fvnp=0 fibres=0 proteins=4>
#  negative_score=#<Nutriscore::FR::NegativeScore score=4
#                    energy=1 fat_saturated=1 sugar=2 sodium=0>>
score.score.single
# => 0
score.score_class.single
# => "B"
```

To be able to work with incomplete information, results are returned as ranges.
The use of `.single` in the above example converts these to a single value (it
returns `nil` if there is not enough information to get a single result). The
following example shows what happens when data is missing.

```ruby
score = Nutriscore::FR::SpecificScore.new(product_a.merge({ sodium: nil }))
score.score
# => 0..10
score.score.single
# => nil
score.score_class
# => "B".."C"
score.score_class.single
# => nil
```

Please only use `#single` and the regular Ruby `Range` methods on `#score` and `#score_class`.
Other methods do exist, but are not guaranteed to be stable across releases.

Different categories can use different score classes:
* `Nutriscore::FR::CheeseScore` for cheese
* `Nutriscore::FR::FatsScore` for vegetable and animal oils and fats
* `Nutriscore::FR::MineralWaterScore` for mineral water
* `Nutriscore::FR::DrinksScore` for other drinks
* `Nutriscore::FR::SpecificScore` for other food products

## UK

The UK has the same basis for computation, but it is used to determine
whether a product can be advertised (it must not be less healthy).

```ruby
score = Nutriscore::UK::SpecificScore.new(product_a)
score.score
# => 0
score.less_healthy?
# => false
```

The method `#less_healthy?` is UK-specific, and returns `true`, `false`, or `nil`
if there is not enough information to make a judgement.

By default, the fibres measurement method is AOAC (which is preferred), but
it is possible to use fibres values measured with the NSP method:

```ruby
# Acceptable values for the fibres_method are: :aoac and :nsp.
score = Nutriscore::UK::SpecificScore.new(product_a, fibres_method: :nsp)
```

Different categories can use different score classes:
* `Nutriscore::EN::SpecificScore` for food products
* `Nutriscore::EN::DrinksScore` for drinks

## License

This software is distributed under the [MIT license](LICENSE).
