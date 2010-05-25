class Django

  def initialize(args)
    @python = args[:python] ? args[:python] : 'python'
    @app_django = args[:app]
    @markup_end_code = 'ruby-django-run-final'
  end

  def run(code)
    command = command_line prepares_code code
    printed = `#{command}`
    raise_exception command if has_django_error printed
    remove_last_line printed
  end
  
  private
  
  def prepares_identation(code)
    sem_linha_vazia = code.split("\n").select { |linha| linha.strip.size > 0 }
    caracteres_a_remover = 0
    sem_linha_vazia[0].chars.each do |c| 
      break unless [" ","\t"].include?(c)
      caracteres_a_remover+=1
    end
    sem_linha_vazia.collect { |linha| linha[caracteres_a_remover, linha.size] }.join("\n")
  end

  def imports_django(code)
<<-eos
# -*- coding: utf-8 -*-
import sys
sys.path.append("#{@app_django}")
import settings
from django.core.management import setup_environ
setup_environ(settings)
#{code}
print "#{@markup_end_code}"
eos
  end

  def escapes_quotes(codigo)
    codigo.gsub('"','\"')
  end

  def prepares_code(code)
    escapes_quotes(imports_django(prepares_identation(code)))
  end

  def remove_last_line(text)
    text = text.gsub("#{@markup_end_code}\n",'')
    return text[0..text.size-2]
  end

  def has_django_error(text)
    return true unless text
    return ! text.end_with?("#{@final}\n")
  end

  def raise_exception(code)
    raise "Error on this code:\n\n#{code}\n"
  end

  def command_line(code)
    "#{@python} -c \"#{code}\" 2> /dev/null"
  end
  
end






