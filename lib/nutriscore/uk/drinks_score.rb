require_relative 'specific_score'
require_relative 'concerns/drinks_less_healthy'

module Nutriscore
  module UK
    # this is for general products
    class DrinksScore < SpecificScore
      include DrinksLessHealthy
    end
  end
end
