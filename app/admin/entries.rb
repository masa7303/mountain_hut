ActiveAdmin.register Entry do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


    index do
        selectable_column
        column :title
        column :body do |entry|
            sanitize(remove_image(entry.body).truncate(100))
        end
    end

    form do |f|
        f.inputs 'Entry' do
            f.input :title
            f.input :body, as: :medium_editor, input_html: { data: { options: '{"spellcheck":false,"toolbar":{"buttons":["bold","italic","underline","anchor"]}}' } }
            f.input :posted_at
            f.input :status
        end
        f.actions
    end

    show do
        attributes_table do
            row :title
            row (:body) {|entry| sanitize(entry.body)}
            row :posted_at
            row :status
        end
        active_admin_comments
    end
end
