# Nutriscore

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
The Netherlands. There is also a
[European citizen's initiative](http://ec.europa.eu/citizens-initiative/public/initiatives/ongoing/details/2019/000008)
to adopt it Europe-wide.

## Installation

```
gem install nutriscore
```

## Usage

The input for all nutritional scores are a product category and nutritional values.
Which nutrients are required depends on the product category.

```ruby
require 'nutriscore'

# Fruit fromage frais
product_a = {
  energy: 459,                       # kJ/100g
  fat_saturated: 1.8,                #  g/100g
  sugar: 13.4,                       #  g/100g
  sodium: 0.1 / 1000,                #  g/100g
  fruits_vegetables_legumes_nuts: 8, #  g/100g (= weight-%)
  fibres: 0.6,                       #  g/100g
  proteins: 6.5,                     #  g/100g
}

# Compute the french Nutri-Score for a generic product.
score = Nutriscore::FR::SpecificScore.new(product_a)
#<Nutriscore::FR::SpecificScore score=0
#  positive_score=#<Nutriscore::FR::PositiveScore score=4
#                    fruits_vegetables_legumes_nuts=0 fibres=0 proteins=4>
#  negative_score=#<Nutriscore::FR::NegativeScore score=4
#                    energy=1 fat_saturated=1 sugar=2 sodium=0>>
score.score
# => 0
score.score_class
# => "B"
```

Different categories can use different score classes:
* `Nutriscore::FR::CheeseScore` for cheese
* `Nutriscore::FR::FatsScore` for vegetable and animal oils and fats
* `Nutriscore::FR::MineralWaterScore` for mineral water
* `Nutriscore::FR::DrinksScore` for other drinks
* `Nutriscore::FR::SpecificScore` for other food products

## License

This software is distributed under the [MIT license](LICENSE).
