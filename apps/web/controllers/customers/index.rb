module Web::Controllers::Customers
  class Index
    include Web::Action

    expose :customers

    def call(params)
      @customers = CustomerRepository.new.all
    end
  end
end
