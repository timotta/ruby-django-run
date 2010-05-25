class Django

  def initialize(args)
    @python = 'python'
    @projeto = args[:app]
    @final = 'ruby-django-run-final'
  end

  def arruma_identacao(codigo)
    sem_linha_vazia = codigo.split("\n").select { |linha| linha.strip.size > 0 }
    caracteres_a_remover = 0
    sem_linha_vazia[0].chars.each do |c| 
	break unless [" ","\t"].include?(c)
	caracteres_a_remover+=1
    end
    sem_linha_vazia.collect { |linha| linha[caracteres_a_remover, linha.size] }.join("\n")
  end

  def importa_django(codigo)
<<-eos
# -*- coding: utf-8 -*-
import sys
sys.path.append("#{@projeto}")
import settings
from django.core.management import setup_environ
setup_environ(settings)
#{codigo}
print "#{@final}",
eos
  end

  def escapa_aspas(codigo)
    codigo.gsub('"','\"')
  end

  def prepara_codigo(codigo)
    escapa_aspas(importa_django(arruma_identacao(codigo)))
  end

  def remove_last_line(text)
    text = text.gsub("#{@final}\n",'')
    return text[0..text.size-2]
  end

  def has_django_error(text)
    return true unless text
    return ! text.end_with?("#{@final}\n")
  end

  def raise_exception(codigo)
    raise "Error on this code:\n\n#{codigo}\n"
  end

  def run(codigo)
    codigo_preparado = prepara_codigo(codigo)
    printed = `#{@python} -c \"#{codigo_preparado}\" 2> /dev/null`
    raise_exception codigo_preparado if has_django_error printed
    remove_last_line printed
  end
end






