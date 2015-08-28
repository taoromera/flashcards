ActiveAdmin.register Word do

  filter :user, as: :select, collection: User.all.map {|u| [u.email, u.id]}
  filter :native
  filter :translit
  filter :translat
  filter :sentence
  filter :sent_trans

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map {|u| [u.email, u.id]}
      f.input :native
      f.input :translit
      f.input :translat
      f.input :sentence
      f.input :sent_trans
    end
    f.actions
  end

  show do |word|
    attributes_table do
	row :native
	row :translit
	row :translat
	row :sentence
	row :sent_trans
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
