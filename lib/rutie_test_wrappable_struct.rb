# frozen_string_literal: true

require_relative 'rutie_test_wrappable_struct/version'
require 'rutie'

module RutieTestWrappableStruct
  Rutie.new(:rutie_test_wrappable_struct_lib, release: 'debug').init('Init_rutie_test_wrappable_struct', __dir__)
end
