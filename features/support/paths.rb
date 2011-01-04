module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the project page for "([^\"]*)"/
      project_path(@account, project($1))
    when /the "([^\"]*)" ticket in the "([^\"]*)" project/
      project_ticket_path(@account, project($2), Ticket.find_by_title!($1))
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end

  def project(name)
    Project.find_by_name!(name)
  end
end

World(NavigationHelpers)
