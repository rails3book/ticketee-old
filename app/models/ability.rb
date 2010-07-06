class Ability
  include CanCan::Ability
        
  def initialize(user)
    user.permissions.each do |permission|
      can permission.action.to_sym, permission.object_type.constantize do |object|
        object.nil? || permission.object_id.nil? || permission.object_id == object.id
      end
    end
  end
end
