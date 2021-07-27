RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it 'is valid' do

      test1 = User.create(
        name:'rando', 
        first_name:'rando', 
        last_name:'rando',
        email:'rando@gmail.com',
        password:'123123' ,
        password_confirmation:'123123'
      )
      puts test1.errors.full_messages
      puts 'valid registration'
      expect(test1).to be_valid
      
    end
    
    it 'should fail because user did not enter first name' do

      test1 = User.create(
        name:'rando',
        first_name:nil,
        last_name:'rando',
        email:'rando@gmail.com',
        password:'123123' ,
        password_confirmation:'123123'
      )
      puts test1.errors.full_messages
      expect(test1.valid?).to be false
      
    end

    it 'should fail because user did not enter last name' do

      test1 = User.create(
        name:'rando', 
        first_name:'rando',
        last_name:nil,
        email:'rando@gmail.com',
        password:'123123' ,
        password_confirmation:'123123'
      )
      puts test1.errors.full_messages
      expect(test1.valid?).to be false
      
    end

    it 'should fail because user did not an email' do

      test1 = User.create(
        name:'rando', 
        first_name:'rando',
        last_name:'rando',
        email:nil,
        password:'123123' ,
        password_confirmation:'123123'
      )
      puts test1.errors.full_messages
      expect(test1.valid?).to be false
      
    end
    
    it 'should fail because password dont match' do

      test1 = User.create(
        name:'rando', 
        first_name:'rando',
        last_name:'rando',
        email:nil,
        password:'123123' ,
        password_confirmation:'1223'
      )
      puts test1.errors.full_messages
      expect(test1.valid?).to be false
      
    end


    it 'should fail second user registration due to two identical email' do

      test1 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'rando@gmail.com',
        password:'123123' ,
        password_confirmation:'123123'
      )
      puts test1.errors.full_messages
      expect(test1).to be_valid
      
      test2 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'RANDO@GMAIL.COM',
        password:'123123',
        password_confirmation:'123123'
      )
      puts test2.errors.full_messages
      expect(test2.valid?).to be false
    end

    it 'should fail because user password is less than minimal of 6 character' do
  
      test1 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'RANDO@GMAIL.COM',
        password:'124',
        password_confirmation:'124'
      )
      puts test1.errors.full_messages
      expect(test1.valid?).to be false
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should be valid with credentials' do
  
      user1 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'rando@gmail.com',
        password:'1234567',
        password_confirmation:'1234567'
      )


     user1 = User.authenticate_with_credentials('rando@gmail.com', '1234567')
     puts user1.errors.full_messages
      expect(user1).not_to be(nil)
    end


    it 'should fail becaues password does not match' do
  
      user1 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'rando@gmail.com',
        password:'1234567',
        password_confirmation:'1234567'
      )


     user1 = User.authenticate_with_credentials('rando@gmail.com', '12367')
      expect(user1).to be(nil)
    end

    it 'should fail becaues email does not match' do
  
      user1 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'rando@gmail.com',
        password:'1234567',
        password_confirmation:'1234567'
      )


     user1 = User.authenticate_with_credentials('rdo@gmail.com', '1234567')
     
      expect(user1).to be(nil)
    end


    it 'should be valid with upper case email' do
  
      user1 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'rando@gmail.com',
        password:'1234567',
        password_confirmation:'1234567'
      )


     user1 = User.authenticate_with_credentials('    RANdo@gMail.com', '1234567')
     
      expect(user1).not_to be(nil)
    end


    it 'should fail becaues password does not match' do
  
      user1 = User.create(
        name:'rando',
        first_name:'rando',
        last_name:'rando',
        email:'rando@gmail.com',
        password:'PASSWORD',
        password_confirmation:'PASSWORD'
      )


     user1 = User.authenticate_with_credentials('rdo@gmail.com', 'password')
     
      expect(user1).to be(nil)
    end



  end

end