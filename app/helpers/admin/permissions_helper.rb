module Admin::PermissionsHelper
  def permissions
    { 
      "read" => "Read",
      "create tickets" => "Create Tickets",
      "edit tickets" => "Edit Tickets",
      "delete tickets" => "Delete Tickets"
    }
  end
end
