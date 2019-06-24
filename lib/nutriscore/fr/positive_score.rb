require_relative '../common/score'

module Nutriscore
  module FR
    class PositiveScore < Nutriscore::Common::Score

      def self.nutrient_keys
        [:fruits_vegetables_legumes_nuts, :fibres, :proteins]
      end

      def fruits_vegetables_legumes_nuts
        value = @nutrients.fruits_vegetables_legumes_nuts
        if   !value      then nil
        elsif value > 80 then 5
        elsif value > 60 then 2
        elsif value > 40 then 1
        else                  0
        end
      end

      def fibres
        value = @nutrients.fibres
        if   !value       then nil
        elsif value > 4.7 then 5
        elsif value > 3.7 then 4
        elsif value > 2.8 then 3
        elsif value > 1.9 then 2
        elsif value > 0.9 then 1
        else                   0
        end
      end

      def proteins
        value = @nutrients.proteins
        if   !value       then nil
        elsif value > 8.0 then 5
        elsif value > 6.4 then 4
        elsif value > 4.8 then 3
        elsif value > 3.2 then 2
        elsif value > 1.6 then 1
        else                   0
        end
      end
    end
  end
end
