module ApplicationHelper
  ACTIVE_CLASS = 'active'.freeze

  def active_for(options)
    name_of_controller = options.fetch(:controller) { nil }
    name_of_action     = options.fetch(:action) { nil }
    request_path       = options.fetch(:path) { nil }
  
    return ACTIVE_CLASS if request_path && request_path == request.path
  
    if name_of_controller == controller_name
      ACTIVE_CLASS if name_of_action.nil? || (name_of_action == action_name)
    end
  end
end
