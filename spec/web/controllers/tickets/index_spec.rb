require 'spec_helper'
require_relative '../../../../apps/web/controllers/tickets/index'

describe Web::Controllers::Tickets::Index do
  let(:action) { Web::Controllers::Tickets::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
