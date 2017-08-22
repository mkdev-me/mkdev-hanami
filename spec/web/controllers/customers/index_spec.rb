require 'spec_helper'
require_relative '../../../../apps/web/controllers/customers/index'

describe Web::Controllers::Customers::Index do
  let(:action) { Web::Controllers::Customers::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
