module User::Operation
  class Index < Trailblazer::Operation
    step :return_data

    def return_data(ctx, **)
      ctx[:model] = User.all
    end
  end
end
