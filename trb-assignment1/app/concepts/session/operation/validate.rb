module Session::Operation
  class Validate < Trailblazer::Operation
    step :process

    def process(ctx, email:, password:, **)
      @form = User::Contract::Login.new(User.new)
      @form.validate(email: email, password: password)
    end   
  end
end