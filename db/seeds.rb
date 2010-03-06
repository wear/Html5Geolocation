# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
                                                              
cities = Filter.create([{:name => '上海',:category => 'city'},{:name => '北京',:category => 'city'}])    
area = Filter.create(:name => '地区',:category => 'area',:parent_id => cities.first.id )
Filter.create(:name => '杨浦区',:category => '地区',:parent_id => cities.first.id,:order => 1 )
Filter.create(:name =>'卢湾区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'徐汇区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'静安区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'长宁区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'浦东新区',:category => '地区',:parent_id => cities.first.id,:order => 1 ) 
Filter.create(:name =>'黄浦区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'普陀区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'闸北区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'虹口区',:category => '地区',:parent_id => cities.first.id,:order => 1 )   
Filter.create(:name =>'近郊',,:category => '地区',:parent_id => cities.first.id,:order => 1 ) 
Filter.create(:name =>'闵行区',:category => '地区',:parent_id => cities.first.id,:order => 1 )  
Filter.create(:name =>'宝山区',:category => '地区',:parent_id => cities.first.id,:order => 1 ) 
caixi = Filter.create(:name => '菜系',:category => '菜系',:parent_id => cities.first.id )