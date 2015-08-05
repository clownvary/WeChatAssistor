
--package.path=package.path .. ";/User/Media/TouchSprite/lua/?.lua"

--require "Common"
init("0",0)
local Auto={}
local Common={}
---*****基础方法*****
Common.click=function(x,y)
	local cx,cy=x + math.random(-5, 5), y + math.random(-5, 5)
    touchDown(1,cx,cy)
    mSleep(math.random(100, 700))
	touchUp(1,cx,cy)
end
--快速点击，有些情况 延迟太久会失效
Common.clickS=function(x,y)
	local cx,cy=x + math.random(-5, 5), y + math.random(-5, 5)
    touchDown(1,cx,cy)
    mSleep(math.random(100, 400))
	touchUp(1,cx,cy)
end
--随机延迟
Common.sleepR=function(t)
mSleep(math.random(t-200,t+200))	

end	
--滑动屏幕
Common.move=function(xs,ys,xd,yd,n)
  w=xd-xs
   h=yd-ys
    touchDown(1,xs,ys)
        if xs<xd then    --向左还是向右
                        ws=1
                        else
                        ws=-1
        end
        if ys<yd then    --向上还是向下
                        hs=1
                        else
                        hs=-1
        end
        if math.abs(w)>math.abs(h) then

                        for i=0,w,ws*n do
							
                                        touchMove(1,xs+i,yd)
                        mSleep(10)
                        end
         else

                        for i=0,h,hs*n do
                        touchMove(1,xd,ys+i)
                        mSleep(10)
                        end
                        touchUp(1,xs,ys)
						
        end
end
    
Common.slideUp=function(h)
Common.move(255,1100,290,1100-h,4)--从最底部往上滑
Common.sleepR(1000)
end
Common.slideUp2=function(h)
 touchDown(1,467,1000)
		mSleep(2000)
		touchMove(1,467,1000-h)
		mSleep(1000)
		touchUp(1,467,1000-h)
end
Common.slideLeft=function(w)
 touchDown(1,602,890)
		mSleep(2000)
		touchMove(1,602-w,890)
		mSleep(1000)
		touchUp(1,602-w,890)
end
Common.slideRight=function(w)
 touchDown(1,80,890)
		mSleep(2000)
		touchMove(1,80+w,890)
		mSleep(1000)
		touchUp(1,80+w,890)
end
Common.slideDown=function(h) 
Common.move(255,180,290,180+h,4)
Common.sleepR(1000)
end
Common.start=function()
dialog("功能开始执行！",2)
end
Common.over=function()
dialog("功能执行完毕！",0)
end

---全局变量声明

Auto.AddByNear={}
Auto.AddByNear.config={}
Auto.AddBySearch={}
Auto.AddBySearch.config={}
Auto.ThrowBox={}
Auto.ThrowBox.config={}
Auto.PickBox={}
Auto.PickBox.config={}
Auto.AutoRecieve={}
Auto.AutoRecieve.config={}
Auto.AutoRecieveNearBy={}
Auto.AutoRecieveNearBy.config={}
Auto.AddByGroup={}
Auto.AddByGroup.config={}
Auto.LikeAndComment={}
Auto.LikeAndComment.config={}
Auto.Like={}
Auto.Like.config={}
Auto.AddByContact={}
Auto.AddByContact.config={}
Auto.SentByContact={}
Auto.SentByContact.config={}
Auto.SentByLast={}
Auto.SentByLast.config={}
Auto.NoMoments={}
Auto.NoMoments.config={}
Auto.SentFavByContact={}
Auto.SentFavByContact.config={}
Auto.SentCardByContact={}
Auto.SentCardByContact.config={}
Auto.SentByGroup={}
Auto.SentByGroup.config={}
Auto.SentFavByGroup={}
Auto.SentFavByGroup.config={}
Auto.SentCardByGroup={}
Auto.SentCardByGroup.config={}
Auto.SentFavByLast={}
Auto.SentFavByLast.config={}
Auto.SentCardByLast={}
Auto.SentCardByLast.config={}
Auto.AutoMomentsWord={}
Auto.AutoMomentsWord.config={}
Auto.AutoMomentsImg={}
Auto.AutoMomentsImg.config={}
Auto.AddByContactHasWX={}
Auto.AddByContactHasWX.config={}
Auto.AddByContactList={}--通讯录添加手机联系人
Auto.AddByContactList.config={}
Auto.AddByQQHasWX={}
Auto.AddByQQHasWX.config={}
Auto.AddByMultiGroup={}
Auto.AddByMultiGroup.config={}
Auto.ZombieCheck={}
Auto.ZombieCheck.config={}
Auto.ZombieCheckDel={}
Auto.ZombieCheckDel.config={}
Auto.MultiLog={}
Auto.MultiLog.config={}
---*****一.001*****
---*****附近的人打招呼*****
Auto.AddByNear.sayHello=function(i)
	 local n
     if(i%7==0) then
     n=6
     else
     n=(i%7)-1	 
	 end
	Common.click(306,186+(n*Auto.AddByNear.config.row_h))
	Common.sleepR(Auto.AddByNear.config.g_s_time)	
  local x,y=findMultiColorInRegionFuzzy(0xFFFFFF,"22|-8|0x06BF04,41|10|0xFFFFFF,72|-4|0xFFFFFF",100,4, 307, 640, 1070)--打招呼按钮
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+100,y+15)
		 Common.sleepR(2000)
		 inputText(Auto.AddByNear.config.say[math.random(1,3)])
		Common.click(586,81)--点击发送
	    Common.sleepR(Auto.AddByNear.config.g_s_time)	--延迟要长，出错率较高
	    Common.sleepR(Auto.AddByNear.config.g_s_time)
	    Common.sleepR(Auto.AddByNear.config.g_s_time)		
	    Common.click(48,84)
	    Common.sleepR(Auto.AddByNear.config.g_s_time)
	else
	     Common.click(48,80)--点击取消2，返回初页		
		 Common.sleepR(Auto.AddByNear.config.g_s_time)
	end	
	 if(i%7==0) then
	Common.slideUp(Auto.AddByNear.config.page_h)
	Common.sleepR(Auto.AddByNear.config.g_s_time)	
    end		
end	
Auto.AddByNear.getPos=function(s)

	local i=string.find(s,',')
	local long,lat=string.sub(s,1,i-1),string.sub(s,i+1,string.len(s))
	return long,lat

end
Auto.AddByNear.start=function()
 --Auto.AddByNear.config.imagepath="/var/touchelf/files/images/"--图片基础路径
 
 Auto.AddByNear.config.say={}
 Auto.AddByNear.config.g_s_time=1000 --一般操作延迟时间
 Auto.AddByNear.config.num=5--打招呼次数
 Auto.AddByNear.config.page_h=932--附近的7人列表单条高度
Auto.AddByNear.config.row_h=Auto.AddByNear.config.page_h/7 
Auto.AddByNear.config.posUrl="http://zs.159.net/Getpos.html"
local ui="{\"style\":\"default\",\"config\":\"save_001.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"全球定位打招呼\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->微信，如无特殊说明以后的功能都是在此界面\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"打招呼次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"打招呼次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"打招呼文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气凉了，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"输入地点坐标\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"输入地点坐标\",\"text\":\"0\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"粘贴之前复制的坐标到此输入框，输入0使用真实地址\",\"size\":15,\"align\":\"center\",\"color\":\"255,0,0\"}]}"
local ui2="{\"style\":\"default\",\"config\":\"save_052.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"全球定位打招呼\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：如果要伪装定位，请先选中打开地图选点功能，选择相应的位置坐标\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"RadioGroup\",\"list\":\"打开地图选点,开始打招呼\"}]}"
local ret2,cnum=showUI(ui2)
    if ret2==1 then
		cnum=cnum+0
         if cnum==0 then
			openURL(Auto.AddByNear.config.posUrl)--获取位置网址
			lua_exit()
			else
			local ret,saynum,txt1,txt2,txt3,pos=showUI(ui)
if ret==1 then --确认开始
	
	
if pos~='0' then
	local long,lat=Auto.AddByNear.getPos(pos)
    fakeGPS(lat+0,long+0)--为0时不伪装
else
     fakeGPS(0,0)--取消伪装
end
Common.sleepR(2000)
Common.click(404,1072)
Common.sleepR(Auto.AddByNear.config.g_s_time)
local x,y=findMultiColorInRegionFuzzy(0xFFFFFF,"23|-28|0x10AEFF,11|-11|0x10AEFF,70|-15|0x000000",100,11,251,622,925)--找附近的人
Common.click(x,y)--点击附近的人
Common.sleepR(5000)
Common.sleepR(Auto.AddByNear.config.g_s_time)
local look_x,look_y=findColorInRegionFuzzy(0x06BF04,100, 4, 600, 640, 1070)	--如果有人打招呼
   if look_x ~= -1 and look_y ~= -1 then    
	     Common.click(look_x+100,look_y+15)
		 Common.sleepR(5000)
   end	
Common.slideUp(110)--“朋友不够多”滑出
Common.sleepR(Auto.AddByNear.config.g_s_time)
Auto.AddByNear.config.num=saynum
Auto.AddByNear.config.say={txt1,txt2,txt3}

for i=1,Auto.AddByNear.config.num do
	Auto.AddByNear.sayHello(i)
end	

end
		end
	end
end

---*****002*****
---*****通过通讯录、微信号、qq号搜索添加*****

Auto.AddBySearch.addToContact=function(x,y)
    Common.click(x+100,y+15)--点击添加到通讯录
	Common.sleepR(Auto.AddBySearch.config.g_s_time)	
	Common.click(581,251)--点击清除文本信息
	Common.sleepR(Auto.AddBySearch.config.g_s_time)		
	inputText(Auto.AddBySearch.config.say[math.random(1,3)])
	Common.sleepR(Auto.AddBySearch.config.g_s_time)	
	Common.click(586,81)--点击发送
	Common.sleepR(Auto.AddBySearch.config.g_s_time)	--延迟要长，出错率较高
	Common.sleepR(Auto.AddBySearch.config.g_s_time)
	Common.sleepR(Auto.AddBySearch.config.g_s_time)		
	Common.click(94,84)	
	Common.sleepR(Auto.AddBySearch.config.g_s_time)		
	Common.click(587,83)--点击取消1	
	Common.sleepR(Auto.AddBySearch.config.g_s_time)	
	Common.click(48,80)--点击取消2，返回初页	
	Common.sleepR(Auto.AddBySearch.config.g_s_time)				
end
Auto.AddBySearch.readFile=function(file)
    assert(file,"file open failed")
    local fileTab = {}
    local line = file:read()
    while line do
        table.insert(fileTab,line)
        line = file:read()
    end
    return fileTab
end
Auto.AddBySearch.writeFile=function(file,fileTab)
assert(file,"file open failed")
    for i,line in ipairs(fileTab) do
        file:write(line)
        file:write("\n")
    end
end
Auto.AddBySearch.readOneRec=function()
  local fileRead = io.open(Auto.AddBySearch.config.filePath)
    if fileRead then
        local tab = Auto.AddBySearch.readFile(fileRead)
        fileRead:close()
        diyihang=tab[1]                
        table.remove(tab,1)
        local fileWrite = io.open(Auto.AddBySearch.config.filePath,"w")
        if fileWrite then
            Auto.AddBySearch.writeFile(fileWrite,tab)
            fileWrite:close()
        end
    end
    return diyihang
end
Auto.AddBySearch.startAdd=function()
	 Common.sleepR(Auto.AddBySearch.config.g_s_time)	
	 Common.click(584,82)--点击+
     Common.sleepR(Auto.AddBySearch.config.g_s_time)	
     Common.click(506,276)--点击添加
     Common.sleepR(Auto.AddBySearch.config.g_s_time)	
     Common.click(180,204)--点击输入
     Common.sleepR(Auto.AddBySearch.config.g_s_time) 
     local curNum=Auto.AddBySearch.readOneRec()	 
     inputText(curNum)	
     Common.sleepR(Auto.AddBySearch.config.g_s_time)
     Common.click(341,1088)
     Common.sleepR(Auto.AddBySearch.config.g_s_time)	 
     Common.click(541,1081)--点击搜索
     Common.sleepR(2000) --搜索延迟要长
      --开始找结果
     x, y =findMultiColorInRegionFuzzy(0x06bf04,"-198|-9|0xfafefa,-12|-15|0xffffff,-107|11|0xffffff",90,4,307,640,1070)
	
     
	if x ~= -1 and y ~= -1 then    
	     Common.click(x+15,y+15)
		 Common.sleepR(2000)	 		
	     Auto.AddBySearch.addToContact(x,y)
	else 
	local c_x,c_y=findColorInRegionFuzzy(0x06BF04,100, 4, 307, 640, 1070)	--是否是发消息按钮（已添加好友）
	    if c_x ~= -1 and c_y ~= -1 then  
          Common.click(48,80)--点击取消2，返回初页	
		Common.sleepR(Auto.AddBySearch.config.g_s_time)		
		Common.click(587,83)--点击取消1	
		Common.sleepR(Auto.AddBySearch.config.g_s_time)		
		Common.click(48,80)--点击取消2，返回初页	
        else
		Common.click(587,83)--点击取消1	
		Common.sleepR(Auto.AddBySearch.config.g_s_time)		
		Common.click(48,80)--点击取消2，返回初页		
				
		end
		
		
		
	   				
	end		
end
Auto.AddBySearch.start=function()

Auto.AddBySearch.config.filePath="/User/Media/TouchSprite/res/sjh.txt"
Auto.AddBySearch.config.say={}
Auto.AddBySearch.config.g_s_time=1000 --一般操作延迟时间
Auto.AddBySearch.config.num=3--要添加的手机号码次数
local ui="{\"style\":\"default\",\"config\":\"save_002.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通过搜索添加好友\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->微信，在文件系统（越狱）/User/Media/TouchSprite/res/下新建sjh.txt文件，并在文件中写入你要搜的手机号、qq号、或微信号一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"搜索次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"搜索次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"打招呼文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num,txt1,txt2,txt3=showUI(ui)
if ret==1 then
Auto.AddBySearch.config.say={txt1,txt2,txt3}
Auto.AddBySearch.config.num=num
for i=1,Auto.AddBySearch.config.num do

	Auto.AddBySearch.startAdd()
end
end

end

