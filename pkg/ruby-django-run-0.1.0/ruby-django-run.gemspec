# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-django-run}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tiago Albineli Motta"]
  s.date = %q{2010-05-25}
  s.description = %q{A gem to execute django code inside a ruby code}
  s.email = %q{timotta@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/django.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/django.rb", "spec/libs/django_spec.rb", "spec/projetodjango/__init__.py", "spec/projetodjango/__init__.pyc", "spec/projetodjango/manage.py", "spec/projetodjango/people/__init__.py", "spec/projetodjango/people/__init__.pyc", "spec/projetodjango/people/models.py", "spec/projetodjango/people/models.pyc", "spec/projetodjango/people/tests.py", "spec/projetodjango/people/views.py", "spec/projetodjango/settings.py", "spec/projetodjango/settings.pyc", "spec/projetodjango/urls.py", "spec/projetodjango/urls.pyc", "tmp/specs/index.html", "Manifest", "ruby-django-run.gemspec"]
  s.homepage = %q{http://github.com/timotta/ruby-django-run}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ruby-django-run", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ruby-django-run}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A gem to execute django code inside a ruby code}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
