module User::Cell
  class Welcome < Trailblazer::Cell
    
    def user
      @options[:result][:model]
    end
  end
end
