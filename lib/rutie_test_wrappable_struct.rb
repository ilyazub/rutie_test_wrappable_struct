# frozen_string_literal: true

require_relative 'rutie_test_wrappable_struct/version'
require 'wasmer'
class WasmerWrapper
  def initialize
    store = Wasmer::Store.new

    # Let's compile the module to be able to execute it!
    module_ = Wasmer::Module.new store, IO.read('target/lib.wasm', mode: 'rb')

    # Now the module is compiled, we can instantiate it.
    @_instance = Wasmer::Instance.new module_, nil
  end

  def sum(x, y)
    @_instance.exports.sum.call(x, y)
  end
end
