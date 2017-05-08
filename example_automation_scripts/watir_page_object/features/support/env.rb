# encoding: utf-8
require 'page-object'
require 'page-object/page_factory'
require 'watir'
require 'pry'

World(PageObject::PageFactory)

$browser = Watir::Browser.new :chrome
