require 'spec_helper'
describe 'createuser' do
  context 'with default values for all parameters' do
    it { should contain_class('createuser') }
  end
end
