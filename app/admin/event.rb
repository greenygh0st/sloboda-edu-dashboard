ActiveAdmin.register Event do
  permit_params :subject, :datetime, :confirmed, :location_id,
                :user_events, :users

  index do
    selectable_column
    column :id
    column :subject
    column :datetime
    column :confirmed
    column :location
    column :created_at

    ##########
    column :speakers do |event|
      table_for event.users.each do
        column do |user|
          link_to user.email, [:admin, user]
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :subject
      row :location
      table_for event.users.each do
        column do |user|
          link_to user.email, [:admin, user]
        end
      end
    end
  end

  form do |f|
    f.inputs 'Event' do
      f.semantic_errors(*f.object.errors.keys)
      f.input :subject
      f.input :datetime, as: :datetime_picker
      f.input :location
      f.input :confirmed

      ##########
      # f.input :users, as: :select, multiple: true,
      # collection: User.all.map {|q| [q.email, q]}

      # f.input :users,
      # collection: User.all.map{ |user| [user.email, user.id] },
      # multiple: 'multiple'
      # f.input :users, as: :check_boxes
    end
    f.actions
  end

  filter :confirmed, as: :check_boxes

  scope :all, default: true
  scope :today do |events|
    events.where('datetime between ? and ?',
                 DateTime.now.beginning_of_day,
                 DateTime.now.beginning_of_day + 1.days)
  end
  scope :this_week do |events|
    events.where('datetime between ? and ?',
                 DateTime.now.beginning_of_day, 1.week.from_now)
  end
  scope :past do |events|
    events.where('datetime < ?', DateTime.now.beginning_of_day)
  end
end
