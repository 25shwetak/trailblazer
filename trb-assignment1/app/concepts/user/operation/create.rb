module User::Operation
  class Create < Trailblazer::Operation
    step Subprocess(User::Operation::New)
    step Contract::Validate(key: :user)
    step Contract::Persist()
  end
end
