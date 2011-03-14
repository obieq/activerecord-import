module ActiveRecord::Import::PostgreSQLAdapter
  module InstanceMethods
    def self.included(klass)
      klass.instance_eval do
        include ActiveRecord::Import::ImportSupport
      end
    end

    def next_value_for_sequence(sequence_name)
      %{nextval('#{sequence_name}')}
    end

    def new_keys(primary_key)
      primary_key ? %{ RETURNING "#{primary_key}"} : ''
    end
  end
end
