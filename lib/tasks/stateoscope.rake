namespace :stateoscope do
  desc 'visualize state machine for a given class'
  task :visualize, %i[class state_machine_name current_state] => :environment do |_, args|
    raise ArgumentError, 'missing required argument <class>' if args[:class].nil?
    klass = args[:class].classify.constantize
    Stateoscope.visualize(klass, args)
  end
end
