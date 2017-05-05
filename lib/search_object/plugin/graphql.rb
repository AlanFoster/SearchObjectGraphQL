module SearchObject
  module Plugin
    module Graphql
      def self.included(base)
        base.extend ClassMethods
      end

      attr_reader :object, :context

      def initialize(filters: {}, object: nil, context: {}, scope: nil)
        @object = object
        @context = context

        super filters: filters, scope: scope
      end

      module ClassMethods
        def call(object, args, context)
          new(filters: args.to_h, object: object, context: context).results
        end

        def option(name, options = nil, &block)
          arguments[name] = options.fetch(:type) { raise 'TODO error class' }

          super
        end

        def types
          GraphQL::Define::TypeDefiner.instance
        end

        def arguments
          config[:args] ||= {}
        end
      end

      module Helper
        module_function

        def add_field(name, type, search_object, to:)
          to.field name do
            type type

            search_object.arguments.each do |(argument_name, argument_type)|
              argument argument_name, argument_type
            end

            resolve search_object
          end
        end
      end
    end
  end
end
