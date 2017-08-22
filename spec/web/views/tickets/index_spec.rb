require 'spec_helper'
require_relative '../../../../apps/web/views/tickets/index'

describe Web::Views::Tickets::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/tickets/index.html.erb') }
  let(:view)      { Web::Views::Tickets::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
