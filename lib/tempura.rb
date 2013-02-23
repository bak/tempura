# encoding: utf-8

module Tempura

  SCALES = %w(
    Celsius
    Delisle
    Fahrenheit
    Kelvin
    Newton
    Rankine
    Réaumur
    Rømer
  )

  ALIASES = {
    'romer' => 'rømer',
    'reaumur' => 'réaumur',
  }

end

require 'bigdecimal'
require 'tempura/version'
require 'tempura/temperature'
require 'tempura/celsius'
require 'tempura/delisle'
require 'tempura/fahrenheit'
require 'tempura/kelvin'
require 'tempura/newton'
require 'tempura/rankine'
require 'tempura/réaumur'
require 'tempura/rømer'
require 'tempura/core_ext/numeric'
require 'tempura/conversion'
