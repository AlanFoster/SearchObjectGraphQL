module Types
  class QueryType < GraphQL::Schema::Object
    field :categories_working, [Types::CategoryType], function: Resolvers::CategorySearch

    field :categories_not_working, Types::CategoryType.connection_type, function: Resolvers::CategorySearch
  end
end