---*****003*****
---*****疯狂扔漂流瓶*****
Auto.ThrowBox.throw=function()
Common.sleepR(Auto.ThrowBox.config.g_s_time)
Common.click(124,1058)--点击瓶子
Common.sleepR(2000)
Common.click(49,1086)--点击键盘
Common.sleepR(2000)
inputText(Auto.ThrowBox.config.say[math.random(1,3)])
Common.sleepR(700)
Common.click(363,587)
Common.sleepR(7000)--等待
end
Auto.ThrowBox.start=function()
 Auto.ThrowBox.config.say={}
 Auto.ThrowBox.config.g_s_time=1000 --一般操作延迟时间
 Auto.ThrowBox.config.num=5--打招呼次数
 local ui="{\"style\":\"default\",\"config\":\"save_003.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动扔漂流瓶\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->漂流瓶\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"扔瓶次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"扔瓶次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"漂流瓶文本(最少输入5个字)\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
  local ret,num,txt1,txt2,txt3=showUI(ui)
Auto.ThrowBox.config.num=num
 Auto.ThrowBox.config.say={txt1,txt2,txt3}
if ret==1 then
 for i=1,Auto.ThrowBox.config.num do 
 Auto.ThrowBox.throw()
 end
end

end

Auto.ThrowBox.startS=function()
 Auto.ThrowBox.config.say={}
 Auto.ThrowBox.config.g_s_time=1000 --一般操作延迟时间
 Auto.ThrowBox.config.num=5--打招呼次数
 local ui="{\"style\":\"default\",\"config\":\"save_003.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动扔漂流瓶\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->漂流瓶\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"扔瓶次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"扔瓶次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"漂流瓶文本(最少输入5个字)\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
  local ret,num,txt1,txt2,txt3=Auto.ThrowBox.config.ret,Auto.ThrowBox.config.num,Auto.ThrowBox.config.txt1,Auto.ThrowBox.config.txt2,Auto.ThrowBox.config.txt3
Auto.ThrowBox.config.num=num
 Auto.ThrowBox.config.say={txt1,txt2,txt3}
if ret==1 then
 for i=1,Auto.ThrowBox.config.num do 
 Auto.ThrowBox.throw()
 end
Auto.MultiLog.logout()
end

