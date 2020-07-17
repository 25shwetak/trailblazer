module User::Operation
  class Index < Trailblazer::Operation
    step :return_user

    def return_user(ctx, **)
      ctx[:model] = User.all
    end
  end
end
