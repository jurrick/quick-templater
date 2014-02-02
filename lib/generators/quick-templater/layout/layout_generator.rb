require 'rails/generators'

module QuickTemplater
  class LayoutGenerator < Rails::Generators::Base
    desc "Installs the application layout"
    source_root File.expand_path('../templates/bootstrap3', __FILE__)

    argument :layout_name, :type => :string, :default => 'application'

    class_option :app_name,     :type => :string,   :default => 'Web App',    :desc => 'Specify the application name'
    class_option :engine,       :type => :string,   :default => 'erb',        :desc => 'Specify the template engine (erb, haml or slim)'
    class_option :type,         :type => :string,   :default => 'bootstrap3', :desc => 'Layout type, default or bootstrap3'
    class_option :template,     :type => :string,   :default => 'starter',    :desc => 'Layout template, default starter'

    def copy_layout
      layout = "#{options.template.underscore}.html.erb"
      case options.engine
        when 'erb'
          template  layout, "app/views/layouts/#{layout_name.underscore}.html.erb"
        when 'haml'
          generate_haml_layout layout
        when 'slim'
          generate_slim_layout layout
      end
    end

    def copy_template_stylesheet
      template "quick-templater.css.erb", "app/assets/stylesheets/quick-templater.css"
    end

    protected

    def generate_haml_layout(layout)
      require 'haml'
      require 'html2haml'
      Dir.mktmpdir('quick-templater-haml') do |haml_root|
        tmp_html_path = "#{haml_root}/#{layout}"
        tmp_haml_path = "#{haml_root}/#{layout}.haml"
        template layout, tmp_html_path, :verbose => false
        `html2haml --erb --xhtml #{tmp_html_path} #{tmp_haml_path}`
        copy_file tmp_haml_path, "app/views/layouts/#{layout_name.underscore}.html.haml"
      end
    rescue LoadError
      say "HAML is not installed, or it is not specified in your Gemfile."
      exit
    end

    def generate_slim_layout(layout)
      require 'slim'
      require 'html2haml'
      require 'haml2slim'
      Dir.mktmpdir('quick-templater-slim') do |slim_root|
        tmp_html_path = "#{slim_root}/#{layout}"
        tmp_haml_path = "#{slim_root}/#{layout}.haml"
        tmp_slim_path = "#{slim_root}/#{layout}.slim"
        template layout, tmp_html_path, :verbose => false
        `html2haml --erb --xhtml #{tmp_html_path} #{tmp_haml_path}`
        `haml2slim #{tmp_haml_path} #{tmp_slim_path}`
        copy_file tmp_slim_path, "app/views/layouts/#{layout_name.underscore}.html.slim"
      end
    rescue LoadError
      say "SLIM is not installed, or it is not specified in your Gemfile."
      exit
    end
  end
end