end
---*****037*****
---*****疯狂扔漂流瓶(自动换号)*****
Auto.ThrowBox.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动扔漂流瓶(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_003.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动扔漂流瓶\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->漂流瓶\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"扔瓶次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"扔瓶次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"漂流瓶文本(最少输入5个字)\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.ThrowBox.config.ret=s_ret
	Auto.ThrowBox.config.num=s_num
	Auto.ThrowBox.config.txt1=s_txt1
	Auto.ThrowBox.config.txt2=s_txt2
	Auto.ThrowBox.config.txt3=s_txt3--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.ThrowBox.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(400,1060)--点击发现
		Common.sleepR(1000)
		local x,y=findMultiColorInRegionFuzzy(0xFFFFFF,"23|-28|0x10AEFF,2|5|0x10AEFF,70|-15|0x000000",100,11,251,622,925)--找漂流瓶
		Common.click(x,y)
	    Common.sleepR(1000)
	    Auto.ThrowBox.startS()
        end
	end
	
end
end
---*****015*****
---*****自动捡漂流瓶*****
Auto.PickBox.pick=function()
Common.sleepR(Auto.PickBox.config.g_s_time)
Common.click(325,1051)--点击瓶子
Common.sleepR(5000)
local x,y=findColorInRegionFuzzy(0xFFFFFF,100,410,721,535,757)--找白色文字
if x~=-1 and y~=-1 then
Common.click(345,611)--点击键盘
Common.sleepR(2000)
Common.click(459,1040)--点击回应
Common.sleepR(1000)
Common.click(270,1087)--点击输入
inputText(Auto.PickBox.config.say[math.random(1,3)])
Common.sleepR(700)
     Common.click(341,1088)
     Common.sleepR(Auto.PickBox.config.g_s_time)	 
     Common.click(541,1081)--点击发送
     Common.sleepR(1000) --搜索延迟要长
Common.click(48,80)--返回
Common.sleepR(700)--等待
else
Common.click(319,804)
Common.sleepR(700)
end

end
Auto.PickBox.start=function()
 Auto.PickBox.config.say={}
 Auto.PickBox.config.g_s_time=1000 --一般操作延迟时间
 Auto.PickBox.config.num=5--打招呼次数
 local ui="{\"style\":\"default\",\"config\":\"save_015.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动捡漂流瓶\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->漂流瓶\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"捡瓶次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"捡瓶次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"漂流瓶文本(最少输入5个字)\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
  local ret,num,txt1,txt2,txt3=showUI(ui)
Auto.PickBox.config.num=num
 Auto.PickBox.config.say={txt1,txt2,txt3}
if ret==1 then
 for i=1,Auto.PickBox.config.num do 
 Auto.PickBox.pick()
 end
end

end
Auto.PickBox.startS=function()
 Auto.PickBox.config.say={}
 Auto.PickBox.config.g_s_time=1000 --一般操作延迟时间
 Auto.PickBox.config.num=5--打招呼次数
 local ui="{\"style\":\"default\",\"config\":\"save_015.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动捡漂流瓶\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->漂流瓶\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"捡瓶次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"捡瓶次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"漂流瓶文本(最少输入5个字)\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
  local ret,num,txt1,txt2,txt3=Auto.PickBox.config.ret,Auto.PickBox.config.num,Auto.PickBox.config.txt1,Auto.PickBox.config.txt2,Auto.PickBox.config.txt3
Auto.PickBox.config.num=num
 Auto.PickBox.config.say={txt1,txt2,txt3}
if ret==1 then
 for i=1,Auto.PickBox.config.num do 
 Auto.PickBox.pick()
 end
Auto.MultiLog.logout()
end

end
---*****038*****
---*****自动捡漂流瓶(自动换号)*****
Auto.PickBox.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动捡漂流瓶(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_015.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动捡漂流瓶\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->漂流瓶\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"捡瓶次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"捡瓶次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"漂流瓶文本(最少输入5个字)\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.PickBox.config.ret=s_ret
	Auto.PickBox.config.num=s_num
	Auto.PickBox.config.txt1=s_txt1
	Auto.PickBox.config.txt2=s_txt2
	Auto.PickBox.config.txt3=s_txt3--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.PickBox.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(400,1060)--点击发现
		Common.sleepR(1000)
		local x,y=findMultiColorInRegionFuzzy(0xFFFFFF,"23|-28|0x10AEFF,2|5|0x10AEFF,70|-15|0x000000",100,11,251,622,925)--找漂流瓶
		Common.click(x,y)
	    Common.sleepR(1000)
	    Auto.PickBox.startS()
        end
	end
	
end
end
---*****004*****
---*****通讯录自动接受好友请求*****

Auto.AutoRecieve.recieve=function()
local cur_x,cur_y=findColorInRegionFuzzy(0x06C004,100,500,180,640,1010)--全屏找点赞按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(2000)		
		Common.click(48,80)--点击，返回初页	
		Common.sleepR(2000)	
		---上翻
		 Common.slideUp(cur_y+70-128)
		 Common.sleepR(Auto.AutoRecieve.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.AutoRecieve.config.g_s_time)
	end	
end
Auto.AutoRecieve.start=function()
Auto.AutoRecieve.config.g_s_time=1000 --一般操作延迟时间
Auto.AutoRecieve.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_004.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录自动接受好友请求\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要接受多少个请求\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"请求次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)
if ret==1 then
Auto.AutoRecieve.config.num=num
for i=1,Auto.AutoRecieve.config.num do

	Auto.AutoRecieve.recieve()
end
end

end
Auto.AutoRecieve.startS=function()
Auto.AutoRecieve.config.g_s_time=1000 --一般操作延迟时间
Auto.AutoRecieve.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_004.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录自动接受好友请求\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要接受多少个请求\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"请求次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=Auto.AutoRecieve.config.ret,Auto.AutoRecieve.config.num
if ret==1 then
Auto.AutoRecieve.config.num=num
for i=1,Auto.AutoRecieve.config.num do

	Auto.AutoRecieve.recieve()
end
Auto.MultiLog.logout()
end

end
---*****039*****
---*****通讯录自动接受好友请求(自动换号)*****
Auto.AutoRecieve.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录自动接受好友请求(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_004.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录自动接受好友请求\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要接受多少个请求\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"请求次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.AutoRecieve.config.ret=s_ret
	Auto.AutoRecieve.config.num=s_num
	if Auto.AutoRecieve.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(239,1073)--点击通讯录
		Common.sleepR(1000)
		Common.click(291,319)--点击新的朋友
		Common.sleepR(1000)
	    Auto.AutoRecieve.startS()
        end
	end
	
end
end
---*****022*****
---*****通讯录开通微信的自动添加*****

Auto.AddByContactHasWX.recieve=function()
local cur_x,cur_y=findColorInRegionFuzzy(0x454545,100,500,180,640,1010)--全屏找点赞按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(2000)
		Common.click(581,251)--点击清除文本信息
	Common.sleepR(Auto.AddByContactHasWX.config.g_s_time)		
	inputText(Auto.AddByContactHasWX.config.say[math.random(1,3)])
	Common.sleepR(Auto.AddByContactHasWX.config.g_s_time)	
	Common.click(586,81)--点击发送
	Common.sleepR(2000)	--延迟要长，出错率较高
	--删除
	  --[[  touchDown(1,cur_x,cur_y)
		mSleep(1500)
		touchMove(1,cur_x-240,cur_y)
		mSleep(2000)
		touchUp(1,cur_x-250,cur_y)
		Common.sleepR(700)
		Common.click(cur_x,cur_y)--]]
		--Common.sleepR(2000)
		---上翻
		 Common.slideUp(cur_y+70-128)
		 Common.sleepR(Auto.AddByContactHasWX.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.AddByContactHasWX.config.g_s_time)
	end	
end
Auto.AddByContactHasWX.start=function()
Auto.AddByContactHasWX.config.g_s_time=1000 --一般操作延迟时间
Auto.AddByContactHasWX.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_022.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录开通微信的自动添加\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友,使用此功能必须绑定手机号并开启微信通信录，否则无法使用,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"添加个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num,txt_1,txt_2,txt_3=showUI(ui)
if ret==1 then
Auto.AddByContactHasWX.config.num=num
Auto.AddByContactHasWX.config.say={txt_1,txt_2,txt_3}
for i=1,Auto.AddByContactHasWX.config.num do

	Auto.AddByContactHasWX.recieve()
end
end

end

Auto.AddByContactHasWX.startS=function()
Auto.AddByContactHasWX.config.g_s_time=1000 --一般操作延迟时间
Auto.AddByContactHasWX.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_022.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录开通微信的自动添加\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友,使用此功能必须绑定手机号并开启微信通信录，否则无法使用,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"添加个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num,txt_1,txt_2,txt_3=Auto.AddByContactHasWX.config.ret,Auto.AddByContactHasWX.config.num,Auto.AddByContactHasWX.config.txt1,Auto.AddByContactHasWX.config.txt2,Auto.AddByContactHasWX.config.txt3
if ret==1 then
Auto.AddByContactHasWX.config.num=num
Auto.AddByContactHasWX.config.say={txt_1,txt_2,txt_3}
for i=1,Auto.AddByContactHasWX.config.num do

	Auto.AddByContactHasWX.recieve()
end
Auto.MultiLog.logout()
end

end

---*****040*****
---*****通讯录开通微信的自动添加(自动换号)*****
Auto.AddByContactHasWX.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录开通微信的自动添加(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_022.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录开通微信的自动添加\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友,使用此功能必须绑定手机号并开启微信通信录，否则无法使用,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"添加个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.AddByContactHasWX.config.ret=s_ret
	Auto.AddByContactHasWX.config.num=s_num
	Auto.AddByContactHasWX.config.txt1=s_txt1
	Auto.AddByContactHasWX.config.txt2=s_txt2
	Auto.AddByContactHasWX.config.txt3=s_txt3
	if Auto.AddByContactHasWX.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(239,1073)--点击通讯录
		Common.sleepR(1000)
		Common.click(291,319)--点击新的朋友
		Common.sleepR(1000)
	--[[	Common.click(157,297)--点击新的朋友
		Common.sleepR(1000)--]]
	    Auto.AddByContactHasWX.startS()
        end
	end
	
end
end

--*****051*****
--*****通讯录添加手机联系人*****
Auto.AddByContactList.add=function()
local cur_x,cur_y=findColorInRegionFuzzy(0x06c004,100,500,180,640,1010)--全屏找添加按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(2000)
		Common.click(581,251)--点击清除文本信息
	Common.sleepR(Auto.AddByContactList.config.g_s_time)		
	inputText(Auto.AddByContactList.config.say[math.random(1,3)])
	Common.sleepR(Auto.AddByContactList.config.g_s_time)	
	Common.click(586,81)--点击发送
	Common.sleepR(2000)	--延迟要长，出错率较高
		 Common.slideUp(cur_y+70-128)
		 Common.sleepR(Auto.AddByContactList.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.AddByContactList.config.g_s_time)
	end	
end
Auto.AddByContactList.start=function()
Auto.AddByContactList.config.g_s_time=1000 --一般操作延迟时间
Auto.AddByContactList.config.num=3--要添加的次数
local ui="{\"style\":\"default\",\"config\":\"save_051.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录添加手机联系人\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友-->添加手机联系人,使用此功能必须绑定手机号并开启微信通信录，否则无法使用,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"添加个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num,txt_1,txt_2,txt_3=showUI(ui)
if ret==1 then
Common.start()
Auto.AddByContactList.config.num=num
Auto.AddByContactList.config.say={txt_1,txt_2,txt_3}
for i=1,Auto.AddByContactList.config.num do
	Auto.AddByContactList.add()
end
Common.over()
end

end
Auto.AddByContactList.startS=function()
Auto.AddByContactList.config.g_s_time=1000 --一般操作延迟时间
Auto.AddByContactList.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_052.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录添加手机联系人\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友-->添加手机联系人,使用此功能必须绑定手机号并开启微信通信录，否则无法使用,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"添加个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num,txt_1,txt_2,txt_3=Auto.AddByContactList.config.ret,Auto.AddByContactList.config.num,Auto.AddByContactList.config.txt1,Auto.AddByContactList.config.txt2,Auto.AddByContactList.config.txt3
if ret==1 then
Auto.AddByContactList.config.num=num
Auto.AddByContactList.config.say={txt_1,txt_2,txt_3}
for i=1,Auto.AddByContactList.config.num do

	Auto.AddByContactList.add()
end
Auto.MultiLog.logout()
end

end

---*****052*****
---*****通讯录添加手机联系人(自动换号)*****
Auto.AddByContactList.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_052.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录添加手机联系人(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_052.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录添加手机联系人\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友,使用此功能必须绑定手机号并开启微信通信录，否则无法使用,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"添加个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.AddByContactList.config.ret=s_ret
	Auto.AddByContactList.config.num=s_num
	Auto.AddByContactList.config.txt1=s_txt1
	Auto.AddByContactList.config.txt2=s_txt2
	Auto.AddByContactList.config.txt3=s_txt3
	if Auto.AddByContactList.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(239,1073)--点击通讯录
		Common.sleepR(1000)
		Common.click(291,319)--点击新的朋友
		Common.sleepR(1000)
		Common.click(152, 294)--点击添加手机联系人
		Common.sleepR(1000)
	    Auto.AddByContactList.startS()
        end
	end
	
end
end


---*****023*****
---*****QQ开通微信的自动添加*****

Auto.AddByQQHasWX.recieve=function()
local cur_x,cur_y=findColorInRegionFuzzy(0x06C004,100,500,180,640,1010)--全屏找添加按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(2000)
		Common.click(581,251)--点击清除文本信息
	Common.sleepR(Auto.AddByQQHasWX.config.g_s_time)		
	inputText(Auto.AddByQQHasWX.config.say[math.random(1,3)])
	Common.sleepR(Auto.AddByQQHasWX.config.g_s_time)	
	Common.click(586,81)--点击发送
	Common.sleepR(2000)	--延迟要长，出错率较高
		---上翻
		 Common.slideUp(cur_y+70-128)
		 Common.sleepR(Auto.AddByQQHasWX.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.AddByQQHasWX.config.g_s_time)
	end	
end
Auto.AddByQQHasWX.start=function()
Auto.AddByQQHasWX.config.g_s_time=1000 --一般操作延迟时间
Auto.AddByQQHasWX.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_023.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"QQ开通微信的自动添加\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友-->添加QQ好友-->相应分组,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"该分组下添加好友个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num,txt_1,txt_2,txt_3=showUI(ui)
if ret==1 then
Auto.AddByQQHasWX.config.num=num
Auto.AddByQQHasWX.config.say={txt_1,txt_2,txt_3}
for k=1,Auto.AddByQQHasWX.config.num do 
Auto.AddByQQHasWX.recieve()
end



end

end
Auto.AddByQQHasWX.startS=function()
Auto.AddByQQHasWX.config.g_s_time=1000 --一般操作延迟时间
Auto.AddByQQHasWX.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_023.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"QQ开通微信的自动添加\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友-->添加QQ好友-->相应分组,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"该分组下添加好友个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num,txt_1,txt_2,txt_3=Auto.AddByQQHasWX.config.ret,Auto.AddByQQHasWX.config.num,Auto.AddByQQHasWX.config.txt1,Auto.AddByQQHasWX.config.txt2,Auto.AddByQQHasWX.config.txt3
if ret==1 then
Auto.AddByQQHasWX.config.num=num
Auto.AddByQQHasWX.config.say={txt_1,txt_2,txt_3}
for k=1,Auto.AddByQQHasWX.config.num do 
Auto.AddByQQHasWX.recieve()
end
Auto.MultiLog.logout()
end

end
---*****041*****
---*****QQ开通微信的自动添加(自动换号)*****
Auto.AddByQQHasWX.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录自动接受好友请求(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_023.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"QQ开通微信的自动添加\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->新的朋友-->添加QQ好友-->相应分组,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"该分组下添加好友个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"添加个数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.AddByQQHasWX.config.ret=s_ret
	Auto.AddByQQHasWX.config.num=s_num
	Auto.AddByQQHasWX.config.txt1=s_txt1
	Auto.AddByQQHasWX.config.txt2=s_txt2
	Auto.AddByQQHasWX.config.txt3=s_txt3
	if Auto.AddByQQHasWX.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(239,1073)--点击通讯录
		Common.sleepR(1000)
		Common.click(291,319)--点击新的朋友
		Common.sleepR(1000)
		Common.click(482,289)--点击QQ好友
		Common.sleepR(1000)
		Common.click(215,175)--点击分组
		Common.sleepR(1000)
	    Auto.AddByQQHasWX.startS()
        end
	end
	
end
end
---*****005*****
---*****自动接收附近的人好友请求*****
Auto.AutoRecieveNearBy.recieve=function(i)
 local cur_x,cur_y=findColorInRegionFuzzy(0x06C004,100,500,130,640,1010)--全屏找点赞按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(2000)		
		Common.click(48,80)--点击，返回初页		
		Common.sleepR(2000)
		---上翻
		 Common.slideUp(cur_y+70-128)
		 Common.sleepR(Auto.AutoRecieveNearBy.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.AutoRecieveNearBy.config.g_s_time)
	end	
end
Auto.AutoRecieveNearBy.start=function()
Auto.AutoRecieveNearBy.config.g_s_time=1000 --一般操作延迟时间
 Auto.AutoRecieveNearBy.config.page_h=858--附近的7人列表单条高度
Auto.AutoRecieveNearBy.config.row_h=Auto.AutoRecieveNearBy.config.page_h/7 
Auto.AutoRecieveNearBy.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_005.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动接受好友请求\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->发现-->附近的人(右上角)-->附近打招呼的人\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要接受多少个请求\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"请求次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)
Common.sleepR(2000)
if ret==1 then
Auto.AutoRecieveNearBy.config.num=num
for i=1,Auto.AutoRecieveNearBy.config.num do
	Auto.AutoRecieveNearBy.recieve(i)
end
end

end
Auto.AutoRecieveNearBy.startS=function()
Auto.AutoRecieveNearBy.config.g_s_time=1000 --一般操作延迟时间
 Auto.AutoRecieveNearBy.config.page_h=858--附近的7人列表单条高度
Auto.AutoRecieveNearBy.config.row_h=Auto.AutoRecieveNearBy.config.page_h/7 
Auto.AutoRecieveNearBy.config.num=3--要接受的次数
local ui="{\"style\":\"default\",\"config\":\"save_005.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动接受好友请求\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->发现-->附近的人(右上角)-->附近打招呼的人\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要接受多少个请求\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"请求次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=Auto.AutoRecieveNearBy.config.ret,Auto.AutoRecieveNearBy.config.num
Common.sleepR(2000)
if ret==1 then
Auto.AutoRecieveNearBy.config.num=num
for i=1,Auto.AutoRecieveNearBy.config.num do
	Auto.AutoRecieveNearBy.recieve(i)
end
Auto.MultiLog.logout()
end

end

---*****042*****
---*****自动接收附近的人好友请求(自动换号)*****
Auto.AutoRecieveNearBy.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动接收附近的人好友请求(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_005.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动接收附近的人好友请求\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->发现-->附近的人(右上角)-->附近打招呼的人\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要接受多少个请求\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"请求次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.AutoRecieveNearBy.config.ret=s_ret
	Auto.AutoRecieveNearBy.config.num=s_num
	if Auto.AutoRecieveNearBy.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(404,1072)
         Common.sleepR(1000)
         local x,y=findMultiColorInRegionFuzzy(0xFFFFFF,"23|-28|0x10AEFF,11|-11|0x10AEFF,70|-15|0x000000",100,11,251,622,925)--找附近的人
        Common.click(x,y)--点击附近的人
         Common.sleepR(5000)
		Common.click(587,78)
		Common.sleepR(800)
		Common.click(308,870)
		Common.sleepR(1000)
	    Auto.AutoRecieveNearBy.startS()
        end
	end
	
end
end
---*****006*****
---*****单群自动加群好友*****
Auto.AddByGroup.add=function(i)
 local n,r
     if(i%4==0) then
     n=3
     else
     n=(i%4)-1	 
	 end
	
	count=i%16
    if count==0 then
    r=3
    else
    r=math.ceil(count/4)-1
    end
	
	---翻页后重新计算r
	Common.clickS(92+(n*Auto.AddByGroup.config.row_w),223+(r*Auto.AddByGroup.config.row_h))
	Common.sleepR(Auto.AddByGroup.config.g_s_time)	
   --local x, y = findColorInRegionFuzzy('addBtn.bmp',80, 4, 307, 640, 1070)

local x, y=findMultiColorInRegionFuzzy(0x06bf04,"-198|-9|0xfafefa,-12|-15|0xffffff,-107|11|0xffffff",100,4,307,640,1070)
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+15,y+15)
		 Common.sleepR(2400)
		local c_x,c_y=findColorInRegionFuzzy(0x05BA03,90, 557,61 , 625,98)--找“发送”按钮，判断需要还是不需要验证
		if c_x~=-1 and c_y~=-1 then --如果需要验证
			 Common.click(581,251)--点击清除文本信息
	     Common.sleepR(Auto.AddByGroup.config.g_s_time)		
	     inputText(Auto.AddByGroup.config.say[math.random(1,3)])
	    Common.sleepR(Auto.AddByGroup.config.g_s_time)	
	    Common.click(586,81)--点击发送
	    Common.sleepR(Auto.AddByGroup.config.g_s_time)	--延迟要长，出错率较高
	    Common.sleepR(Auto.AddByGroup.config.g_s_time)
	    Common.sleepR(Auto.AddByGroup.config.g_s_time)			
	    Common.click(48,84)
	    Common.sleepR(Auto.AddByGroup.config.g_s_time)
		else
		 Common.click(48,84)
	    Common.sleepR(Auto.AddByGroup.config.g_s_time)
		end
		
	else
	     Common.click(48,80)--点击取消2，返回初页		
		 Common.sleepR(Auto.AddByGroup.config.g_s_time)
	end	
	 if(i%16==0) then
	Common.slideUp(Auto.AddByGroup.config.page_h)
	Common.sleepR(Auto.AddByGroup.config.g_s_time)	
    end		
end
Auto.AddByGroup.start=function()
Auto.AddByGroup.config.g_s_time=1000 --一般操作延迟时间
 Auto.AddByGroup.config.page_h=787--群成员4行高度
 Auto.AddByGroup.config.row_w=640/4--群成员一行宽度
Auto.AddByGroup.config.row_h=Auto.AddByGroup.config.page_h/4
Auto.AddByGroup.config.num=3--要接受的次数

 local ui="{\"style\":\"default\",\"config\":\"save_006.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动加群好友\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->你要加的群-->群(右上角)-->群成员页面\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要加群成员数（在群成员页面查看）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"成员数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
  local ret,num,txt1,txt2,txt3=showUI(ui)
Common.sleepR(2000)

if ret==1 then
Auto.AddByGroup.config.num=num
 Auto.AddByGroup.config.say={txt1,txt2,txt3}
for i=1,Auto.AddByGroup.config.num do
	Auto.AddByGroup.add(i)
end

end

end

---*****024*****
---*****多群自动加群好友*****
Auto.AddByMultiGroup.add=function(i)
 local n,r
     if(i%4==0) then
     n=3
     else
     n=(i%4)-1	 
	 end
	
	count=i%16
    if count==0 then
    r=3
    else
    r=math.ceil(count/4)-1
    end
	
	---翻页后重新计算r
	Common.clickS(92+(n*Auto.AddByMultiGroup.config.row_w),223+(r*Auto.AddByMultiGroup.config.row_h))
	Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)	
   --local x, y = findColorInRegionFuzzy('addBtn.bmp',80, 4, 307, 640, 1070)

local x, y=findMultiColorInRegionFuzzy(0x06bf04,"-198|-9|0xfafefa,-12|-15|0xffffff,-107|11|0xffffff",100,4,307,640,1070)
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+15,y+15)
		 Common.sleepR(2400)
		local c_x,c_y=findColorInRegionFuzzy(0x05BA03,90, 557,61,625,98)--找“发送”按钮，判断需要还是不需要验证
		if c_x~=-1 and c_y~=-1 then --如果需要验证
				 Common.click(581,251)--点击清除文本信息
	     Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)		
	     inputText(Auto.AddByMultiGroup.config.say[math.random(1,3)])
	    Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)	
	    Common.click(586,81)--点击发送
	    Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)	--延迟要长，出错率较高
	    Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)
	    Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)			
	    Common.click(48,84)
	    Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)
		else
		 Common.click(48,84)
	    Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)
		end
	
	else
	     Common.click(48,80)--点击取消2，返回初页		
		 Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)
	end	
	 if(i%16==0) then
	Common.slideUp(Auto.AddByMultiGroup.config.page_h)
	Common.sleepR(Auto.AddByMultiGroup.config.g_s_time)	
    end		
end
Auto.AddByMultiGroup.start=function()
Auto.AddByMultiGroup.config.g_s_time=1000 --一般操作延迟时间
 Auto.AddByMultiGroup.config.page_h=787--群成员4行高度
 Auto.AddByMultiGroup.config.row_w=640/4--群成员一行宽度
Auto.AddByMultiGroup.config.row_h=Auto.AddByMultiGroup.config.page_h/4
Auto.AddByMultiGroup.config.list_h=110
Auto.AddByMultiGroup.config.num=3--要接受的次数

local ui="{\"style\":\"default\",\"config\":\"save_024.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"多群自动加群好友\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信-->通讯录-->群聊,使用此功能必须将你的相应群保存到通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"要加的群个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1个,2个,3个\",\"select\":\"1\"},{\"type\":\"Label\",\"text\":\"每个群要加的好友数（在群成员页面查看）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"成员数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"验证文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"你好啊，交个朋友\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"今天吃的什么\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
  local ret,num_qun,num,txt1,txt2,txt3=showUI(ui)
Common.sleepR(2000)

if ret==1 then
Auto.AddByMultiGroup.config.num=num
 Auto.AddByMultiGroup.config.say={txt1,txt2,txt3}

num_qun=num_qun+0
for k=1,num_qun+1 do 
    Common.click(233,264+(k-1)*Auto.AddByMultiGroup.config.list_h) 
	Common.sleepR(2000)
	Common.click(584,85)
	Common.sleepR(1000)
         for i=1,Auto.AddByMultiGroup.config.num do
	     Auto.AddByMultiGroup.add(i)
         end
		Common.click(48,80)--返回
	     Common.sleepR(1000)
	     Common.click(48,80)--返回 
		 Common.sleepR(1000)
	     Common.click(236,1080)
	     Common.sleepR(1000)
		 Common.click(288,428)--点击群聊
		Common.sleepR(1000)
		 
	
