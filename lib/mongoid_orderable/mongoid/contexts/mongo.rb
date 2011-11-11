module MongoidOrderable #:nodoc:
  module Mongoid #:nodoc:
    module Contexts #:nodoc:
      module Mongo #:nodoc:
        def inc attributes = {}
          klass.collection.update(
            selector,
            { "$inc" => attributes },
            :multi => true,
            :safe => ::Mongoid.persist_in_safe_mode
          )
        end
      end
    end
  end
end

Mongoid::Contexts::Mongo.send :include, MongoidOrderable::Mongoid::Contexts::Mongo
