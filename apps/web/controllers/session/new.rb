module Web::Controllers::Session
  class New
    include Web::Action

    def auth_hash
      request.env["omniauth.auth"]
    end

    def warden
      request.env["warden"]
    end

    def call(params)

      if auth_hash[:extra][:raw_info][:hd] == "mkdev.me"
        info = auth_hash[:info]

        user = OpenStruct.new
        user.email = info[:email]

        warden.set_user user
        redirect_to "/"
      else
        redirect_to "https://mkdev.me"
      end
    end

    def authenticate!; end

  end
end
