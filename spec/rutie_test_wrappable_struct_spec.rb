# frozen_string_literal: true

RSpec.describe WasmerWrapper do
  it 'summarizes integers' do
    wrapper = described_class.new

    expect(wrapper.sum(34, 8)).to eq(42)
  end
end
