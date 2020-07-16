# module User::Operation
#   class Welcome < Trailblazer::Operation
#     step :return_data

#     def return_data(ctx, **)
#       ctx[:model] = User.last
#     end
#   end
# end
module User::Operation
  class Welcome < Trailblazer::Operation
    step :return_data

    def return_data(ctx, token:, **)
      decoded = JsonWebToken.decode(token)
      ctx[:model] = User.find(decoded[:user_id])
    end
  end
end
