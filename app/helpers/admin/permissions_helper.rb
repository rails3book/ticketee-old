module Admin::PermissionsHelper
  def permissions
    { 
      "read" => "Read",
      "create tickets" => "Create Tickets"
    }
  end
end
