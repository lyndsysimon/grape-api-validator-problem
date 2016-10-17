require 'grape'
require 'pry'

class EqualsRouteParam < Grape::Validations::Base
  def validate_param!(attr_name, params)
    # Doesn't work - params[:route_param] is always nil.
    return if params[:route_param] == params[attr_name]
    raise Grape::Exceptions::Validation,
          params: [@scope.full_name(attr_name)],
          message: "inner(`#{params[attr_name]}`) != route_param(`#{params[:route_param]}`)"
  end
end

module Micro
  class API < Grape::API
    format :json

    route_param :route_param do
      params do
        requires :outer, type: Hash do
          requires :inner, equals_route_param: true
        end
      end
      get do
        {
          'route_param': params[:route_param],
          'outer': params[:outer]
        }
      end
    end
  end
end
