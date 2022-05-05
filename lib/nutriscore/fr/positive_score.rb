require_relative '../common/score'

module Nutriscore
  module FR
    class PositiveScore < Nutriscore::Common::Score

      def self.nutrient_keys
        [:fvnp, :fibres, :proteins]
      end

      def fvnp
        score_value(@nutrients.fvnp, 0..5) do |v|
          if    v > 80 then 5
          elsif v > 60 then 2
          elsif v > 40 then 1
          else              0
          end
        end
      end

      def fibres
        score_value(@nutrients.fibres, 0..5) do |v|
          if    v > 4.7 then 5
          elsif v > 3.7 then 4
          elsif v > 2.8 then 3
          elsif v > 1.9 then 2
          elsif v > 0.9 then 1
          else               0
          end
        end
      end

      def proteins
        score_value(@nutrients.proteins, 0..5) do |v|
          if    v > 8.0 then 5
          elsif v > 6.4 then 4
          elsif v > 4.8 then 3
          elsif v > 3.2 then 2
          elsif v > 1.6 then 1
          else               0
          end
        end
      end
    end
  end
end
