ActiveAdmin.register_page "Dashboard" do


  #section "Tasks that are late" do
  #  table_for current_admin_user.tasks.where('due_date < ?', Time.now) do |t|
  #    t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
  #    t.column("Title") { |task| link_to task.title, admin_task_path(task) }
  #    t.column("Assigned To") { |task| task.admin_user.email }
  #    t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
  #  end
  #end

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    #div class: "blank_slate_container", id: "dashboard_default_message" do
    #  span class: "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    #end




    section "Pending IP Assets" do
      table_for Ip.where('status = ? ', 0).each do |stake|
        column("Status") {|ip| status_tag("Pending") }
        column("Title") { |ip| link_to ip.title, admin_ip_path(ip) }
        #column("Assigned To") { |ip| ip.users.email }
      end
    end

    section "Reviewing IP Assets" do
      table_for Ip.where('status = ? ', 1).each do |ip|
        column("Status") {|ip| status_tag("Reviewing") }
        column("Title") { |ip| link_to ip.title, admin_ip_path(ip) }
    #    column("Assigned To") { |micropost| micropost.user.email }
      end
    end

    section "Accepted IP Assets" do
    table_for Ip.where('status = ? ', 2).each do |ip|
      column("Status") {|ip| status_tag("Accepted") }
      column("Title") { |ip| link_to ip.title, admin_ip_path(ip) }
    #  column("Assigned To") { |micropost| micropost.user.email }
    end
  end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
