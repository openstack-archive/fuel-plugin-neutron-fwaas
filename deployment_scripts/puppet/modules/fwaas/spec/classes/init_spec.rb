require 'spec_helper'
describe 'fwaas' do

  context 'with defaults for all parameters' do
    it { should contain_class('fwaas') }
  end
end
