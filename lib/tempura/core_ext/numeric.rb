class Numeric

  Tempura::SCALES.each do |scale|
    define_method("degrees_#{scale.downcase}".intern) do
      Tempura.const_get(scale.intern).new(self)
    end
  end

  Tempura::ALIASES.each do |alt, canonical|
    alias_method("degrees_#{alt}".intern, "degrees_#{canonical}".intern)
  end
  
end
