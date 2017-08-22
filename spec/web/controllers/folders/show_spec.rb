require 'spec_helper'
require_relative '../../../../apps/web/controllers/folders/show'

describe Web::Controllers::Folders::Show do
  let(:action) { Web::Controllers::Folders::Show.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
