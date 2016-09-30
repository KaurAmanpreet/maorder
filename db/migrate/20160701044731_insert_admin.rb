class InsertAdmin < ActiveRecord::Migration
  def change

  	execute "insert into users(email,password,is_admin,is_active,is_seller,created_at,updated_at) values('admin@gmail.com','f6db8609951abadf4ad58725dcbf2f8db010c69e',1,1,0,NOW(),NOW());"  	

  end
end
