require 'spec_helper'

describe 'oh_my_zsh' do
  it do
    should contain_class('oh_my_zsh')
  end
end