end


end

end

---*****007*****
---*****自动朋友圈点赞并评论*****
Auto.LikeAndComment.likeCom=function()
	
	local cur_x,cur_y=findColorInRegionFuzzy(0x97AAD0,100,570,200,640,1010)--全屏找点赞按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(500)	
		 Common.click(cur_x-300,cur_y)--点击赞
	     Common.sleepR(Auto.LikeAndComment.config.g_s_time)	
		------评论,键盘点击还是不行，只要涉及键盘输入，点击都失灵
		 Common.click(cur_x+15,cur_y+15)	
		 Common.sleepR(Auto.LikeAndComment.config.g_s_time)	
		 Common.click(cur_x-100,cur_y)--点击评论
	     Common.sleepR(Auto.LikeAndComment.config.g_s_time)	
	     inputText(Auto.LikeAndComment.config.say[math.random(1,3)])
	    Common.sleepR(Auto.LikeAndComment.config.g_s_time)	
		
		 Common.click(341,1088)
         Common.sleepR(500)	 
         Common.click(541,1081)--点击发送
	     Common.sleepR(Auto.LikeAndComment.config.g_s_time)
		---上翻
		 Common.slideUp(cur_y-128)
		 Common.sleepR(Auto.LikeAndComment.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.LikeAndComment.config.g_s_time)
	end	
	
end
Auto.LikeAndComment.start=function()
Auto.LikeAndComment.config.g_s_time=1000 --一般操作延迟时间
Auto.LikeAndComment.config.num=3--点赞评论次数

 local ui="{\"style\":\"default\",\"config\":\"save_007.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞并评论\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"点赞评论次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"评论内容\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"写的很好\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"不错，支持一下\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"支持\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=showUI(ui)
  Common.sleepR(2000)
 Common.slideUp(560)
 Common.sleepR(Auto.LikeAndComment.config.g_s_time)
if ret==1 then
Auto.LikeAndComment.config.num=num
 Auto.LikeAndComment.config.say={txt1,txt2,txt3}
for i=1,Auto.LikeAndComment.config.num do
	Auto.LikeAndComment.likeCom()
end

end
end
Auto.LikeAndComment.startS=function()
Auto.LikeAndComment.config.g_s_time=1000 --一般操作延迟时间
Auto.LikeAndComment.config.num=3--点赞评论次数

 local ui="{\"style\":\"default\",\"config\":\"save_007.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞并评论\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"点赞评论次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"评论内容\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"写的很好\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"不错，支持一下\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"支持\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=Auto.LikeAndComment.config.ret,Auto.LikeAndComment.config.num,Auto.LikeAndComment.config.txt1,Auto.LikeAndComment.config.txt2,Auto.LikeAndComment.config.txt3
  Common.sleepR(2000)
 Common.slideUp(560)
 Common.sleepR(Auto.LikeAndComment.config.g_s_time)
if ret==1 then
Auto.LikeAndComment.config.num=num
 Auto.LikeAndComment.config.say={txt1,txt2,txt3}
for i=1,Auto.LikeAndComment.config.num do
	Auto.LikeAndComment.likeCom()
end
Auto.MultiLog.logout()
end
end
---*****043*****
---*****自动朋友圈点赞并评论(自动换号)*****
Auto.LikeAndComment.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞并评论(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_007.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞并评论\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"点赞评论次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"评论内容\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"写的很好\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"不错，支持一下\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"支持\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.LikeAndComment.config.ret=s_ret
	Auto.LikeAndComment.config.num=s_num
	Auto.LikeAndComment.config.txt1=s_txt1
	Auto.LikeAndComment.config.txt2=s_txt2
	Auto.LikeAndComment.config.txt3=s_txt3
	if Auto.LikeAndComment.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(404,1072)
         Common.sleepR(1000)
        Common.click(287,204)--点击朋友圈
         Common.sleepR(5000)
	    Auto.LikeAndComment.startS()
        end
	end
	
end
end
---*****008*****
---*****自动朋友圈点赞*****
Auto.Like.like=function()
	local cur_x,cur_y=findColorInRegionFuzzy(0x97AAD0,100,570,200,640,1010)--全屏找点赞按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(500)	
		 Common.click(cur_x-300,cur_y)--点击赞
	     Common.sleepR(Auto.Like.config.g_s_time)	
		---上翻
		 Common.slideUp(cur_y-128)
		 Common.sleepR(Auto.Like.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.Like.config.g_s_time)
	end	
	
end
Auto.Like.start=function()
Auto.Like.config.g_s_time=1000 --一般操作延迟时间
Auto.Like.config.num=3--点赞评论次数

 local ui="{\"style\":\"default\",\"config\":\"save_008.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"点赞次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)
 Common.slideUp(560)
 Common.sleepR(Auto.Like.config.g_s_time)
if ret==1 then
Auto.Like.config.num=num
 Auto.Like.config.say={txt1,txt2,txt3}
for i=1,Auto.Like.config.num do
	Auto.Like.like()
end

end
end
Auto.Like.startS=function()
Auto.Like.config.g_s_time=1000 --一般操作延迟时间
Auto.Like.config.num=3--点赞评论次数

 local ui="{\"style\":\"default\",\"config\":\"save_008.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"点赞次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.Like.config.ret,Auto.Like.config.num
  Common.sleepR(2000)
 Common.slideUp(560)
 Common.sleepR(Auto.Like.config.g_s_time)
if ret==1 then
Auto.Like.config.num=num
 Auto.Like.config.say={txt1,txt2,txt3}
for i=1,Auto.Like.config.num do
	Auto.Like.like()
end
Auto.MultiLog.logout()
end
end

---*****044*****
---*****自动朋友圈点赞(自动换号)*****
Auto.Like.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_008.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动朋友圈点赞\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现 -->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"点赞次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.Like.config.ret=s_ret
	Auto.Like.config.num=s_num
	if Auto.Like.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(404,1072)
         Common.sleepR(1000)
        Common.click(287,204)--点击朋友圈
         Common.sleepR(5000)
	    Auto.Like.startS()
        end
	end
	
end
end
---*****009重复功能，不用了*****
---*****自动添加手机通讯录好友*****
Auto.AddByContact.add=function()
	local cur_x,cur_y=findColorInRegionFuzzy(0x06C004,100,500,180,640,1010)--全屏找点赞按钮
    if cur_x ~= -1 and cur_y ~= -1 then    
	     Common.click(cur_x+15,cur_y+15)
		 Common.sleepR(2000)	
		 Common.click(581,251)--点击清除文本信息
	     Common.sleepR(Auto.AddByContact.config.g_s_time)		
	     inputText(Auto.AddByContact.config.say[math.random(1,3)])
	    Common.sleepR(Auto.AddByContact.config.g_s_time)	
	    Common.click(586,81)--点击发送
	    Common.sleepR(Auto.AddByContact.config.g_s_time)	--延迟要长，出错率较高
	    Common.sleepR(Auto.AddByContact.config.g_s_time)
	    Common.sleepR(Auto.AddByContact.config.g_s_time)			
		---上翻
		 Common.slideUp(cur_y+70-128)
		 Common.sleepR(Auto.AddByContact.config.g_s_time)
	else
	   ---上翻
		 Common.slideUp(200)
		 Common.sleepR(Auto.AddByContact.config.g_s_time)
	end	
	
end
Auto.AddByContact.start=function()
Auto.AddByContact.config.g_s_time=1000 --一般操作延迟时间
Auto.AddByContact.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_009.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动添加手机通讯录好友\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信 ，必须提前绑定手机号，并导入通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"添加好友个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"找你真不容易\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=showUI(ui)
  Common.sleepR(2000)
if ret==1 then
Auto.AddByContact.config.num=num
 Auto.AddByContact.config.say={txt1,txt2,txt3}
for i=1,Auto.AddByContact.config.num do
	Auto.AddByContact.add()
end

end
end

