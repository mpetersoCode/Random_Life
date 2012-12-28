require 'spec_helper'

describe "StaticPages" do
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_selector('h1', text: 'Welcome to Random Life') }
    it { should have_selector('title', text: 'Random Life') }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_selector('h1', text: 'Contact Information') }
     it { should have_selector('title', text: 'Random Life | Contact') }
  end
  
  describe "Help page" do
    before { visit help_path }
    
    it { should have_selector('h1', text: 'Help') }
     it { should have_selector('title', text: 'Random Life | Help') }
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('h1', text: 'About Random Life') }
     it { should have_selector('title', text: 'Random Life | About') }
  end
end
