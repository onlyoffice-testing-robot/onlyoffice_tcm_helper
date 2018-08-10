require 'onlyoffice_tcm_helper/helpers/rspec_helper'
require 'onlyoffice_tcm_helper/version'
require 'rspec'
# namespace for gem
module OnlyofficeTcmHelper
  # Class for generate data for result by RSpec::Core::Example
  class TcmHelper
    include RspecHelper
    attr_accessor :status, :case_name, :example, :comment, :product_name, :plan_name, :suite_name, :last_case

    def initialize(params = {})
      @product_name = params[:product_name]
      @plan_name = params[:plan_name]
      @suite_name = params[:suite_name]
    end

    # @param [RSpec::Core::Example] example - is a returned object in "after" block
    # @return [TcmHelper] is object
    def parse(example)
      @case_name = example.metadata[:description]
      get_status_and_comment(example)
      self
    end

    # @param [RSpec::Core::Example] example - is a returned object in "after" block
    # @return [Symbol] is a symbolic name of test status
    def get_status_and_comment(example)
      @status = if result_is_failed?(example)
                  @comment = "\n#{example.exception.to_s.gsub('got:', "got:\n").gsub('expected:', "expected:\n").gsub('to return ', "to return:\n")}\nIn line:\n#{RspecHelper.find_failed_line(example)}"
                  :failed
                elsif example.pending?
                  @comment = example.execution_result.pending_message
                  :pending
                elsif result_is_passed?(example)
                  @comment = "\nOk"
                  :passed
                elsif result_is_passed2?(example)
                  @comment = "\nPassed 2"
                  :passed_2
                elsif result_is_service_unavailable?(example)
                  @comment = "\n#{example.exception}"
                  :service_unavailable
                elsif result_is_lpv?(example)
                  @comment = "\n#{example.exception}"
                  :lpv
                else
                  @comment = "\n#{example.exception}"
                  :aborted
                end
      @last_case = @case_name
    end

    def result_is_passed?(example)
      example.exception.nil? && @last_case != example.description
    end

    def result_is_passed2?(example)
      example.exception.nil? && @last_case == example.description
    end

    def result_is_failed?(example)
      # return true if example.metadata[:execution_result].pending_fixed
      ['got:', 'expected:', 'to return'].map do |current_error|
        return true if example.exception.to_s.include?(current_error)
      end
      false
    end

    def result_is_service_unavailable?(example)
      example.exception.to_s.include?('Service Unavailable')
    end

    def result_is_lpv?(example)
      example.exception.to_s.include?('Limited program version')
    end
  end
end
