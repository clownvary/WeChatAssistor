
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


