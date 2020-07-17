module Session::Operation
  class Create < Trailblazer::Operation

    step :validate
    fail :blank_field
    step :find_user
    fail :not_found

    def validate(ctx, email:, password:, **)
      @form = User::Contract::Login.new(User.new)
      @form.validate(email: email, password: password)
    end

    def blank_field(ctx, **)
      puts "Email and Password cannot be blank"
    end

    def find_user(ctx, email:, **)
      ctx[:model] = User.find_by(email: email)
    end

    def not_found(ctx, **)
      puts "user not found"
    end
  end
end
