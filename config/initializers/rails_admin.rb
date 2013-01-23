# RailsAdmin config file. Generated on September 15, 2012 20:34
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Nin', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Address, Availability, BillingPlan, BillingRate, BillingRateSchedule, Certification, Client, ClientsPeople, Contract, Interpreter, Note, Person, Role, User, VirtualAddress]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Address, Availability, BillingPlan, BillingRate, BillingRateSchedule, Certification, Client, ClientsPeople, Contract, Interpreter, Note, Person, Role, User, VirtualAddress]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Address do
  #   # Found associations:
  #     configure :addressable, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :street, :string 
  #     configure :street2, :string 
  #     configure :city, :string 
  #     configure :state, :string 
  #     configure :zip, :string 
  #     configure :addressable_type, :string         # Hidden 
  #     configure :addressable_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :county, :string 
  #     configure :latitude, :float 
  #     configure :longitude, :float   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Availability do
  #   # Found associations:
  #     configure :interpreter, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :day_of_week, :string 
  #     configure :start_time, :time 
  #     configure :end_time, :time 
  #     configure :exception_date, :date 
  #     configure :not_available, :boolean 
  #     configure :interpreter_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model BillingPlan do
  #   # Found associations:
  #     configure :billable_plan, :polymorphic_association 
  #     configure :billing_rate_schedules, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :billable_plan_type, :string         # Hidden 
  #     configure :billable_plan_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model BillingRate do
  #   # Found associations:
  #     configure :billing_rate_schedule, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :increment_rate, :integer 
  #     configure :increment_type, :string 
  #     configure :start_time, :time 
  #     configure :end_time, :time 
  #     configure :min_increments, :integer 
  #     configure :overtime_threshold, :integer 
  #     configure :overtime_rate, :integer 
  #     configure :billing_rate_schedule_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model BillingRateSchedule do
  #   # Found associations:
  #     configure :billing_plan, :belongs_to_association 
  #     configure :billing_rate, :has_one_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :date_from, :date 
  #     configure :date_to, :date 
  #     configure :billing_plan_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Certification do
  #   # Found associations:
  #     configure :certifiable, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :certifier, :string 
  #     configure :certification, :string 
  #     configure :start_date, :date 
  #     configure :end_date, :date 
  #     configure :comment, :text 
  #     configure :certifiable_type, :string         # Hidden 
  #     configure :certifiable_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Client do
  # #   # Found associations:
    # configure :clients_people, :has_many_association
    # configure :sales_person, :has_one_association
    # configure :billing_person, :has_one_association
    # configure :scheduling_people, :has_many_association
      # configure :notes, :has_many_association 
      # configure :contracts, :has_many_association 
      # configure :mailing_address, :has_one_association 
      # configure :billing_address, :has_one_association 
      # configure :virtual_addresses, :has_many_association   #   # Found columns:
      # configure :id, :integer 
      # configure :mas90_id, :string 
      # configure :created_at, :datetime 
      # configure :updated_at, :datetime   #   # Sections:
    # list do; end
    # export do; end
    # show do; end
    # edit do; end
    # create do; end
    # update do; end
  # end
  # config.model ClientPeople do
    # # Found associations:
      # configure :client, :belongs_to_association 
      # configure :person, :belongs_to_association   #   # Found columns:
      # configure :id, :integer 
      # configure :client_id, :integer         # Hidden 
      # configure :person_id, :integer         # Hidden 
      # configure :relationship, :string 
      # configure :created_at, :datetime 
      # configure :updated_at, :datetime   #   # Sections:
    # list do; end
    # export do; end
    # show do; end
    # edit do; end
    # create do; end
    # update do; end
  # end
  # config.model Contract do
  #   # Found associations:
  #     configure :contractable, :polymorphic_association 
  #     configure :notes, :has_many_association 
  #     configure :billing_plan, :has_one_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :start_date, :date 
  #     configure :end_date, :date 
  #     configure :contractable_type, :string         # Hidden 
  #     configure :contractable_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Interpreter do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :physical_address, :has_one_association 
  #     configure :virtual_addresses, :has_many_association 
  #     configure :notes, :has_many_association 
  #     configure :availabilities, :has_many_association 
  #     configure :certifications, :has_many_association 
  #     configure :contracts, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :prefix_name, :string 
  #     configure :first_name, :string 
  #     configure :middle_name, :string 
  #     configure :last_name, :string 
  #     configure :postfix_name, :string 
  #     configure :preferred_language, :string 
  #     configure :gender, :string 
  #     configure :dob, :date 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Note do
  #   # Found associations:
  #     configure :notable, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :comment, :text 
  #     configure :visibility, :string 
  #     configure :notable_type, :string         # Hidden 
  #     configure :notable_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Person do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :physical_address, :has_one_association 
  #     configure :virtual_addresses, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :prefix_name, :string 
  #     configure :first_name, :string 
  #     configure :middle_name, :string 
  #     configure :last_name, :string 
  #     configure :postfix_name, :string 
  #     configure :preferred_language, :string 
  #     configure :gender, :string 
  #     configure :dob, :date 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Role do
  #   # Found associations:
  #     configure :resource, :polymorphic_association         # Hidden 
  #     configure :users, :has_and_belongs_to_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :resource_id, :integer         # Hidden 
  #     configure :resource_type, :string         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :roles, :has_and_belongs_to_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :authentication_token, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model VirtualAddress do
  #   # Found associations:
  #     configure :virtual_addressable, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :contact_type, :string 
  #     configure :contact_value, :string 
  #     configure :contact_label, :string 
  #     configure :virtual_addressable_type, :string         # Hidden 
  #     configure :virtual_addressable_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
