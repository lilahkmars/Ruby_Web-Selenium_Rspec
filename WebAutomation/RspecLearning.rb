
#describe和context帮助你组成分类
decrible Order do 
  # ...
end
#或是
describe "A Order" do
  # ...
end

#可以嵌套加入想要测试的方法
decrible Order do 
  
  describe "#amount" do #通常用#开头的是instanceMethod;用.或是::开头的是classMethod
    # ...
  end
  
end

#还可以嵌套加入不同情景
decrible Order do 
  
  describe "#amount" do 
    context "When user is vip" do #When describing a context, start its description with "when" or "with". 
      # ...
    end
    
    context "When user is not vip" do
      #...
    end
  end
  
end

#每个it就是一小段测试：Assertion or Expectation
decrible Order do 
  
  describe "#amount" do 
    context "When user is vip" do 
      it "should discount five percent if total > 1000" do 
        # ...
      end
    
      it "should discount ten percesnt if total > 10000" do
        #...
      end
    end
    
    context "When user is not vip" do
      it "should discount three percent if total > 10000" do
        #...
      end
    end
  end
  
end

#should和should_not：所有物件都有这个方法来定义你的期望
decrible Order do #
  
  describe "#amount" do 
    context "When user is vip" do 
      it "should discount five percent if total > 1000" do 
        user = User.new(:is_vip => true)
        order = Order.new(:user => user, :total =>2000)
        order.amount.should == 1900
      end
    
      it "should discount ten percesnt if total > 10000" do
        #...
      end
    end
    
    context "When user is not vip" do
      it "should discount three percent if total > 10000" do
        #...
      end
    end
  end
  
end

#测试用例需要一定量的设置工作，在Rspec中由before方法来完成
#向before传递一个可选标志（:each)和一个代码块
#before(:each)=>每段it之前执行；before(:all)整段describe执行一次
#同理可得after(:each)和after(:all)
#默认的标志是:each，也应该始终使用:each，使各个测试彼此独立
describe Order do
  
  describe "#amount" do
    context "when user is vip" do
    
      before(:each) do
        @user = User.new(:is_vip => true)
        @order = Order.new(:user => @user)
      end
      
      it "should discount five percent of total >= 1000" do
        @order.total = 2000
        @order.amount.should == 1900
      end
      
      it "should discount ten percent of total >= 10000" do
        @order.total = 10000
        @order.amount.should == 9000
      end
      
    end
    
    context "when user is not vip" do
      
      before(:each) do
        @user = User.new(:is_vip => false)
        @order = Order.new(:user => @user)
      end
      
      it "should discount three percent of total >= 10000" do
        @order.total = 10000
        @order.amount.should == 9700
      end
    
    end
  end
  
end

# pending:可以先列出打算要写的测试
describe Order do

  describe "#paid" do
    it "should be false if status is new"
    
    it "should be true if status is paid or shipping" do
      pending
    end
  end
  
end

#let(:name){expression}
#let方法简单的使用后面的block创建memoized attributes.换句话说就是为后面的测试准备数据，跟before里的代码一样的，但是比before里的代码效果更好。
#memozied的意思是let后面关联的block只执行一次，然后会缓存该变量，提高执行效率。
#Lazy，有需要才会运算，并且是Memoized
#相较于before(:each)增加执行速度
#不需要用instance variable放before
#增加可读性
#let!则是非lazy 
describe Order do
  
  describe "#amount" do
    context "when user is vip" do
    
       let(:user){User.new(:is_vip => true)}
       let(:order){Order.new(:user => user)} 
      end
      
      it "should discount five percent of total >= 1000" do
        @order.total = 2000
        @order.amount.should == 1900
      end
      
      it "should discount ten percent of total >= 10000" do
        @order.total = 10000
        @order.amount.should == 9000
      end
      
    end
    
    context "when user is not vip" do
      
      before(:each) do
        let(:user){User.new(:is_vip => false)}
        let(:order){Order.new(:user => user)} 
      end
      
      it "should discount three percent of total >= 10000" do
        @order.total = 10000
        @order.amount.should == 9700
      end
    
    end
  end
  
end

#should后面的各种matcher
target.should be_true # target.should == true
target.should be_false # target.should == false
target.should be_nil # target.should == nil

#检查类别和方法
target should be_a_kind_of(Array) # target.class.should == Array
target should be_an_instance_of(Array) # target.class.should == Array

target should respond_to(:foo) # target.respond_to?(:foo) == true

#检查Array和Hash
target.should have_key(:foo) # target[:foo].should_not == nil
target.should include(4) # target.include?(4) == true
target.should have(3).items # target.item.length == 3

#任何be_开头
target.should be_empty # target.empty?.should == true
target.should be_blank # target.blank?.shuold == true
target.should be_admin # target.admin?.should == true

#expect to:期望一段程式会改变某个值或是丢出例外或是异常
#改变值的例子
describe Order do
  describe "#ship!" do
  
    context "with paid" do
      it "should update status tp shipping" do
        expect {
          order.ship!
        }.to change {order.status}.form("new").to("shipping")
      end
    end
    
  end
end
#其实和这个版本是一样的
describe Order do
  describe "#ship!" do
  
    context "with paid" do
      it "should update status tp shipping" do
        order.status.should == "new"
        order.ship!
        order.status.should == "shipping"
      end
    end
    
  end
end
#例外的例子
describe Order do
  describe "#ship!" do
  
    context "with paid" do
      it "should raise NotPaidError" do
        expect {
          order.paid? = false
          order.ship!
        }.to raise_error(NotPaidError)
      end
    end
    
  end
end

#使用subject可省略receiver
describe Order do
 
  subject {Order.new(:status => "New")}
  it {should be_vaild} #subject.valid?.should == true

end

#its可省略receiver的方法呼叫
describe Order do
 
  subject {Order.new(:status => "New")}
  its(:status) {should == "New"} #subject.status.should == "New"

end

#一些别名方法：describe和context是alias；it.specify.example都是一样的

#一些惯例
 #一个rb文档配一个同名的_spec.rb文档
  #容易找
  #watchr等工具容易设定
  #editor有支援快速建
 #describe“#title”是instance method
 #describe“.title"是class method
 
#输出格式
 #rspec filename.rb 预设不产生文件
 #rspec filename.rb -fs 输出specdoc文件
 #rspec filename.rb -fh 输出html文件
 




