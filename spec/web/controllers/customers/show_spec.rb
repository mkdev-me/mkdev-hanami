require 'spec_helper'
require_relative '../../../../apps/web/controllers/customers/show'

describe Web::Controllers::Customers::Show do
  let(:action) { Web::Controllers::Customers::Show.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
