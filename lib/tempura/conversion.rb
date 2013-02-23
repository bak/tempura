class Tempura::Conversion
  
  def initialize(klass)
    @klass = klass
  end

  Tempura::SCALES.each do |scale|
    define_method(scale.downcase.intern) do
      Tempura.const_get(scale.intern).new(klass)
    end
  end

  Tempura::ALIASES.each do |alt, canonical|
    alias_method(alt.intern, canonical.intern)
  end

  private

  attr_reader :klass

end
