namespace :stateoscope do
  desc 'visualize state machine for a given class'
  task :visualize, %i[class state_machine_name current_state] => :environment do |_, args|
    args = args.to_hash
    klass = args.delete(:class)
    raise ArgumentError, 'missing required argument <class>' if klass.blank?
    Stateoscope.visualize(klass.classify.constantize, args)
  end
end
