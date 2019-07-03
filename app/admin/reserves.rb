ActiveAdmin.register Reserve do
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
    column :created_at
    column :name
    column :phonetic
    column :number_of_people
    column :phone_number
    column :mail
    column :plan
    column :reservation_start
    column :reservation_end
    actions
  end

  show do
    attributes_table do
      row :created_at
      row :name
      row :phonetic
      row :number_of_people
      row :phone_number
      row :mail
      row :plan
      row :reservation_start
      row :reservation_end
    end
  end
end
