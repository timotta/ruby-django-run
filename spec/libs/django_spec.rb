require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../lib/django')

describe 'Django' do
  before :each do
    @django = Django.new :app => File.dirname(__FILE__) + '/../projetodjango'
    @django.run(<<-eos)
      from people.models import Person
      Person.objects.all().delete()
    eos
  end
  it 'should run django code' do
    printed = @django.run(<<-eos)
      from people.models import Person
      tiago = Person.objects.create(name='tiago')
      print tiago.name
    eos
    printed.should == "tiago"
  end
  it 'should run identeded django code' do
    printed = @django.run(<<-eos)
      from people.models import Person
      Person.objects.create(name='tiago')
      if Person.objects.count() > 0:
        print 'has people'
      else:
        print 'no people here'
    eos
    printed.should == 'has people'
  end
  it 'should run django code with special characters' do
    printed = @django.run(<<-eos)
      print "ção\t''"
    eos
    printed.should == "ção\t''"
  end
  it 'should raise exception when django code cause error' do
    begin
      @django.run("print Person.objects.all()")
      falhou = true
    rescue Exception => e
      e.message.should include('Error on this code:')
      e.message.should include('print Person.objects.all()')
    end  
    fail("should excepted an django error") if falhou
  end
end