# frozen_string_literal: true

RSpec.describe RutieTestWrappableStruct do
  it 'has a version number' do
    expect(RutieTestWrappableStruct::VERSION).not_to be nil
  end
end

RSpec.describe RubyClassWithLifetime do
  it 'wraps and unwraps string' do
    text = 'lolwut lolwut lolwut lolwut lolwut lolwut lolwut lolwut lolwut lolwut lolwut lolwut '
    test_struct = described_class.new(text)

    expect(test_struct.text).to eq text
  end
end
