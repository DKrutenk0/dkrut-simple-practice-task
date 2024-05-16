# frozen_string_literal: true

module Tools
  module ElementsSearch
    def element(name, type, selector)
      define_method(name) do
        find(type, selector)
      end
    end

    def elements(name, type, selector)
      define_method(name) do
        find_all(type, selector)
      end
    end
  end
end