---*****010*****
---*****通讯录群发消息*****
Auto.SentByContact.sent=function(i)
	 local n	
     if(i%5==0) then
     n=4
     else
     n=(i%5)-1	 
	 end
	Common.click(306,218+(n*Auto.SentByContact.config.row_h))
	Common.sleepR(Auto.SentByContact.config.g_s_time)	
   local x, y =findColorInRegionFuzzy(0x06BF04,100, 4, 307, 640, 1070)	
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+100,y+15)
		 Common.sleepR(2000)
		 Common.click(242,1087)
		 inputText(Auto.SentByContact.config.say[math.random(1,3)])
		 Common.sleepR(Auto.SentByContact.config.g_s_time)
         Common.click(341,1088)
        Common.sleepR(700)	 
        Common.click(541,1081)--点击发送
	    Common.sleepR(Auto.SentByContact.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
		Common.sleepR(700)	 
	    Common.click(236,1080)
	    Common.sleepR(Auto.SentByContact.config.g_s_time)
	end	
	 if(i%5==0) then
	Common.slideUp2(Auto.SentByContact.config.page_h)
	Common.sleepR(Auto.SentByContact.config.g_s_time)	
    end		
	
end
Auto.SentByContact.start=function()
Auto.SentByContact.config.page_h=535
Auto.SentByContact.config.row_h=Auto.SentByContact.config.page_h/5
Auto.SentByContact.config.g_s_time=1000 --一般操作延迟时间
Auto.SentByContact.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_010.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.SentByContact.config.num=num
 Auto.SentByContact.config.say={txt1,txt2,txt3}
for i=1,Auto.SentByContact.config.num do
	Auto.SentByContact.sent(i)
end


end

end
Auto.SentByContact.startS=function()
Auto.SentByContact.config.page_h=535
Auto.SentByContact.config.row_h=Auto.SentByContact.config.page_h/5
Auto.SentByContact.config.g_s_time=1000 --一般操作延迟时间
Auto.SentByContact.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_010.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=Auto.SentByContact.config.ret,Auto.SentByContact.config.num,Auto.SentByContact.config.txt1,Auto.SentByContact.config.txt2,Auto.SentByContact.config.txt3
 Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.SentByContact.config.num=num
 Auto.SentByContact.config.say={txt1,txt2,txt3}
for i=1,Auto.SentByContact.config.num do
	Auto.SentByContact.sent(i)
end
Auto.MultiLog.logout()--执行完退出

end

end
---*****028*****
---*****通讯录群发消息(自动换号)*****
Auto.SentByContact.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发消息(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_010.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.SentByContact.config.ret=s_ret
	Auto.SentByContact.config.num=s_num
	Auto.SentByContact.config.txt1=s_txt1
	Auto.SentByContact.config.txt2=s_txt2
	Auto.SentByContact.config.txt3=s_txt3--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentByContact.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)
	    Common.sleepR(1000)
	    Auto.SentByContact.startS()
        end
	end
	
end
end
---*****013*****
---*****通讯录群发收藏内容*****
Auto.SentFavByContact.sent=function(i)
	 local n	
     if(i%5==0) then
     n=4
     else
     n=(i%5)-1	 
	 end
	Common.click(306,218+(n*Auto.SentFavByContact.config.row_h))
	Common.sleepR(Auto.SentFavByContact.config.g_s_time)	
   local x, y =findColorInRegionFuzzy(0x06BF04,100, 4, 307, 640, 1070)	
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+100,y+15)
		 Common.sleepR(2000)
		 Common.click(604,1086)
		 Common.sleepR(1000)
		
		 --Common.click(396,988)
		local d_x,d_y=Auto.findFavOrCard("fav")--找收藏
		if d_x~=-1 and d_y~=-1 then
			Common.click(d_x,d_y)--点击收藏
			else
			dialog("没找到收藏按钮，请重试",3)
			Common.sleepR(3000)
			lua_exit()
		end
		 Common.sleepR(2000)
	     Common.click(365,249)
		 Common.sleepR(Auto.SentFavByContact.config.g_s_time)
		local x_1,y_1=findMultiColorInRegionFuzzy(0xF9F7FA,"-14|2|0x09BB07,27|-21|0x09BB07,20|6|0x09BB07",100,341,586,577,837)--找发送按钮 
		 Common.click(x_1+10,y_1+15)
        Common.sleepR(700)	 
	    Common.sleepR(Auto.SentFavByContact.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
		Common.sleepR(700)	 
	    Common.click(236,1080)
	    Common.sleepR(Auto.SentFavByContact.config.g_s_time)
	end	
	 if(i%5==0) then
	Common.slideUp2(Auto.SentFavByContact.config.page_h)
	Common.sleepR(Auto.SentFavByContact.config.g_s_time)	
    end		
	
end
Auto.SentFavByContact.start=function()
Auto.SentFavByContact.config.page_h=535
Auto.SentFavByContact.config.row_h=Auto.SentFavByContact.config.page_h/5
Auto.SentFavByContact.config.g_s_time=1000 --一般操作延迟时间
Auto.SentFavByContact.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_013.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.SentFavByContact.config.num=num

for i=1,Auto.SentFavByContact.config.num do
	Auto.SentFavByContact.sent(i)
end


end

end
Auto.SentFavByContact.startS=function()
Auto.SentFavByContact.config.page_h=535
Auto.SentFavByContact.config.row_h=Auto.SentFavByContact.config.page_h/5
Auto.SentFavByContact.config.g_s_time=1000 --一般操作延迟时间
Auto.SentFavByContact.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_013.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.SentFavByContact.config.ret,Auto.SentFavByContact.config.num
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.SentFavByContact.config.num=num

for i=1,Auto.SentFavByContact.config.num do
	Auto.SentFavByContact.sent(i)
end
Auto.MultiLog.logout()--执行完退出

end

end
---*****029*****
---*****通讯录群发收藏内容(自动换号)*****
Auto.SentFavByContact.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发收藏内容(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_013.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.SentFavByContact.config.ret=s_ret
	Auto.SentFavByContact.config.num=s_num
	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentFavByContact.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)
	    Common.sleepR(1000)
	    Auto.SentFavByContact.startS()
        end
	end
	
end
end
---*****014*****
---*****通讯录群发指定名片*****
Auto.SentCardByContact.sent=function(i)
	 local n	
     if(i%5==0) then
     n=4
     else
     n=(i%5)-1	 
	 end
	Common.click(306,218+(n*Auto.SentCardByContact.config.row_h))
	Common.sleepR(Auto.SentCardByContact.config.g_s_time)	
   local x, y =findColorInRegionFuzzy(0x06BF04,100, 4, 307, 640, 1070)	
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+100,y+15)
		 Common.sleepR(2000)
		 Common.click(604,1086)
		Common.sleepR(1000)
		
		local d_x,d_y=Auto.findFavOrCard("card")--找名片
		if d_x~=-1 and d_y~=-1 then
			Common.click(d_x,d_y)--点击名片
			else
			dialog("没找到名片按钮，请重试",3)
			Common.sleepR(3000)
			lua_exit()
		end
		--[[Common.slideLeft(400)
		Common.sleepR(1000)
		Common.click(89,794)--点击名片--]]
          
		Common.sleepR(2000)
	     Common.click(270,168)
		 Common.sleepR(Auto.SentCardByContact.config.g_s_time)
		inputText(Auto.SentCardByContact.config.say)
		Common.sleepR(1000)
		Common.click(201,181)--点击第一个结果
		Common.sleepR(3000)
		--local x_1,y_1=findMultiColorInRegionFuzzy(0xF4F4F4,"-35|-21|0x007AFF,37|-29|0x007AFF,32|7|0x007AFF",100,341,386,577,937)--找名片（蓝色）发送按钮 
		 Common.click(425,664)--点击发送
        Common.sleepR(700)	 
	    Common.sleepR(Auto.SentCardByContact.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
		Common.sleepR(700)	 
	    Common.click(236,1080)
	    Common.sleepR(Auto.SentCardByContact.config.g_s_time)
	end	
	 if(i%5==0) then
	Common.slideUp2(Auto.SentCardByContact.config.page_h)
	Common.sleepR(Auto.SentCardByContact.config.g_s_time)	
    end		
	
end
Auto.SentCardByContact.start=function()
Auto.SentCardByContact.config.page_h=535
Auto.SentCardByContact.config.row_h=Auto.SentCardByContact.config.page_h/5
Auto.SentCardByContact.config.g_s_time=1000 --一般操作延迟时间
Auto.SentCardByContact.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_014.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.SentCardByContact.config.num=num
Auto.SentCardByContact.config.say=txt
for i=1,Auto.SentCardByContact.config.num do
	Auto.SentCardByContact.sent(i)
end


end

end
Auto.SentCardByContact.startS=function()
Auto.SentCardByContact.config.page_h=535
Auto.SentCardByContact.config.row_h=Auto.SentCardByContact.config.page_h/5
Auto.SentCardByContact.config.g_s_time=1000 --一般操作延迟时间
Auto.SentCardByContact.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_014.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt=Auto.SentCardByContact.config.ret,Auto.SentCardByContact.config.num,Auto.SentCardByContact.config.txt
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.SentCardByContact.config.num=num
Auto.SentCardByContact.config.say=txt
for i=1,Auto.SentCardByContact.config.num do
	Auto.SentCardByContact.sent(i)
end
Auto.MultiLog.logout()--执行完退出

end

end
---*****030*****
---*****通讯录群发指定名片(自动换号)*****
Auto.SentCardByContact.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发指定名片(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_014.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"通讯录群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt=showUI(sui)
	Auto.SentCardByContact.config.ret=s_ret
	Auto.SentCardByContact.config.num=s_num
	Auto.SentCardByContact.config.txt=s_txt
	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentCardByContact.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)
	    Common.sleepR(1000)
	    Auto.SentCardByContact.startS()
        end
	end
	
end
end
---*****015*****
---*****微信群群发消息*****
Auto.SentByGroup.sent=function(i)

	 local n	
     if(i%7==0) then
     n=6
     else
     n=(i%7)-1	 
	 end
	Common.click(306,239+(n*Auto.SentByGroup.config.row_h))
	Common.sleepR(Auto.SentByGroup.config.g_s_time)	

		 Common.click(242,1087)
		
		 inputText(Auto.SentByGroup.config.say[math.random(1,3)])
		 Common.sleepR(Auto.SentByGroup.config.g_s_time)
         Common.click(341,1088)
        Common.sleepR(700)	 
        Common.click(541,1081)--点击发送
	    Common.sleepR(Auto.SentByGroup.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
		Common.sleepR(700)	 
	    Common.click(236,1080)
	    Common.sleepR(Auto.SentByGroup.config.g_s_time)
	    Common.click(230,376)
		Common.sleepR(Auto.SentByGroup.config.g_s_time)
	 if(i%7==0) then
	Common.slideUp2(Auto.SentByGroup.config.page_h)
	Common.sleepR(Auto.SentByGroup.config.g_s_time)	
    end		
	
end
Auto.SentByGroup.start=function()
Auto.SentByGroup.config.page_h=772
Auto.SentByGroup.config.row_h=Auto.SentByGroup.config.page_h/7
Auto.SentByGroup.config.g_s_time=1000 --一般操作延迟时间
Auto.SentByGroup.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_015.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊,必须提前把相关群保存到通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=showUI(ui)
  Common.sleepR(2000)

if ret==1 then
Auto.SentByGroup.config.num=num
 Auto.SentByGroup.config.say={txt1,txt2,txt3}
for i=1,Auto.SentByGroup.config.num do
	Auto.SentByGroup.sent(i)
end


end

end
Auto.SentByGroup.startS=function()
Auto.SentByGroup.config.page_h=772
Auto.SentByGroup.config.row_h=Auto.SentByGroup.config.page_h/7
Auto.SentByGroup.config.g_s_time=1000 --一般操作延迟时间
Auto.SentByGroup.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_015.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊,必须提前把相关群保存到通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=Auto.SentByGroup.config.ret,Auto.SentByGroup.config.num,Auto.SentByGroup.config.txt1,Auto.SentByGroup.config.txt2,Auto.SentByGroup.config.txt3
  Common.sleepR(2000)

if ret==1 then
Auto.SentByGroup.config.num=num
 Auto.SentByGroup.config.say={txt1,txt2,txt3}
for i=1,Auto.SentByGroup.config.num do
	Auto.SentByGroup.sent(i)
end
Auto.MultiLog.logout()

end

end
---*****031*****
---*****微信群群发消息(自动换号)*****
Auto.SentByGroup.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发消息(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_015.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊,必须提前把相关群保存到通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.SentByGroup.config.ret=s_ret
	Auto.SentByGroup.config.num=s_num
	Auto.SentByGroup.config.txt1=s_txt1
	Auto.SentByGroup.config.txt2=s_txt2
	Auto.SentByGroup.config.txt3=s_txt3
	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentByGroup.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)--初始位置
	    Common.sleepR(1000)
		Common.click(166,440)
	    Common.sleepR(1000)
	    Auto.SentByGroup.startS()
        end
	end
	
end
end
---*****016*****
---****微信群群发收藏信息*****
Auto.SentFavByGroup.sent=function(i)

	 local n	
     if(i%7==0) then
     n=6
     else
     n=(i%7)-1	 
	 end
	Common.click(306,239+(n*Auto.SentFavByGroup.config.row_h))
	Common.sleepR(Auto.SentFavByGroup.config.g_s_time)	
		 Common.click(604,1086)
		Common.sleepR(1000)
		local d_x,d_y=Auto.findFavOrCard("fav")--找收藏
		if d_x~=-1 and d_y~=-1 then
			Common.click(d_x,d_y)--点击收藏
			else
			dialog("没找到收藏按钮，请重试",3)
			Common.sleepR(3000)
			lua_exit()
		end
		Common.sleepR(2000)
	     Common.click(365,249)
		 Common.sleepR(Auto.SentFavByGroup.config.g_s_time)
		local x_1,y_1=findMultiColorInRegionFuzzy(0xF9F7FA,"-14|2|0x09BB07,27|-21|0x09BB07,20|6|0x09BB07",100,341,586,577,837)--找发送按钮 
		 Common.click(x_1+10,y_1+15)
        Common.sleepR(700)	 
	    Common.sleepR(Auto.SentFavByGroup.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
		Common.sleepR(700)	 
	    Common.click(236,1080)
	    Common.sleepR(Auto.SentFavByGroup.config.g_s_time)
	    Common.click(230,376)
		Common.sleepR(Auto.SentFavByGroup.config.g_s_time)
	 if(i%7==0) then
	Common.slideUp2(Auto.SentFavByGroup.config.page_h)
	Common.sleepR(Auto.SentFavByGroup.config.g_s_time)	
    end		
	
end
Auto.SentFavByGroup.start=function()
Auto.SentFavByGroup.config.page_h=772
Auto.SentFavByGroup.config.row_h=Auto.SentFavByGroup.config.page_h/7
Auto.SentFavByGroup.config.g_s_time=1000 --一般操作延迟时间
Auto.SentFavByGroup.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_016.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)

if ret==1 then
Auto.SentFavByGroup.config.num=num

for i=1,Auto.SentFavByGroup.config.num do
	Auto.SentFavByGroup.sent(i)
end


end

end

Auto.SentFavByGroup.startS=function()
Auto.SentFavByGroup.config.page_h=772
Auto.SentFavByGroup.config.row_h=Auto.SentFavByGroup.config.page_h/7
Auto.SentFavByGroup.config.g_s_time=1000 --一般操作延迟时间
Auto.SentFavByGroup.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_016.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.SentFavByGroup.config.ret,Auto.SentFavByGroup.config.num
  Common.sleepR(2000)

if ret==1 then
Auto.SentFavByGroup.config.num=num

for i=1,Auto.SentFavByGroup.config.num do
	Auto.SentFavByGroup.sent(i)
end

Auto.MultiLog.logout()
end

end
---*****032*****
---****微信群群发收藏信息(自动换号)*****
Auto.SentFavByGroup.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发收藏信息(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{{\"style\":\"default\",\"config\":\"save_016.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.SentFavByGroup.config.ret=s_ret
	Auto.SentFavByGroup.config.num=s_num

	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentFavByGroup.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)--初始位置
	    Common.sleepR(1000)
		Common.click(166,440)
	    Common.sleepR(1000)
	    Auto.SentFavByGroup.startS()
        end
	end
	
end
end
---*****017*****
---*****微信群群发名片*****
Auto.SentCardByGroup.sent=function(i)

	 local n	
     if(i%7==0) then
     n=6
     else
     n=(i%7)-1	 
	 end
	Common.click(306,239+(n*Auto.SentCardByGroup.config.row_h))
	Common.sleepR(Auto.SentCardByGroup.config.g_s_time)	
		 Common.click(604,1086)
		Common.sleepR(1000)
		local d_x,d_y=Auto.findFavOrCard("card")--找名片
		if d_x~=-1 and d_y~=-1 then
			Common.click(d_x,d_y)--点击名片
			else
			dialog("没找到名片按钮，请重试",3)
			Common.sleepR(3000)
			lua_exit()
		end
		Common.sleepR(2000)
		Common.click(270,168)
		 Common.sleepR(Auto.SentCardByGroup.config.g_s_time)
		inputText(Auto.SentCardByGroup.config.say)
		Common.sleepR(1000)
		Common.click(201,181)--点击第一个结果
		Common.sleepR(2000)
		--local x_1,y_1=findMultiColorInRegionFuzzy(0xF4F4F4,"-35|-21|0x007AFF,37|-29|0x007AFF,32|7|0x007AFF",100,341,386,577,937)--找名片（蓝色）发送按钮 
	 
		Common.click(425,664)--点击发送
        Common.sleepR(700)	 
	    Common.sleepR(Auto.SentCardByGroup.config.g_s_time)	--延迟要长，出错率较高
		Common.click(48,84)
		Common.sleepR(700)	 
	    Common.click(236,1080)
	    Common.sleepR(Auto.SentCardByGroup.config.g_s_time)
	    Common.click(230,376)
		Common.sleepR(Auto.SentCardByGroup.config.g_s_time)
	 if(i%7==0) then
	Common.slideUp2(Auto.SentCardByGroup.config.page_h)
	Common.sleepR(Auto.SentCardByGroup.config.g_s_time)	
    end		
	
end
Auto.SentCardByGroup.start=function()
Auto.SentCardByGroup.config.page_h=772
Auto.SentCardByGroup.config.row_h=Auto.SentCardByGroup.config.page_h/7
Auto.SentCardByGroup.config.g_s_time=1000 --一般操作延迟时间
Auto.SentCardByGroup.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_017.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt=showUI(ui)
  Common.sleepR(2000)

if ret==1 then
Auto.SentCardByGroup.config.num=num
Auto.SentCardByGroup.config.say=txt
for i=1,Auto.SentCardByGroup.config.num do
	Auto.SentCardByGroup.sent(i)
end


end

end
Auto.SentCardByGroup.startS=function()
Auto.SentCardByGroup.config.page_h=772
Auto.SentCardByGroup.config.row_h=Auto.SentCardByGroup.config.page_h/7
Auto.SentCardByGroup.config.g_s_time=1000 --一般操作延迟时间
Auto.SentCardByGroup.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_017.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt=Auto.SentFavByGroup.config.ret,Auto.SentFavByGroup.config.num,Auto.SentFavByGroup.config.txt
  Common.sleepR(2000)

if ret==1 then
Auto.SentCardByGroup.config.num=num
Auto.SentCardByGroup.config.say=txt
for i=1,Auto.SentCardByGroup.config.num do
	Auto.SentCardByGroup.sent(i)
end

Auto.MultiLog.logout()
end

end
---*****033*****
---****微信群群发名片(自动换号)*****
Auto.SentCardByGroup.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发名片(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_017.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录-->群聊\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt=showUI(sui)
	Auto.SentCardByGroup.config.ret=s_ret
	Auto.SentCardByGroup.config.num=s_num
    Auto.SentCardByGroup.config.txt=s_txt
	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentCardByGroup.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)--初始位置
	    Common.sleepR(1000)
		Common.click(166,440)
	    Common.sleepR(1000)
	    Auto.SentCardByGroup.startS()
        end
	end
	
end
end
---*****011*****
---*****最近联系人群发消息*****
Auto.SentByLast.sent=function(i)
	 local n	
     if(i%6==0) then
     n=5
     else
     n=(i%6)-1	 
	 end
	Common.click(306,189+(n*Auto.SentByLast.config.row_h))
	Common.sleepR(Auto.SentByLast.config.g_s_time)	
 local x,y= findMultiColorInRegionFuzzy(0x7f8389,"-10|-22|0x7f8389,12|-22|0x7f8389,73|-12|0x7f8389",100,489,1040,640,1127)--找笑脸坐标，确定是联系人而不是新闻公众号之类的
    if x ~= -1 and y ~= -1 then    
		 Common.click(242,1087)
		 Common.sleepR(Auto.SentByLast.config.g_s_time)
		 inputText(Auto.SentByLast.config.say[math.random(1,3)])
		 Common.sleepR(Auto.SentByLast.config.g_s_time)
         Common.click(341,1088)
        Common.sleepR(700)	 
        Common.click(541,1081)--点击发送
	    Common.sleepR(Auto.SentByLast.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
	    Common.sleepR(Auto.SentByLast.config.g_s_time)
		else
		Common.click(48,84)
	    Common.sleepR(Auto.SentByLast.config.g_s_time)
	end	
	 if(i%6==0) then
	Common.slideUp2(Auto.SentByLast.config.page_h)
	Common.sleepR(Auto.SentByLast.config.g_s_time)	
    end		
	
end
Auto.SentByLast.start=function()
Auto.SentByLast.config.page_h=778
Auto.SentByLast.config.row_h=Auto.SentByLast.config.page_h/6
Auto.SentByLast.config.g_s_time=1000 --一般操作延迟时间
Auto.SentByLast.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_011.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(88)
if ret==1 then
Auto.SentByLast.config.num=num
 Auto.SentByLast.config.say={txt1,txt2,txt3}
for i=1,Auto.SentByLast.config.num do
	Auto.SentByLast.sent(i)
end


end

end
Auto.SentByLast.startS=function()
Auto.SentByLast.config.page_h=778
Auto.SentByLast.config.row_h=Auto.SentByLast.config.page_h/6
Auto.SentByLast.config.g_s_time=1000 --一般操作延迟时间
Auto.SentByLast.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_011.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt1,txt2,txt3=Auto.SentByLast.config.ret,Auto.SentByLast.config.num,Auto.SentByLast.config.txt1,Auto.SentByLast.config.txt2,Auto.SentByLast.config.txt3
  Common.sleepR(2000)
  Common.slideUp2(88)
if ret==1 then
Auto.SentByLast.config.num=num
 Auto.SentByLast.config.say={txt1,txt2,txt3}
for i=1,Auto.SentByLast.config.num do
	Auto.SentByLast.sent(i)
end
Auto.MultiLog.logout()

end

end

---*****034*****
---****最近联系人群发消息(自动换号)*****
Auto.SentByLast.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"微信群群发名片(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_011.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发消息\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.SentByLast.config.ret=s_ret
	Auto.SentByLast.config.num=s_num
    Auto.SentByLast.config.txt1=s_txt1
	Auto.SentByLast.config.txt2=s_txt2
	Auto.SentByLast.config.txt3=s_txt3
	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentByLast.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
	    Auto.SentByLast.startS()
        end
	end
	
end
end
---*****018*****
---*****最近联系人群发收藏信息*****
Auto.SentFavByLast.sent=function(i)
	 local n	
     if(i%6==0) then
     n=5
     else
     n=(i%6)-1	 
	 end
	Common.click(306,189+(n*Auto.SentFavByLast.config.row_h))
	Common.sleepR(Auto.SentFavByLast.config.g_s_time)	
 local x,y= findMultiColorInRegionFuzzy(0x7f8389,"-10|-22|0x7f8389,12|-22|0x7f8389,73|-12|0x7f8389",100,489,1040,640,1127)--找笑脸坐标，确定是联系人而不是新闻公众号之类的
    if x ~= -1 and y ~= -1 then   
		 Common.click(604,1086)
		Common.sleepR(1000)
		local d_x,d_y=Auto.findFavOrCard("fav")--找收藏
		if d_x~=-1 and d_y~=-1 then
			Common.click(d_x,d_y)--点击收藏
			
			else
			dialog("没找到收藏按钮，请重试",3)
			Common.sleepR(3000)
			lua_exit()
		end
		--Common.click(237,982)
		
		 Common.sleepR(2000)
	     Common.click(365,249)
		 Common.sleepR(Auto.SentFavByLast.config.g_s_time)
		
		local x_1,y_1=findMultiColorInRegionFuzzy(0xF9F7FA,"-14|2|0x09BB07,27|-21|0x09BB07,20|6|0x09BB07",100,341,586,577,837)--找发送按钮 
		 Common.click(x_1+10,y_1+15)
        Common.sleepR(700)	 
	    Common.sleepR(Auto.SentFavByLast.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
		Common.sleepR(700)	 
		Common.sleepR(Auto.SentFavByLast.config.g_s_time)
		
		
	else 
		Common.click(48,80)
		Common.sleepR(1000)
	end	
	 if(i%6==0) then
	Common.slideUp2(Auto.SentFavByLast.config.page_h)
	Common.sleepR(Auto.SentFavByLast.config.g_s_time)	
    end		
	
end
Auto.SentFavByLast.start=function()
Auto.SentFavByLast.config.page_h=778
Auto.SentFavByLast.config.row_h=Auto.SentFavByLast.config.page_h/6
Auto.SentFavByLast.config.g_s_time=1000 --一般操作延迟时间
Auto.SentFavByLast.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_018.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(88)
if ret==1 then
Auto.SentFavByLast.config.num=num

for i=1,Auto.SentFavByLast.config.num do
	Auto.SentFavByLast.sent(i)
end


end

end

Auto.SentFavByLast.startS=function()
Auto.SentFavByLast.config.page_h=778
Auto.SentFavByLast.config.row_h=Auto.SentFavByLast.config.page_h/6
Auto.SentFavByLast.config.g_s_time=1000 --一般操作延迟时间
Auto.SentFavByLast.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_018.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.SentFavByLast.config.ret,Auto.SentFavByLast.config.num
  Common.sleepR(2000)
  Common.slideUp2(88)
if ret==1 then
Auto.SentFavByLast.config.num=num

for i=1,Auto.SentFavByLast.config.num do
	Auto.SentFavByLast.sent(i)
end

Auto.MultiLog.logout()
end

end

---*****035*****
---****最近联系人群发收藏信息(自动换号)*****
Auto.SentFavByLast.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发收藏信息(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_018.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发收藏内容\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，默认发送收藏夹第一条内容\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1,s_txt2,s_txt3=showUI(sui)
	Auto.SentFavByLast.config.ret=s_ret
	Auto.SentFavByLast.config.num=s_num

	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentFavByLast.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
	    Auto.SentFavByLast.startS()
        end
	end
	
end
end
---*****019*****
---*****最近联系人群发名片*****
Auto.SentCardByLast.sent=function(i)
	 local n	
     if(i%6==0) then
     n=5
     else
     n=(i%6)-1	 
	 end
	Common.click(306,189+(n*Auto.SentCardByLast.config.row_h))
	Common.sleepR(Auto.SentCardByLast.config.g_s_time)	
 local x,y= findMultiColorInRegionFuzzy(0x7f8389,"-10|-22|0x7f8389,12|-22|0x7f8389,73|-12|0x7f8389",100,489,1040,640,1127)--找笑脸坐标，确定是联系人而不是新闻公众号之类的
    if x ~= -1 and y ~= -1 then   
		
		 Common.click(604,1086)
		Common.sleepR(1000)
		local d_x,d_y=Auto.findFavOrCard("card")--找名片
		if d_x~=-1 and d_y~=-1 then
			Common.click(d_x,d_y)--点击名片
			else
			dialog("没找到名片按钮，请重试",3)
			Common.sleepR(3000)
			lua_exit()
		end
		Common.sleepR(2000)
	     Common.click(270,168)
		 Common.sleepR(Auto.SentCardByLast.config.g_s_time)
		inputText(Auto.SentCardByLast.config.say)
		Common.sleepR(1000)
		Common.click(201,181)--点击第一个结果
		Common.sleepR(3000)
		--local x_1,y_1=findMultiColorInRegionFuzzy(0xF4F4F4,"-35|-21|0x007AFF,37|-29|0x007AFF,32|7|0x007AFF",100,341,386,577,937)--找名片（蓝色）发送按钮 
		 Common.click(425,664)--点击发送
        Common.sleepR(700)	 
	    Common.sleepR(Auto.SentCardByLast.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
	    Common.sleepR(Auto.SentCardByLast.config.g_s_time)
		
		else 
		Common.click(48,80)
		Common.sleepR(1000)
	end	
	 if(i%6==0) then
	Common.slideUp2(Auto.SentCardByLast.config.page_h)
	Common.sleepR(Auto.SentCardByLast.config.g_s_time)	
    end		
	
end
Auto.SentCardByLast.start=function()
Auto.SentCardByLast.config.page_h=778
Auto.SentCardByLast.config.row_h=Auto.SentCardByLast.config.page_h/6
Auto.SentCardByLast.config.g_s_time=1000 --一般操作延迟时间
Auto.SentCardByLast.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_019.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(88)
if ret==1 then
Auto.SentCardByLast.config.num=num
Auto.SentCardByLast.config.say=txt
for i=1,Auto.SentCardByLast.config.num do
	Auto.SentCardByLast.sent(i)
end


end

end
Auto.SentCardByLast.startS=function()
Auto.SentCardByLast.config.page_h=778
Auto.SentCardByLast.config.row_h=Auto.SentCardByLast.config.page_h/6
Auto.SentCardByLast.config.g_s_time=1000 --一般操作延迟时间
Auto.SentCardByLast.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_019.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num,txt=Auto.SentFavByLast.config.ret,Auto.SentFavByLast.config.num,Auto.SentFavByLast.config.txt
  Common.sleepR(2000)
  Common.slideUp2(88)
if ret==1 then
Auto.SentCardByLast.config.num=num
Auto.SentCardByLast.config.say=txt
for i=1,Auto.SentCardByLast.config.num do
	Auto.SentCardByLast.sent(i)
end
Auto.MultiLog.logout()

end

end
---*****036*****
---****最近联系人群发名片(自动换号)*****
Auto.SentCardByLast.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发名片(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_019.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"最近联系人群发名片\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"被发送名片者昵称\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"爱你\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num,s_txt1=showUI(sui)
	Auto.SentCardByLast.config.ret=s_ret
	Auto.SentCardByLast.config.num=s_num
	Auto.SentCardByLast.config.txt=s_txt1

	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.SentCardByLast.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
	    Auto.SentCardByLast.startS()
        end
	end
	
end
end
---*****012*****
---*****屏蔽联系人朋友圈*****
Auto.NoMoments.shield=function(i)
	 local n	
     if(i%5==0) then
     n=4
     else
     n=(i%5)-1	 
	 end
	Common.click(306,218+(n*Auto.NoMoments.config.row_h))
	Common.sleepR(Auto.NoMoments.config.g_s_time)
	local d_x,d_y=findColorInRegionFuzzy(0xffffff,100,555,71,627,106)
	if d_x~= -1 and d_y~= -1 then    
	Common.click(592,85)
	Common.sleepR(Auto.NoMoments.config.g_s_time)
	local x, y =findColorInRegionFuzzy(0x4bd662,100, 496, 631, 633, 714)	
    if x== -1 and y== -1 then    
	     Common.click(540,671)
		 Common.sleepR(Auto.NoMoments.config.g_s_time)
		Common.click(48,84)
		Common.sleepR(700)	 
		Common.click(48,84)
	    Common.sleepR(700)
		else
		Common.click(48,84)
		Common.sleepR(700)	 
		Common.click(48,84)
	    Common.sleepR(700)
	end	
	else
	Common.click(48,84)
	Common.sleepR(700)	 
	
	end
	
   
	 if(i%5==0) then
	Common.slideUp2(Auto.NoMoments.config.page_h)
	Common.sleepR(Auto.NoMoments.config.g_s_time)	
    end		
	
end
Auto.NoMoments.start=function()
Auto.NoMoments.config.page_h=535
Auto.NoMoments.config.row_h=Auto.NoMoments.config.page_h/5
Auto.NoMoments.config.g_s_time=1000 --一般操作延迟时间
Auto.NoMoments.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_012.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"屏蔽联系人朋友圈\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"屏蔽联系人个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.NoMoments.config.num=num
 Auto.NoMoments.config.say={txt1,txt2,txt3}
for i=1,Auto.NoMoments.config.num do
	Auto.NoMoments.shield(i)
end


end

end
Auto.NoMoments.startS=function()
Auto.NoMoments.config.page_h=535
Auto.NoMoments.config.row_h=Auto.NoMoments.config.page_h/5
Auto.NoMoments.config.g_s_time=1000 --一般操作延迟时间
Auto.NoMoments.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_012.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"屏蔽联系人朋友圈\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"屏蔽联系人个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.NoMoments.config.ret,Auto.NoMoments.config.num
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.NoMoments.config.num=num
 Auto.NoMoments.config.say={txt1,txt2,txt3}
for i=1,Auto.NoMoments.config.num do
	Auto.NoMoments.shield(i)
end
Auto.MultiLog.logout()

end

end

---*****044*****
---****屏蔽联系人朋友圈(自动换号)*****
Auto.NoMoments.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"屏蔽联系人朋友圈(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_012.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"屏蔽联系人朋友圈\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"屏蔽联系人个数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.NoMoments.config.ret=s_ret
	Auto.NoMoments.config.num=s_num


	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.NoMoments.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)--初始位置
	    Common.sleepR(1000)
	    Auto.NoMoments.startS()
        end
	end
	
end
end
---*****020*****
---*****朋友圈自动发文字*****
Auto.AutoMomentsWord.go=function()
	touchDown(1,585,84)
	Common.sleepR(2000)
	touchUp(1,585,84)
	inputText(Auto.AutoMomentsWord.config.say)
	Common.sleepR(1000)
	 Common.click(341,1088)
        Common.sleepR(700)	 
        Common.click(585,84)--点击发送
	    Common.sleepR(Auto.AutoMomentsWord.config.g_s_time)	--延迟要长，出错率较高	
		Common.click(48,84)
	    Common.sleepR(Auto.AutoMomentsWord.config.g_s_time)
end
Auto.AutoMomentsWord.start=function()
Auto.AutoMomentsWord.config.g_s_time=1000 --一般操作延迟时间
Auto.AutoMomentsWord.config.say=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_020.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发文字\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现-->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发表文字\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"文字\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)
if ret==1 then
Auto.AutoMomentsWord.config.say=num
	Auto.AutoMomentsWord.go()
end
Common.click(577,1092)

end
Auto.AutoMomentsWord.startS=function()
Auto.AutoMomentsWord.config.g_s_time=1000 --一般操作延迟时间
Auto.AutoMomentsWord.config.say=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_020.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发文字\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现-->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发表文字\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"文字\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.AutoMomentsWord.config.ret,Auto.AutoMomentsWord.config.num
  Common.sleepR(2000)
if ret==1 then
Auto.AutoMomentsWord.config.say=num
	Auto.AutoMomentsWord.go()
end
	
Common.click(577,1092)
Auto.MultiLog.logout()

end
---*****045*****
---****朋友圈自动发文字(自动换号)*****
Auto.AutoMomentsWord.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发文字(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_020.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发文字\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现-->朋友圈\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发表文字\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"文字\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.AutoMomentsWord.config.ret=s_ret
	Auto.AutoMomentsWord.config.num=s_num


	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.AutoMomentsWord.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(404,1072)
         Common.sleepR(Auto.AutoMomentsWord.config.g_s_time)
        Common.click(287,204)--点击朋友圈
         Common.sleepR(5000)
	    Auto.AutoMomentsWord.startS()
        end
	end
	
end
end
---*****021*****
---*****朋友圈自动发图文*****
Auto.AutoMomentsImg.go=function()
     Common.clickS(585,84)
     Common.sleepR(1000)
	 Common.click(323,976)
        Common.sleepR(1000)	 
        Common.click(323,138)--点击相册
		   Common.sleepR(1000)	 
	 
for i=1,Auto.AutoMomentsImg.config.num+1 do
local n,r
     if(i%4==0) then
     n=3
     else
     n=(i%4)-1	 
	 end
	
	count=i%16
    if count==0 then
    r=3
    else
    r=math.ceil(count/4)-1
    end
		Common.clickS(126+(n*Auto.AutoMomentsImg.config.row_w),162+(r*Auto.AutoMomentsImg.config.row_h))
		Common.sleepR(1000)
end 
Common.click(580,1087)
Common.sleepR(3000)
Common.click(72,177)
Common.sleepR(1000)
inputText(Auto.AutoMomentsImg.config.say)
Common.sleepR(1000)
 Common.clickS(585,84)
Common.sleepR(1000)
end
Auto.AutoMomentsImg.start=function()
Auto.AutoMomentsImg.config.g_s_time=1000 --一般操作延迟时间
 Auto.AutoMomentsImg.config.page_h=628--群成员4行高度
 Auto.AutoMomentsImg.config.row_w=640/4--群成员一行宽度
Auto.AutoMomentsImg.config.row_h=Auto.AutoMomentsImg.config.page_h/4
Auto.AutoMomentsImg.config.num=3--要接受的次数
Auto.AutoMomentsImg.config.g_s_time=1000 --一般操作延迟时间
Auto.AutoMomentsImg.config.say=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_021.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发图文\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现-->朋友圈,默认从第一个相册开始选择\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发表文字\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"文字\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发表图片数量\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1,2,3,4,5,6,7,8,9\",\"select\":\"2\"}]}"
 local ret,txt,num=showUI(ui)
  Common.sleepR(2000)
if ret==1 then
Auto.AutoMomentsImg.config.say=txt
Auto.AutoMomentsImg.config.num=num+0
	Auto.AutoMomentsImg.go()
end

end
Auto.AutoMomentsImg.startS=function()
Auto.AutoMomentsImg.config.g_s_time=1000 --一般操作延迟时间
 Auto.AutoMomentsImg.config.page_h=628--群成员4行高度
 Auto.AutoMomentsImg.config.row_w=640/4--群成员一行宽度
Auto.AutoMomentsImg.config.row_h=Auto.AutoMomentsImg.config.page_h/4
Auto.AutoMomentsImg.config.num=3--要接受的次数
Auto.AutoMomentsImg.config.g_s_time=1000 --一般操作延迟时间
Auto.AutoMomentsImg.config.say=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_021.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发图文\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现-->朋友圈,默认从第一个相册开始选择\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发表文字\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"文字\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发表图片数量\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1,2,3,4,5,6,7,8,9\",\"select\":\"2\"}]}"
 local ret,txt,num=Auto.AutoMomentsImg.config.ret,Auto.AutoMomentsImg.config.txt,Auto.AutoMomentsImg.config.num
  Common.sleepR(2000)
if ret==1 then
Auto.AutoMomentsImg.config.say=txt
Auto.AutoMomentsImg.config.num=num+0
	Auto.AutoMomentsImg.go()
end
Auto.MultiLog.logout()


end

---*****046*****
---****朋友圈自动发图文(自动换号)*****
Auto.AutoMomentsImg.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发图文(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_021.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"朋友圈自动发图文\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->发现-->朋友圈,默认从第一个相册开始选择\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发表文字\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"文字\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发表图片数量\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1,2,3,4,5,6,7,8,9\",\"select\":\"2\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_txt,s_num=showUI(sui)
	Auto.AutoMomentsImg.config.ret=s_ret
	Auto.AutoMomentsImg.config.txt=s_txt
	Auto.AutoMomentsImg.config.num=s_num


	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.AutoMomentsImg.config.ret==1 then
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(404,1072)
         Common.sleepR(1000)
        Common.click(287,204)--点击朋友圈
         Common.sleepR(5000)
	    Auto.AutoMomentsImg.startS()
        end
	end
	
end
end
---*****025*****
---*****自动检测僵尸好友*****
Auto.ZombieCheck.sent=function(i)
	 local n	
     if(i%5==0) then
     n=4
     else
     n=(i%5)-1	 
	 end
	Common.click(306,218+(n*Auto.ZombieCheck.config.row_h))
	Common.sleepR(Auto.ZombieCheck.config.g_s_time)	
   local x,y=findMultiColorInRegionFuzzy("0x888888","-15|-4|0x8F8F8F,-10|11|0x8E8E8E,24|0|0x888888",100,21,314,623,1030)--找详细资料中的相册文字
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+100,y+15)
		 Common.sleepR(2000)
		local b_x,b_y=findColorInRegionFuzzy("0x1E1E1E",100,4,898,633,1117)--找日期色值，判断对方朋友圈是否能查看
		if b_x==-1 and b_y==-1 then
			Common.click(48,84)
			Common.sleepR(800)
			Common.clickS(588,89)--点击更多
			Common.sleepR(800)
			local c_x, c_y =findColorInRegionFuzzy(0x4bd662,100, 496, 423, 633, 485)--找开关是否打开
            if c_x== -1 and c_y== -1 then    
	         Common.click(531,456)
		     Common.sleepR(Auto.ZombieCheck.config.g_s_time)
			end
		end
		Common.click(48,84)
		Common.sleepR(700)	 
		Common.click(48,84)
	    Common.sleepR(1000)
	else

	   	Common.click(48,84)
		Common.sleepR(1000) 
	end	
	 if(i%5==0) then
	Common.slideUp2(Auto.ZombieCheck.config.page_h)
	Common.sleepR(Auto.ZombieCheck.config.g_s_time)	
    end		
	
end
Auto.ZombieCheck.start=function()
Auto.ZombieCheck.config.page_h=535
Auto.ZombieCheck.config.row_h=Auto.ZombieCheck.config.page_h/5
Auto.ZombieCheck.config.g_s_time=1000 --一般操作延迟时间
Auto.ZombieCheck.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_025.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录,如果检测到对方已经把你拉黑，软件会把对方标记为星标朋友，方便您管理\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"检测多少个好友\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.ZombieCheck.config.num=num
for i=1,Auto.ZombieCheck.config.num do
	Auto.ZombieCheck.sent(i)
end
end

end
Auto.ZombieCheck.startS=function()
Auto.ZombieCheck.config.page_h=535
Auto.ZombieCheck.config.row_h=Auto.ZombieCheck.config.page_h/5
Auto.ZombieCheck.config.g_s_time=1000 --一般操作延迟时间
Auto.ZombieCheck.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_025.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录,如果检测到对方已经把你拉黑，软件会把对方标记为星标朋友，方便您管理\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"检测多少个好友\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.ZombieCheck.config.ret,Auto.ZombieCheck.config.num
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.ZombieCheck.config.num=num

for i=1,Auto.ZombieCheck.config.num do
	Auto.ZombieCheck.sent(i)
end
Auto.MultiLog.logout()


end

end

---*****047*****
---****自动检测僵尸好友(自动换号)*****
Auto.ZombieCheck.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_025.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录,如果检测到对方已经把你拉黑，软件会把对方标记为星标朋友，方便您管理\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"检测多少个好友\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.ZombieCheck.config.ret=s_ret
	Auto.ZombieCheck.config.num=s_num

	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.ZombieCheck.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)--初始位置
	    Common.sleepR(1000)
	    Auto.ZombieCheck.startS()
        end
	end
	
end
end
---*****026*****
---*****自动检测僵尸好友并删除*****
Auto.ZombieCheckDel.sent=function(i)
	 local n	
     if(i%5==0) then
     n=4
     else
     n=(i%5)-1	 
	 end
	Common.click(306,218+(n*Auto.ZombieCheckDel.config.row_h))
	Common.sleepR(Auto.ZombieCheckDel.config.g_s_time)	
	 local x,y=findMultiColorInRegionFuzzy("0x888888","-15|-4|0x8F8F8F,-10|11|0x8E8E8E,24|0|0x888888",100,21,314,623,1030)--找详细资料中的相册文字
    if x ~= -1 and y ~= -1 then    
	     Common.click(x+100,y+15)
		 Common.sleepR(2000)
		local b_x,b_y=findColorInRegionFuzzy("0x1E1E1E",100,4,898,633,1117)--找日期色值，判断对方朋友圈是否能查看
		if b_x==-1 and b_y==-1 then
			Common.click(48,84)
			Common.sleepR(800)
			Common.clickS(588,89)--点击更多
			Common.sleepR(800)
			Common.click(299,1053)--点击删除
			Common.sleepR(800)
			Common.click(311,982)
	        Common.sleepR(1000)
		end
		Common.click(48,84)
		Common.sleepR(700)	 
		Common.click(48,84)
	    Common.sleepR(1000)
	else

	   	Common.click(48,84)
		Common.sleepR(1000) 
	end	
	 if(i%5==0) then
	Common.slideUp2(Auto.ZombieCheckDel.config.page_h)
	Common.sleepR(Auto.ZombieCheckDel.config.g_s_time)	
    end		
	
end
Auto.ZombieCheckDel.start=function()
Auto.ZombieCheckDel.config.page_h=535
Auto.ZombieCheckDel.config.row_h=Auto.ZombieCheckDel.config.page_h/5
Auto.ZombieCheckDel.config.g_s_time=1000 --一般操作延迟时间
Auto.ZombieCheckDel.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_026.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友并删除\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"检测好友人数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=showUI(ui)
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.ZombieCheckDel.config.num=num

for i=1,Auto.ZombieCheckDel.config.num do
	Auto.ZombieCheckDel.sent(i)
end


end

end
Auto.ZombieCheckDel.startS=function()
Auto.ZombieCheckDel.config.page_h=535
Auto.ZombieCheckDel.config.row_h=Auto.ZombieCheckDel.config.page_h/5
Auto.ZombieCheckDel.config.g_s_time=1000 --一般操作延迟时间
Auto.ZombieCheckDel.config.num=3--添加人数

 local ui="{\"style\":\"default\",\"config\":\"save_026.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友并删除\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"发送消息次数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"发送信息文本\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"天气转凉，多加衣物\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"干啥呢\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"text\":\"猜猜我是谁\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
 local ret,num=Auto.ZombieCheckDel.config.ret,Auto.ZombieCheckDel.config.num
  Common.sleepR(2000)
  Common.slideUp2(562)
if ret==1 then
Auto.ZombieCheckDel.config.num=num
for i=1,Auto.ZombieCheckDel.config.num do
	Auto.ZombieCheckDel.sent(i)
end
Auto.MultiLog.logout()


end

end

---*****048*****
---****自动检测僵尸好友并删除(自动换号)*****
Auto.ZombieCheckDel.multiStart=function()
local ui="{\"style\":\"default\",\"config\":\"save_028.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友并删除(自动换号)\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->微信，\\n1.请在'主目录/res/'下新建'轮登账号.txt'文件\\n 2.并在其中写入你要轮登的账号密码 \\n 3.格式为'账号/密码/'(引号中的是格式),一行一个\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"轮登账号数（不得超过账号文件中的账号个数）\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"1次,2次,3次\",\"select\":\"1\"}]}"
local sui="{\"style\":\"default\",\"config\":\"save_026.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"自动检测僵尸好友并删除\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"注意：启动界面：微信 -->通讯录,\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"检测好友人数\",\"size\":15,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"次数\",\"text\":\"5\",\"align\":\"left\",\"size\":15,\"color\":\"0,123,223\"}]}"
local ret,num=showUI(ui)

if ret==1 then
	local s_ret,s_num=showUI(sui)
	Auto.ZombieCheckDel.config.ret=s_ret
	Auto.ZombieCheckDel.config.num=s_num

	--单步选项初始化，第一次接受用户输入并存储到相应bat文件和全局变量中，之后采用默认值
	if Auto.ZombieCheckDel.config.ret==1 then
	
        Auto.MultiLog.logoutInit()
        for i=1,num+1 do 
        Auto.MultiLog.login(i)
		Common.click(236,1080)--初始位置
	    Common.sleepR(1000)
	    Auto.ZombieCheckDel.startS()
        end
	end
	
end
end
---*****027*****
---****轮登相关操作*****
Auto.MultiLog.logout=function()
Common.clickS(48,80)
Common.sleepR(800)
Common.clickS(48,80)
Common.sleepR(800)
Common.clickS(48,80)
Common.sleepR(800)
Common.clickS(48,80)
Common.sleepR(800)
Common.clickS(48,80)
Common.sleepR(800)--不论在什么页面最多5此嵌套即可返回主页面
Common.clickS(559,1082)
Common.sleepR(800)
local x,y=findMultiColorInRegionFuzzy(0x10AEFF,"54|-14|0x000000,-3|5|0x10AEFF,-5|13|0x10AEFF",100,12,466,635,1033)--找设置按钮
Common.click(x,y)
Common.sleepR(800)
Common.clickS(341,757)--点击退出
Common.sleepR(800)
Common.clickS(313,980)--确认退出
Common.sleepR(10000)
Common.clickS(561,81)--点击切换
Common.sleepR(3000)
Common.clickS(315,967)
Common.sleepR(800)--到登录界面
end
--初始退出
Auto.MultiLog.logoutInit=function()
Common.clickS(559,1082)
Common.sleepR(800)
local x,y=findMultiColorInRegionFuzzy(0x10AEFF,"54|-14|0x000000,-3|5|0x10AEFF,-5|13|0x10AEFF",100,12,466,635,1033)--找设置按钮
Common.click(x,y)
Common.sleepR(800)
Common.clickS(341,757)--点击退出
Common.sleepR(800)
Common.clickS(313,980)--确认退出
Common.sleepR(10000)
Common.clickS(561,81)--点击切换
Common.sleepR(3000)
Common.clickS(315,967)
Common.sleepR(800)--到登录界面
end
Auto.MultiLog.readFile=function(file)
    assert(file,"file open failed")
    local fileTab = {}
    local line = file:read()
    while line do
        table.insert(fileTab,line)
        line = file:read()
    end
    return fileTab
end
Auto.MultiLog.readOneRec=function(i)
  local fileRead = io.open(Auto.MultiLog.config.filePath)
    if fileRead then
        local tab = Auto.MultiLog.readFile(fileRead)
        fileRead:close()
        diyihang=tab[i]--读取指定行         
    end
    return diyihang
end
Auto.MultiLog.getAccAndPwd=function(txt)
	local i,j=string.find(txt,"/")
	local len=string.len(txt)
     local acc,pwd=string.sub(txt,0,i-1),string.sub(txt,j+1,	len-2)
	return acc,pwd
end
Auto.MultiLog.login=function(i)
Auto.MultiLog.config.filePath="/User/Media/TouchSprite/res/轮登账号.txt"

local record=Auto.MultiLog.readOneRec(i)
local i,j=string.find(record,'/')
local acc,pwd=Auto.MultiLog.getAccAndPwd(record)
pwd=string.gsub(pwd, "\n", "")
--local m,n=string.find(pwd,"\n")
Common.sleepR(2000)
Common.click(151,223)
Common.sleepR(1000)
inputText(acc)
Common.sleepR(700)
Common.click(180,323)
Common.sleepR(1000)
inputText(pwd)
Common.sleepR(700)
local x,y=findColorInRegionFuzzy(0x06BF04,100,7,140,619,633)
Common.click(x+20,y+10)
Common.sleepR(10000)

end

Auto.findFavOrCard=function(t)
Common.sleepR(1000)
local cur_p=1
local d_x,d_y
local c_x,c_y
local x,y=findColorInRegionFuzzy(0x8B8B8B,100,295,1094,312,1106)--判断是否是第一页

if x~=-1 and y~=-1 then

	cur_p=1
	else
	cur_p=2
end

   if t=="fav" then
	 c_x,c_y=findMultiColorInRegionFuzzy(0xF4F4F6,"0|-5|0x929292,-20|1|0x898989,-32|-9|0x989899",100,4,706,620,1095)--找收藏文字
     	if c_x~=-1 and c_y~=-1 then
			d_x,d_y=c_x,c_y-100
		else---翻页
			if cur_p==1 then
				Common.slideLeft(400)
				Common.sleepR(2000)
				 c_x,c_y=findMultiColorInRegionFuzzy(0xF4F4F6,"0|-5|0x929292,-20|1|0x898989,-32|-9|0x989899",100,4,706,620,1095)--找收藏文字
                if c_x~=-1 and c_y~=-1 then	
				d_x,d_y=c_x,c_y-100
				end	
			else
				Common.slideRight(400)
				Common.sleepR(2000)
				 c_x,c_y=findMultiColorInRegionFuzzy(0xF4F4F6,"0|-5|0x929292,-20|1|0x898989,-32|-9|0x989899",100,4,706,620,1095)--找收藏文字
                if c_x~=-1 and c_y~=-1 then	
				d_x,d_y=c_x,c_y-100
				end	
			end
		end
	else
	c_x,c_y=findMultiColorInRegionFuzzy(0xF4F4F6,"0|-59|0x6F7378,-14|-9|0x8F8F8F,8|0|0x9E9E9E",100,4,706,620,1095)--找名片文字，间接找按钮
	
    
        if c_x~=-1 and c_y~=-1 then
			d_x,d_y=c_x,c_y-80
		else---翻页
			if cur_p==1 then
				Common.slideLeft(400)
				Common.sleepR(2000)
				c_x,c_y=findMultiColorInRegionFuzzy(0xF4F4F6,"0|-59|0x6F7378,-14|-9|0x8F8F8F,8|0|0x9E9E9E",100,4,706,620,1095)--找名片文字，间接找按钮
                if c_x~=-1 and c_y~=-1 then	
				d_x,d_y=c_x,c_y-80
				end	
			else
				Common.slideRight(400)
				Common.sleepR(2000)
				c_x,c_y=findMultiColorInRegionFuzzy(0xF4F4F6,"0|-59|0x6F7378,-14|-9|0x8F8F8F,8|0|0x9E9E9E",100,4,706,620,1095)--找名片文字，间接找按钮
                if c_x~=-1 and c_y~=-1 then	
				d_x,d_y=c_x,c_y-80
				end	
			end
		end

end
return d_x,d_y
end
---初始界面
Auto.InitMenu=function()

local ui="{\"style\":\"default\",\"config\":\"save_menu.dat\",\"width\":600,\"views\":[{\"type\":\"Label\",\"text\":\"云集-微信助手\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"RadioGroup\",\"list\":\"★使用说明(必看),1.1-全球定位自动打招呼,2.1-通讯录好友自动推送发消息,2.2-通讯录好友自动推送收藏内容,2.3-通讯录好友自动推送发名片,2.4-通讯录好友自动推送消息（轮登）,2.5-通讯录好友自动推送收藏内容（轮登）,2.6-通讯录好友自动推送发名片（轮登）,3.1-最近联系人自动推送发消息,3.2-最近联系人自动推送发收藏内容,3.3-最近联系人自动推送发名片,3.4-最近联系人自动推送发消息（轮登）,3.5-最近联系人自动推送收藏内容（轮登）,3.6-最近联系人自动推送名片（轮登）,4.1-微信群自动推送发消息,4.2-微信群自动推送发收藏内容,4.3-微信群自动推送发名片,4.4-微信群自动推送发消息（轮登）,4.5-微信群自动推送收藏内容（轮登）,4.6-微信群自动推送名片（轮登）,5.1-自动扔漂流瓶\\n,5.2-自动捡漂流瓶,5.3-自动扔漂流瓶（轮登）,5.4-自动捡漂流瓶（轮登）,6.1-朋友圈自动点赞,6.2-朋友圈自动点赞+评论,6.3-朋友圈自动发文字,6.4-朋友圈自动发图文,6.5-朋友圈自动点赞（轮登）,6.6-朋友圈自动点赞+评论（轮登）,6.7-朋友圈自动发文字（轮登）,6.8-朋友圈自动发图文（轮登）,7.1-手机通讯录开通微信的自动添加,7.2-QQ列表开通微信的自动添加,7.3-通讯录添加手机联系人,7.4-自动查找号码添加,7.5-通讯录开通微信的自动添加（轮登）,7.6-QQ列表开通微信的自动添加(轮登),7.7-通讯录添加手机联系人(轮登),8.1-单群群成员自动添加,8.2-多群群成员自动添加,9.1-自动检测僵尸好友,9.2-自动检测僵尸好友并删除,9.3-屏蔽联系人朋友圈,9.4-自动检测僵尸好友（轮登）,9.5-自动检测僵尸好友并删除（轮登）,9.6-屏蔽联系人朋友圈（轮登）,10.1-自动接受通讯录好友请求,10.2-自动接受附近的人好友请求,10.3-自动接受通讯录好友请求（轮登）,10.4-自动接受附近的人好友请求（轮登）\",\"select\":\"1\"}]}"
local ret,sel=showUI(ui)

if ret==1 then
		--和功能号对应起来
		sel=sel+0 --转成整数
		
	if sel==0 then
	Auto.intro()
    elseif sel==1 then
	Auto.AddByNear.start()
	 elseif sel==2 then
	Auto.SentByContact.start()---通讯录
	 elseif sel==3 then
	Auto.SentFavByContact.start()
	 elseif sel==4 then
	Auto.SentCardByContact.start()
	elseif sel==5 then
	Auto.SentByContact.multiStart()
	elseif sel==6 then
	Auto.SentFavByContact.multiStart()
	elseif sel==7 then
	Auto.SentCardByContact.multiStart()
	elseif sel==8 then
	Auto.SentByLast.start()--最近联系人
	elseif sel==9 then
	Auto.SentFavByLast.start()
	elseif sel==10 then
	Auto.SentCardByLast.start()
	elseif sel==11 then
	Auto.SentByLast.multiStart()
	elseif sel==12 then
	Auto.SentFavByLast.multiStart()
	elseif sel==13 then
	Auto.SentCardByLast.multiStart()
	elseif sel==14 then--微信群
	Auto.SentByGroup.start()
	elseif sel==15then
	Auto.SentFavByGroup.start()
	elseif sel==16 then
	Auto.SentCardByGroup.start()
	elseif sel==17 then
	Auto.SentByGroup.multiStart()
	elseif sel==18 then
	Auto.SentFavByGroup.multiStart()
	elseif sel==19 then
	Auto.SentCardByGroup.multiStart()
	elseif sel==20then
	Auto.ThrowBox.start()--漂流瓶
	elseif sel==21 then
	Auto.PickBox.start()
	elseif sel==22then
	Auto.ThrowBox.multiStart()
	elseif sel==23 then
	Auto.PickBox.multiStart()
	elseif sel==24 then--朋友圈
	Auto.Like.start()
	elseif sel==25 then
	Auto.LikeAndComment.start()
	elseif sel==26 then
	Auto.AutoMomentsWord.start()
	elseif sel==27 then
	Auto.AutoMomentsImg.start()
	elseif sel==28 then
	Auto.Like.multiStart()
	elseif sel==29 then
	Auto.LikeAndComment.multiStart()
	elseif sel==30 then
	Auto.AutoMomentsWord.multiStart()
	elseif sel==31 then
	Auto.AutoMomentsImg.multiStart()
	elseif sel==32 then--添加
	Auto.AddByContactHasWX.start()
	elseif sel==33 then
	Auto.AddByQQHasWX.start()
	elseif sel==34 then
	Auto.AddByContactList.start()
	elseif sel==35 then
	Auto.AddBySearch.start()
	elseif sel==36 then
	Auto.AddByContactHasWX.multiStart()
	elseif sel==37 then
	Auto.AddByQQHasWX.multiStart()
	elseif sel==38 then
	Auto.AddByContactList.multiStart()
	elseif sel==39 then--群
	Auto.AddByGroup.start()
	elseif sel==40 then
	Auto.AddByMultiGroup.start()
	elseif sel==41 then--检测
	Auto.ZombieCheck.start()
	elseif sel==42 then
	Auto.ZombieCheckDel.start()
	elseif sel==43 then
	Auto.NoMoments.start()
	elseif sel==44 then
	Auto.ZombieCheck.multiStart()
	elseif sel==45 then
	Auto.ZombieCheckDel.multiStart()
	elseif sel==46 then
	Auto.NoMoments.multiStart()
	elseif sel==47 then--接受请求
	Auto.AutoRecieve.start()
	elseif sel==48 then
	Auto.AutoRecieveNearBy.start()
	elseif sel==49 then
	Auto.AutoRecieve.multiStart()
	elseif sel==50 then
	Auto.AutoRecieveNearBy.multiStart()
	
end
	
end
end
---使用说明
Auto.intro=function()
local ui="{\"style\":\"default\",\"views\":[{\"type\":\"Label\",\"text\":\"使用说明\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"1.本脚本运行在触动精灵程序中，触动精灵主目录为 文件系统（越狱）/User/Media/TouchSprite/\\n 2.将 微信助手.luac 放到主目录/lua/下\\n 3.确认以上操作无勿，开始使用微信助手！\\n 10大模块共计50项功能 \\n -安全起见，轮登请不要超过3个号\\n -微信6.1，支持ios7~8.1.1系统\\n  -若运行时出现错误和点击位置不正确，重新启动相应功能即可\\n\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"}]}"
local ret=showUI(ui)
end
---加密解密
Auto.getDevId=function(s)
local dist_no,count,last='',0,0
	for i=1,string.len(s) do
		local cur_byte=string.byte(s,i)+0--得到asiic
		count=count+cur_byte
		if i%4==0 then
			last=string.sub(count,string.len(count),string.len(count))--取末位
			count=0
			dist_no=dist_no..last
		end
	end
	return dist_no
end
Auto.getKey=function(s)
local tb={0,5,6,'T','U','V',7,8,9,'A','D','H','I',1,4,'J','K','L','B','C','M','N','O',2,3,'P','E','F','G','Q','X','Y','Z','R','S','W'}
local pos=1
local dist_no=''
	for i=1,string.len(s) do 
		local cur_num=string.sub(s,i,i)
		if cur_num=='0' or cur_num=='1' then--计算在小组中的位置
			pos=1
			else
			pos=math.floor(cur_num/2)
		end
		dist_no=dist_no..tb[4*(i-1)+pos]--每4个一组值
	end
	return dist_no
end
---使用说明
Auto.check=function()
local no=Auto.getDevId(getDeviceID())
local ui="{\"style\":\"default\",\"config\":\"conf_1.dat\",\"views\":[{\"type\":\"Label\",\"text\":\"云集-微信助手\",\"size\":24,\"align\":\"center\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\"您的机器号：\",\"size\":24,\"align\":\"left\",\"color\":\"0,123,223\"},{\"type\":\"Label\",\"text\":\""
ui=ui..no.."\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"},{\"type\":\"Label\",\"text\":\"输入授权码：\",\"size\":24,\"align\":\"left\",\"color\":\"0,123,223\"},{\"type\":\"Edit\",\"prompt\":\"输入授权码\",\"text\":\"\",\"size\":15,\"align\":\"left\",\"color\":\"255,0,0\"}]}"

local ret,key=showUI(ui)

if ret==1 then
if key==Auto.getKey(no) then
    Auto.InitMenu()
    else
    dialog("授权码错误,请联系软件代理商",3)
	Common.sleepR(3000)
	lua_exit()
end
	end
end
Auto.check()

