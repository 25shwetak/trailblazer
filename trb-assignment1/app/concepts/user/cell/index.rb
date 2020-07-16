module User::Cell
  class Index < Trailblazer::Cell
    def users
      @options[:result][:model]
    end
  end
end
