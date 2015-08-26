ActiveAdmin.register Word do

  filter :user, as: :select, collection: User.all.map {|u| [u.email, u.id]}
  filter :native
  filter :translit
  filter :translat

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map {|u| [u.email, u.id]}
      f.input :native
      f.input :translit
      f.input :translat
    end
    f.actions
  end

  show do |word|
    attributes_table do
	row :native
	row :translit
	row :translat
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
