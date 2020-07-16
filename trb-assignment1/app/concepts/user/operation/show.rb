module User::Operation
  class Show < Trailblazer::Operation
    step :find
    def find(ctx, email:, **)
      ctx[:user] = User.find_by(email: email)
    end
  end
end