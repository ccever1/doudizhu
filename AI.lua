
QMPlugin={}
function QMPlugin.test(str)
local arr={1,2,3}
table.insert(arr, 4)
for i, v in pairs(arr) do
	str=v
end



 return table.concat(arr,"|")
end

--字符串分割函数
--传入字符串和分隔符，返回分割后的table
function split(str, delimiter)
	if str==nil or str=='' or delimiter==nil then
		return nil
	end

    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end

    return result
end

function searchprint(arr)
	for i, v in pairs(arr) do
		print(i, v)
	end
end

function lianjie(str)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "|")
	--print(#strarr)
	for key, value in ipairs(strarr) do
		print(value)
	end
end

function exists(str,val)
	val=tostring(val)
	if str==nil or str=='' then
		return nil
	end
	res=nil
	strarr=split(str, "|")
	for i, v in pairs(strarr) do
		if(v==val)then
			res=true
			return res
		end
	end
	return res
end

function huojian(str)
	if str==nil or str=='' then
		return nil
	end
	return exists(str,"14") and exists(str,"15")
end

function searchcount(arr)
local newarr={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
for i, v in pairs(arr) do
		v=tonumber(v)
		if(newarr[v]==nil)then
			newarr[v]=1
		else
			newarr[v]=newarr[v]+1
		end
		--print(i, v)
	end
return newarr
end
--[[
	@num数字
]]
function countnum(str,num)
	num=tonumber(num)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "|")
	strarrd=searchcount(strarr)
	return strarrd[num]
end

--[[
	@count数量
]]
function countnumstr(str,count)
	count=tonumber(count)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "|")
	strarrd=searchcount(strarr)
	local res={}
	local res2={}
	local res3={}
for i, v in pairs(strarrd) do


		if(v==count)then
			if(i==1 or i==2)then
				table.insert(res2,i)
			elseif(i==14 or i==15) then	
				table.insert(res3,i)
			else
				table.insert(res,i)
			end
			
		end
end
	local resstrr=""
	if(table.concat(res,"|")~="")then
		resstrr=table.concat(res,"|")
	end

	if(table.concat(res2,"|")~="")then
		resstrr=resstrr.."|"..table.concat(res2,"|")
	end
	
	if(table.concat(res3,"|")~="")then
		resstrr=resstrr.."|"..table.concat(res3,"|")
	end
	resstrr=trim(resstrr)
	--print(resstrr)
	return resstrr
end

function QMPlugin.countnumstrex(str,count,tag)
	if(tag=="1")then
		str=removestrd(str,"1|2|14|15")
	else

	end


	return countnumstr(str,count)
end

function removestr(str,num,count)
	num=tonumber(num)
	count=tonumber(count)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "|")

	local inti=0
		while (inti<count) do
			inti=inti+1

			for i, v in pairs(strarr) do

				v=tonumber(v)
				if(v==num)then
					table.remove(strarr,i)
					--return table.concat(strarr)
					break
				end
			end
		end
	return table.concat(strarr,"|")
end

function removestrd(str,numstr)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "|")
	strarrd=split(numstr,"|")

		for id,vd in pairs(strarrd) do
			num=tonumber(vd)

			for i,v in pairs(strarr) do
				v=tonumber(v)
				if(v==num)then
					table.remove(strarr,i)
					--return table.concat(strarr)
					break
				end
			end
		end
	return table.concat(strarr,"|")
end

function removestrde(str,numstr)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "_")
	strarrd=split(numstr,"_")

		for id,vd in pairs(strarrd) do
			num=tonumber(vd)

			for i,v in pairs(strarr) do
				v=tonumber(v)
				if(v==num)then
					table.remove(strarr,i)
					--return table.concat(strarr)
					break
				end
			end
		end
	return table.concat(strarr,"_")
end

function sz(str,snum)
snum=tonumber(snum)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "|")
	--print(str)
	local res=true
	local i=0
	while i<5 do
		if(exists(str,tostring(snum))==nil)then
			res=nil
			break
		end
		if(snum==13)then
			snum=1
		elseif(snum==2)then
			res=nil
			break
		else
			snum=snum+1
		end
	i=i+1
	end
--print(res,"---------")
	return(res)
end


--[[
指定个数的链接
]]
function szcount(str,snum,count)
snum=tonumber(snum)
count=tonumber(count)
	if str==nil or str=='' then
		return nil
	end
	strarr=split(str, "|")
	--print(str,count,"szcount")
	local res=true
	local i=0
	while i<count do
		if(exists(str,tostring(snum))==nil)then
			res=nil
			break
		end
		if(snum==13)then
			snum=1
		elseif(snum==2)then
			--snum=snum+1
			if(count==1)then
			
				snum=snum+1
			else
			
				res=nil
			break
			
			end
			
			
		else
			snum=snum+1
		end
	i=i+1
	end
--print(res,"---------")
	return(res)
end

--[[
获取一个指定数目的链接
]]
function sz2count(str,count)
count=tonumber(count)
local res=nil
local rstr={}
local ii=3
if(count<4)then
ii=1
end

	for i=ii,13 do
		--print(i)
		local resstr=szcount(str,i,count)
--print(i,count,str,resstr,"sz2coun")
		if(resstr==true)then
			res=true
			for j=0,count-1 do
				if(i+j==14)then
					table.insert(rstr,1)
					else
					table.insert(rstr,i+j)
				end
			end
			break
		end
	end
	--print(table.concat(rstr,"|"))
return table.concat(rstr,"|")
end

--[[
从一串数字中返回一个5连的数字
]]
function sz2(str)
local res=nil
local rstr={}

	for i=3,10 do
		--print(i)
		local resstr=sz(str,i)
--print(str,resstr,"sz2")
		if(resstr==true)then
			res=true
			for j=0,4 do
				if(i+j==14)then
					table.insert(rstr,1)
				else
					table.insert(rstr,i+j)
				end
				
				
			end
			break
		end
	end

return table.concat(rstr,"|")
end



--str=removestrd("3|4|5|6|7|8|9|10|11|12|13|1|3|4|5|6|7|8|9|10|11|12|13|1","3|4|5|6|7")
--print(str,"===============")
function sz3(str)

	r=sz2(str)
--print(str,r,"+++++")
	if(r~="")then
		--print(r)
		str=removestrd(str,r)

		return r.."_"..sz3(str)
	else
		return ""
	end
end

--[[
返回所有指定链接数目的最小链接
]]
function sz3count(str,count)
count=tonumber(count)
	r=sz2count(str,count)
--print(str,r,"+++++")
	if(r~="")then
		--print(r)
		str=removestrd(str,r)

		return r.."_"..sz3count(str,count)
	else
		return ""
	end
end


--[[
fanhuishunzi
]]
function QMPlugin.kz(str)

	local sr=sz3(str)
---print(sr,"------")
	local tbarr={}
	local rs=trim(sr)

	if(rs~="")then


		local arr=split(rs,"_")



		local darr={}

		for i,v in pairs(arr) do
			str=removestrd(str,v)
			table.insert(darr,v)
			--print(i, v)
		end


		for i,v in pairs(darr) do
			local sdstr=nextexists(str,v)
			--print(sdstr)
			--print(str,v,sdstr)
			if(sdstr~="")then

				str=removestrd(str,sdstr)
				table.insert(tbarr,v.."|"..sdstr)
			else
				table.insert(tbarr,v)

			end
		end

		--print(table.concat(darr,"_"))
	end

	local resstrex= table.concat(tbarr,"_")
	if(resstrex~="")then

	--resstrex=table.concat(hp(resstrex),"_")
	resstrex=hp(resstrex)[1]
	end

	--return str,resstrex
	return resstrex
end



function kzex(str)

	local sr=sz3(str)
---print(sr,"------")
	local tbarr={}
	local rs=trim(sr)

	if(rs~="")then


		local arr=split(rs,"_")



		local darr={}

		for i,v in pairs(arr) do
			str=removestrd(str,v)
			table.insert(darr,v)
			--print(i, v)
		end


		for i,v in pairs(darr) do
			local sdstr=nextexists(str,v)
			--print(sdstr)
			--print(str,v,sdstr)
			if(sdstr~="")then

				str=removestrd(str,sdstr)
				table.insert(tbarr,v.."|"..sdstr)
			else
				table.insert(tbarr,v)

			end
		end

		--print(table.concat(darr,"_"))
	end

	local resstrex= table.concat(tbarr,"_")
	if(resstrex~="")then

	resstrex=table.concat(hp(resstrex),"_")

	end
local shuangshunressss=""

	shuangshunressss,resstrex=shuangshuneek(resstrex)

--print("resstrex",resstrex)
	--return str,resstrex
	return resstrex,str,shuangshunressss
end

function shuangshuneek(resstrex)
--print(resstrex)
local tb={}
local tbl={}
local tb2={}
local tb3={}
if(resstrex~="")then
	local resstrexarr=split(resstrex,"_")
	tb3=split(resstrex,"_")
	for i,v in pairs(resstrexarr) do
		if(i==#resstrexarr)then
		break;
		end

		for j=1,#resstrexarr-i do
			local nowtb=resstrexarr[i]
			local nexttb=resstrexarr[j+i]
			if(nowtb==nexttb)then
				--print(i,nowtb,j+i,nexttb)
table.insert(tb2,nowtb)
table.insert(tb2,nexttb)		--
tb3=tbremove(tb3,nowtb)
tb3=tbremove(tb3,nexttb)

				local sd=split(nowtb,"|")
				local sstr=""
				for jj,vv in pairs(sd) do

					for k=1,2 do
						sstr=sstr.."|"..vv
					end
				end
				--print(trim(sstr),"sstr")
				sstr=trim(sstr)
				table.insert(tbl,sstr)
			end
			--print(i,nowtb,j+i,nexttb)
		end






	end
end


--  table.concat(tbl,"_") 双顺
--  table.concat(tb3,"_") 单顺
--print(table.concat(tbl,"_"),table.concat(tb3,"_"))
return table.concat(tbl,"_"),table.concat(tb3,"_")

end

function tbremove(tb,str)
if(tb==nil)then
	return ""
else
	for j=1,#tb do
		if(tb[j]==str)then
			table.remove(tb,j)
			break

		end

	end

end

return tb
end

function kzcountex(str,count)
count=tonumber(count)
--print(str,count)
	local sr=sz3count(str,count)
--print(sr,"sz3count",count)
	local tbarr={}
	local rs=trim(sr)

	if(rs~="")then


		local arr=split(rs,"_")



		local darr={}

		for i,v in pairs(arr) do
			str=removestrd(str,v)
			table.insert(darr,v)
			--print(i, v)
		end
--print(table.concat(darr,"_"))

		for i,v in pairs(darr) do
			local sdstr=nextexists(str,v)
			--print(sdstr)
			--print(str,v,sdstr)
			if(sdstr~="")then
				str=removestrd(str,sdstr)
				table.insert(tbarr,v.."|"..sdstr)
			else
				table.insert(tbarr,v)

			end
		end

		--print(table.concat(darr,"_"))
	end

	local resstrex= table.concat(tbarr,"_")
--print(resstrex)
	if(resstrex~="")then

	resstrex=table.concat(hp(resstrex),"_")

	end


	return resstrex
end


function kzcount(str,count)
count=tonumber(count)
	local sr=sz3count(str,count)
---print(sr,"------")
	local tbarr={}
	local rs=trim(sr)

	if(rs~="")then


		local arr=split(rs,"_")



		local darr={}

		for i,v in pairs(arr) do
			str=removestrd(str,v)
			table.insert(darr,v)
			--print(i, v)
		end


		for i,v in pairs(darr) do
			local sdstr=nextexists(str,v)
			--print(sdstr)
			--print(str,v,sdstr)
			if(sdstr~="")then

				str=removestrd(str,sdstr)
				table.insert(tbarr,v.."|"..sdstr)
			else
				table.insert(tbarr,v)

			end
		end

		--print(table.concat(darr,"_"))
	end

	local resstrex= table.concat(tbarr,"_")
	if(resstrex~="")then

	--resstrex=table.concat(hp(resstrex),"_")
	resstrex=hp(resstrex)[1]
	end

	--return str,resstrex
	return resstrex
end



function trim(str)
    str = string.gsub(str, "^[ \t\n\r_|]+", "")
    return string.gsub(str, "[ \t\n\r_|]+$", "")
end

function nextexists(str,v)
--print(str,v)
local arr=split(v,"|")
--print(arr[#arr])

	function a(str,num)
		num=tonumber(num)
		if(num==2 or num==1)then
		return ""
		end
		local nextnum =num+1
		if(num==13)then
		nextnum=1
		end

		local res=exists(str,nextnum)
		if(res==nil)then
		return ""
		else
			return nextnum.."|"..a(str,nextnum)
		end
	end

	local nnum=tonumber(arr[#arr])


	local restr= trim(a(str,nnum))
	return restr
--[[
--ceshibaocuo
if(restr~="")then
	local restrarr=split(restr,"|")
	table.remove(restrarr,1)
	return table.concat(restrarr,"|")
else
	return ""
end
]]
end



--[[

hepai!!!!!fuza
]]
function hp(str)
	if(str=="")then
	return ""
	end
	local sarr=split(str,"_")

	function a(tb,inum)
	---print("----------")
		local tblen=#tb
		for i=inum,#tb-1 do
			--print(tb[i],i)
			local tbs= split(tb[inum],"|")

			local last=tonumber(tbs[#tbs])
			local first=tonumber(tbs[1])
			local tbsnext= split(tb[i+1],"|")

			local nextfirst=tonumber(tbsnext[1])
			local nextlast=tonumber(tbsnext[#tbsnext])
			--print(inum,last,nextfirst)
			if (last+1==nextfirst and last<13 and last~=2 and last~=1)   then
				tb[inum]=tb[inum].."|"..tb[i+1]
				--print("----")
				table.remove(tb,i+1)
				break
			elseif((nextlast==13 and last==1) or (first==nextlast+1 and  first ~= 3) )then
				--print(tb[inum],nextfirst)
				tb[inum]=tb[i+1].."|"..tb[inum]
				--print("----")
				table.remove(tb,i+1)
				break
			end
			--print(last,nextfirst)
		end
		--print(table.concat(tb,"_"))
--print(tblen,#tb,inum)
		if(tblen~=#tb and #tb-inum>0 )then
		--print("you",tblen,#tb)
			return a(tb,inum)
		elseif(tblen==#tb and #tb-inum>1) then
--print("meiyou")
			return a(tb,inum+1)
		else
--print("jieguo")
			return tb
		end
	end


	local resttb=a(sarr,1)
	--print(table.concat(resttb,"_"))
	return resttb
end


--[[
指定二条三条，链接最小链接数目，返回第一个链接
]]
function QMPlugin.numcountstr(str,num,count)
	rstr=countnumstr(str,num)
	--print(rstr)
	--szr=sz2count(rstr,2)
	--print(szr)
	--z3countnum=sz3count(rstr,2)
	--print(z3countnum)
	kzcountstr=kzcount(rstr,count)
	--print(kzcountstr)
	return kzcountstr
end
function numcountstres(str,num,count)
	rstr=countnumstr(str,num)
	if(rstr==nil)then
		return "",str
	end
	
	if(rstr=="")then
		return rstr,str
	end
	local rstrarr=split(rstr,"|")
	local resstr=""
	for i, v in pairs(rstrarr) do
		resstr=resstr.."_"..v.."|"..v
		str=removestrd(str,v.."|"..v)
	end
	resstr=trim(resstr)
--print(resstr)
if(resstr~="")then
resstr=paixu(resstr)
end


	return resstr,str
end

function numcountstreser(str,num,count)
	rstr=countnumstr(str,num)
	if(rstr==nil or rstr=="")then
	return "",str
	end
	
	
	local rstrarr=split(rstr,"|")
	local resstr=""
	for i, v in pairs(rstrarr) do
		resstr=resstr.."_"..v
		str=removestrd(str,v)
	end
	resstr=trim(resstr)
--print(resstr)
	return resstr,str
end

--是否存在火箭
--return huojianres 火箭字符串
--return str 剩余字符串
function ghuojian(str)
local huojianres=""
if(huojian(str)==true)then
		huojianres="14|15"
		str=removestrd(str,huojianres)
	end
return huojianres,str
end

function gzhadan(str)

	local zhadan =countnumstr(str,4)
	local zhadanres=""-------------------------
	zhadanres=kuozhan(zhadan,4)
if(zhadanres~="")then
	local kzcountarr=split(zhadanres,"_")
		for i, v in pairs(kzcountarr) do
			str=removestrd(str,v)
		end
end


return zhadanres,str
end

function QMPlugin.chaipai(str)

	local chaipaiarr={}

	local huojianres=""------------------------
	huojianres,str=ghuojian(str)
--print(huojianres,"huojianres",str)


	local zhadan =""-----------
	zhadanres,str=gzhadan(str)
--print(zhadanres,"zhadanres",str)

	local sanshun=""-------------------------
	sanshun,str=dnumscounts(str,3,1)
--print(sanshun,"sanshun",str)

local danshun=""---------------------
local shuangshun=""
    danshun,str,shuangshun=kzex(str)
--print(danshun,shuangshun,"danshun,shuangshun",str)

local shuangshunex=""--------------------
shuangshunex,str=dnumscounts(str,2,3)
--print(shuangshunex,"shuangshunex",str)

local duizires=""-----------------

duizires,str=numcountstres(str,2,1)
--print(duizires,"duizires",str)

local danpai=""
danpai=numcountstreser(str,1,1)
--print(danpai,"danpai")

sanshun,duizires,danpai=saneryi(sanshun,duizires,danpai)

return huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai
end

--[[拆牌
@str 需要拆牌的字符串
]]
function chaipaiee(str)

	local chaipaiarr={}

	local huojianres=""------------------------
	--拆火箭
	huojianres,str=ghuojian(str)
--print(huojianres,"huojianres",str)


	local zhadan =""-----------
	--print(str)
	--拆炸弹
	zhadanres,str=gzhadan(str)
--print(zhadanres,"zhadanres",str)
	
	local sanshun=""-------------------------
	--拆三条,一个连接
	sanshun,str=dnumscounts(str,3,1)
--print(sanshun,"sanshun",str)

local danshun=""---------------------
local shuangshun=""
	--拆单顺,拆双顺
    danshun,str,shuangshun=kzex(str)
--print(danshun,shuangshun,"danshun,shuangshun",str)

local shuangshunex=""--------------------
	--拆双顺
shuangshunex,str=dnumscounts(str,2,3)
--print(shuangshunex,"shuangshunex",str)
	
local duizires=""-----------------
	--拆对子
duizires,str=numcountstres(str,2,1)
--print(duizires,"duizires",str)

local danpai=""
	--拆单牌
danpai=numcountstreser(str,1,1)
--print(danpai,"danpai")
--print(sanshun,duizires,danpai)
	--拆三带对子，三带单牌，
sanshun,duizires,danpai=saneryi(sanshun,duizires,danpai)



return huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai
end


function chapaiexc(str,rpnum)
	
	if(rpnum==nil or rpnum=="")then
	
		rpnum=0
	else
		rpnum=tonumber(rpnum)
	end
	
	

	huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai=chaipaiee(str)
	--print(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)
	local danpaiar=split(danpai,"_")
	if(danpaiar~=nil and rpnum>0 and #danpaiar>0)then
		local exists15=0
		if(existsex(danpai,"15")>0)then
			exists15=2
			--print("sssssssss")
		end
		for rpi=0,#danpaiar-exists15-1 do
			--print(danpaiar[#danpaiar-rpi])
			if(danpaiar[1]~="15" and rpnum>0)then
				table.remove(danpaiar,1)
				rpnum=rpnum-1
			end
		end
		danpai=table.concat(danpaiar,"_")
	end
	
	local duiziresar=split(duizires,"_")
	if(duiziresar~=nil and rpnum>1 and #duiziresar>0)then
		local exists2=0
		if(existsex(duizires,"2")>0)then
			exists2=2
		end
		for rpi=0,#duiziresar-exists2-1 do
			if(duiziresar[1]~="2|2" and rpnum>1)then
				table.remove(duiziresar,1)
				rpnum=rpnum-2
			end
		end
		duizires=table.concat(duiziresar,"_")
	end
	
	
	
	--print(table.concat(duiziresar,"_"),rpnum,"danpaiar")
	--print(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)
	
	
	local fuza,qd,jiaoshastr=fuza(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)
	--print(fuza,qd,jiaoshastr)
	--print(jiaoshastr)
	
	--print(jiaoshastr)
	
	local zhadanresis=nil
	if (jiaoshastr~="" and #split(jiaoshastr,"|")==4 and split(jiaoshastr,"|")[1]==split(jiaoshastr,"|")[2] and split(jiaoshastr,"|")[2]==split(jiaoshastr,"|")[3] and split(jiaoshastr,"|")[3]==split(jiaoshastr,"|")[4] )then
		zhadanresis=true
	end
	--print(zhadanresis)
	local jiaosha=nil
	--print(fuza,qd,"fuza")
	if(fuza-qd<2 and jiaoshastr~="" and zhadanresis~=true )then
		jiaosha=true
		--print(fuza-qd,jiaoshastr,"jiaosha")
		
		huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai=chaipaiee(jiaoshastr)
		
	end
	
	--print(tonumber(split(danpai,"_")[1]) , tonumber(split(split(duizires,"_")[1],"|")[1]) ) 
	--print(exists(sanshun,"3"))
	if(sanshun~="" and exists(split(sanshun,"_")[1],"2")~=true)then
		return split(sanshun,"_")[1],"1"
	elseif(danshun~="")then
		return split(danshun,"_")[1],"2"
	elseif(shuangshun~="")then
		return split(shuangshun,"_")[1],"3"
	elseif(shuangshunex~="")then
		return split(shuangshunex,"_")[1],"4"
	elseif(danpai~="" and #split(danpai,"_")>1 and existsex(danpai,"15")>0)then
		return split(danpai,"_")[1],"6"
	elseif(danpai~="" and duizires~="" and split(danpai,"_")[1]~="1" and split(danpai,"_")[1]~="2" and  (tonumber(split(danpai,"_")[1]) < tonumber(split(split(duizires,"_")[1],"|")[1]) or tonumber(split(split(duizires,"_")[1],"|")[1])==1 or tonumber(split(split(duizires,"_")[1],"|")[1])==2  ) )then
		return split(danpai,"_")[1],"6"---------------------
	elseif(duizires~="" and exists(split(duizires,"_")[1],"2")~=true )then
		return split(duizires,"_")[1],"5"
	elseif(danpai~="")then
		return split(danpai,"_")[1],"6"
	elseif(sanshun~="")then
		return split(sanshun,"_")[1],"1"
	elseif(duizires~="")then
		return split(duizires,"_")[1],"5"
	elseif(zhadanres~="")then
		return split(zhadanres,"_")[1],"7"
	elseif(huojianres~="")then
		return split(huojianres,"_")[1],"8"
	else
		return "","0"
	end
	
	
end


function existsex(str,num)
num=tostring(num)
local qdd=0
	if(str=="") then
		return qdd
	end
	local strarr=split(str,"_")
	for i, v in pairs(strarr) do
		if(exists(v,num)==true)then
			qdd=qdd+1
		end
	end
	return qdd
end

function existsex2(str)

local qdd=0
	if(str=="") then
		return qdd
	end
	local strarr=split(str,"_")
	for i, v in pairs(strarr) do
		local s= dnumscounts(v,3,1)
		if(exists(s,1)==true and exists(s,13)==true )then
			qdd=qdd+1
		elseif(exists(s,2)==true)then
			qdd=qdd+1
		end
	end
	return qdd
end

function rb(str)
	if(str=="")then
		return str
	else
		local strar=split(str,"_")
		return table.concat(strar,"|")
	end

end
--[[
@huojianres 火箭
@zhadanres 炸弹
@sanshun 三顺
@danshun 单顺
@shuangshun 双顺
@shuangshunex 双顺
@duizires 对子
@danpai 单牌
return 复杂度,强度,叫杀的字符串 头牌9|10|11|12|13|1
]]
function fuza(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)
local pr=0--复杂度
local qd=0--强度

local res=""

--print(existsex(huojianres,"15"),"qd")
	if(sanshun~="")then
		pr=pr+#split(sanshun,"_")--复杂度加三顺的个数
		if(existsex2(sanshun)>0)then
			qd=qd+existsex2(sanshun)-- 2，13+1  强度+1
			--print("sanshun")
			res=res.."|"..rb(sanshun)
		end
	end
	if(danshun~="")then
		pr=pr+#split(danshun,"_")--复杂度加单顺的个数
		if(existsex(danshun,"1")>0)then
			qd=qd+existsex(danshun,"1")--1 强度+1
			--print("danshun")
			res=res.."|"..rb(danshun)
		end
	end
	if(shuangshun~="")then
		pr=pr+#split(shuangshun,"_")--复杂度加双顺的个数
		if(existsex(shuangshun,"1")>0)then
			qd=qd+existsex(shuangshun,"1")--1 强度+1
			--print("shuangshun")
			res=res.."|"..rb(shuangshun)
		end
		
	end
	if(shuangshunex~="")then
		pr=pr+#split(shuangshunex,"_")--复杂度加双顺的个数
		if(existsex(shuangshunex,"1")>0)then
			qd=qd+existsex(shuangshunex,"1")--1 强度+1
			--print("shuangshunex")
			res=res.."|"..rb(shuangshunex)
		end
	end
	
	if(duizires~="")then
		pr=pr+#split(duizires,"_")--复杂度加对子的个数
		if(existsex(duizires,"2")>0)then
			qd=qd+existsex(duizires,"2")--2 强度+1
			--print("duizires")
			res=res.."|"..rb(duizires)
		end
	end
	--print(res,duizires,"res")
	if(danpai~="")then
		pr=pr+#split(danpai,"_")--复杂度加单牌的个数
		if(existsex(danpai,"15")>0)then
			qd=qd+existsex(danpai,"15")--15 强度+1
			--print("danpai")
			res=res.."|"..rb(danpai)
		end
	end
	if(zhadanres~="")then
		pr=pr+#split(zhadanres,"_")--复杂度加炸弹的个数
		
		qd=qd+#split(zhadanres,"_")--强度加炸弹的个数
		--print("zhadanres")
		res=res.."|"..rb(zhadanres)
	end
	if(huojianres~="")then
		pr=pr+#split(huojianres,"_")--复杂度加火箭的个数
		qd=qd+1--强度加火箭的个数
		--print("huojianres")
		res=res.."|"..rb(huojianres)
	end
	--print(pr,qd,trim(res))
return pr,qd,trim(res)
end


function QMPlugin.chapaiexcd(str,rp)
	local rsd,tpd=chapaiexc(str,rp)
	return rsd.."&"..tpd
end

--[[
@str 自己手牌
@rp 让几张牌
]]
function QMPlugin.ds(str,rp,dsstr)
print(str,rp,dsstr)
	local huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai=chaipaiee(str)
	print(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)
	rpnum=tonumber(rp)
	local danpaiar=split(danpai,"_")
	
	--单牌处理让牌
	if(danpaiar~=nil and rpnum>0 and #danpaiar>0)then
		local exists15=0
		if(existsex(danpai,"15")>0)then
			exists15=2
			--print("sssssssss")
		end
		for rpi=0,#danpaiar-exists15-2 do
			--print(danpaiar[#danpaiar-rpi])
			if(danpaiar[1]~="15" and rpnum>0)then
				table.remove(danpaiar,1)
				rpnum=rpnum-1
			end
		end
		danpai=table.concat(danpaiar,"_")
	end
	
	--对子处理让牌
	local duiziresar=split(duizires,"_")
	if(duiziresar~=nil and rpnum>1 and #duiziresar>0)then
		local exists2=0
		if(existsex(duizires,"2")>0)then
			exists2=2
		end
		for rpi=0,#duiziresar-exists2-2 do
			if(duiziresar[1]~="2|2" and rpnum>1)then
				table.remove(duiziresar,1)
				rpnum=rpnum-2
			end
		end
		duizires=table.concat(duiziresar,"_")
	end
	
	
	
	--print(table.concat(duiziresar,"_"),rpnum,"danpaiar")
	--print(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)
	
	--复杂度,强度,强度高的牌
	local fuza,qd,jiaoshastr=fuza(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)
	
	print(fuza,qd,jiaoshastr,"fuzadu,qiangdu,gaoqiangdudepai")
	
	--print(jiaoshastr)
	local jiaosha=nil
	--print(fuza,qd,"fuza")
	if(fuza-qd<2 and jiaoshastr~="" )then
		jiaosha=true
		--print(fuza-qd,jiaoshastr,"jiaosha")
		
		huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai=chaipaiee(jiaoshastr)
		
	end
	print(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai,"jiaoshastr")
	
	local rsd,tpd=chapaiexc(dsstr,0)
	
	if(tpd=="6" and danpai~="" )then
			
		local dpar=split(danpai,"_")
		
		for i, v in pairs(dpar) do
		local lv=tonumber(v)
		local lrsd=tonumber(rsd)
		
			if(lv==1 or lv==2)then
				lv=tonumber(lv)+13
			elseif(lv==14 or lv==15)then
				lv=tonumber(lv)+2
			end
			
			if(lrsd==1 or lrsd==2)then
				lrsd=tonumber(lrsd)+13
			elseif(lrsd==14 or lrsd==15)then
				lrsd=tonumber(lrsd)+2
			end
			
			if(tonumber(lv)>tonumber(lrsd))then
				print(v.."&"..tpd,rsd)
				return v.."&"..tpd
			end
				
		end
		
		if(tpd=="6"  and duizires~=""  )then
	
			local dpar=split(duizires,"_")
			--print(table.concat(dpar,"_"))
			for i, v in pairs(dpar) do
			
				local lv=tonumber(split(v,"|")[1])
				local lrsd=tonumber(split(rsd,"|")[1])
				
				if(lv==1 or lv==2)then
					lv=tonumber(lv)+13
				elseif(lv==14 or lv==15)then
					lv=tonumber(lv)+2
				end
				
				if(lrsd==1 or lrsd==2)then
					lrsd=tonumber(lrsd)+13
				elseif(lrsd==14 or lrsd==15)then
					lrsd=tonumber(lrsd)+2
				end
				
				if(tonumber(lv)>tonumber(lrsd))then
					print(tonumber(split(v,"|")[1]).."&"..tpd,rsd)
					return tonumber(split(v,"|")[1]).."&"..tpd
				end
			end
			return "&"..tpd
			
		end
		
		return "&"..tpd
	elseif(tpd=="6" and danpai=="" and duizires~=""  )then
	
		local dpar=split(duizires,"_")
		--print(table.concat(dpar,"_"))
		for i, v in pairs(dpar) do
		
			local lv=tonumber(split(v,"|")[1])
			local lrsd=tonumber(split(rsd,"|")[1])
			
			if(lv==1 or lv==2)then
				lv=tonumber(lv)+13
			elseif(lv==14 or lv==15)then
				lv=tonumber(lv)+2
			end
			
			if(lrsd==1 or lrsd==2)then
				lrsd=tonumber(lrsd)+13
			elseif(lrsd==14 or lrsd==15)then
				lrsd=tonumber(lrsd)+2
			end
			
			if(tonumber(lv)>tonumber(lrsd))then
				print(tonumber(split(v,"|")[1]).."&"..tpd,rsd)
				return tonumber(split(v,"|")[1]).."&"..tpd
			end
		end
		
		
		
		return "&"..tpd
	
	elseif(tpd=="5" and duizires~="" )then
	
		local dpar=split(duizires,"_")
		--print(table.concat(dpar,"_"))
		for i, v in pairs(dpar) do
		
			local lv=tonumber(split(v,"|")[1])
			local lrsd=tonumber(split(rsd,"|")[1])
			
			if(lv==1 or lv==2)then
				lv=tonumber(lv)+13
			elseif(lv==14 or lv==15)then
				lv=tonumber(lv)+2
			end
			
			if(lrsd==1 or lrsd==2)then
				lrsd=tonumber(lrsd)+13
			elseif(lrsd==14 or lrsd==15)then
				lrsd=tonumber(lrsd)+2
			end
			
			if(tonumber(lv)>tonumber(lrsd))then
				print(v.."&"..tpd,rsd)
				return v.."&"..tpd
			end
		end
		
		
		
		return "&"..tpd
	else
		return "&0"
	end
end

function saneryi(sanshun,duizires,danpai)
local sanshunar=split(sanshun,"_")

if(sanshun=="")then
	return sanshun,duizires,danpai
end

local duizier=0

if(exists(duizires,"2")==true)then
duizier=duizier+1
end


local danpaier=0

if(exists(danpai,"2")==true)then
danpaier=danpaier+1
end

--print(danpaier,"duizier")

--duizires=removestrd(duizires,"2|2")


	for i, v in pairs(sanshunar) do
		local vvar=split(v,"|")
		local duiziresar=split(duizires,"_")
		local danpaiar=split(danpai,"_")
		--print(#duiziresar-duizier)
		--print(v,duizires,#vvar,#duiziresar)
		if(duiziresar ~= nil and #vvar/3>0 and (#duiziresar-duizier)>=#vvar/3)then
			--local ds=removetable(duiziresar,duiziresar[i])
			
			--print(ds)
			local strij=""
			local sanshunress=""
			for ij=1,#vvar/3 do
				strij=strij.."_"..duiziresar[ij]
				sanshunress=sanshunress.."|"..duiziresar[ij]
				
				duizires=removestrde(duizires,duiziresar[ij])
				duizires=trim(duizires)
				
			end
			strij=trim(strij)
			sanshunress=trim(sanshunress)
			--print(strij,removestrd(duizires,strij))
			
			sanshunar[i]=sanshunar[i].."|"..sanshunress
			--print(sanshunress,v,strij)
		elseif(danpaiar ~= nil and #vvar/3>0 and (#danpaiar-danpaier)>=#vvar/3)then
			local strij=""
			local sanshunress=""
			for ij=1,#vvar/3 do
				strij=strij.."_"..danpaiar[ij]
				sanshunress=sanshunress.."|"..danpaiar[ij]
				
				--print(danpai)
				danpai=removestrde(danpai,danpaiar[ij])
				--print(danpai)
				danpai=trim(danpai)
				
			end
			strij=trim(strij)
			sanshunress=trim(sanshunress)
			--print(strij,removestrd(duizires,strij))
			
			sanshunar[i]=sanshunar[i].."|"..sanshunress
			
		else
			--s
		end
		
		
	end
	
	
	--print(table.concat(sanshunar,"_"),duizires,danpai)
	return table.concat(sanshunar,"_"),duizires,danpai
end

function removetable(tb,restr)
	for i, v in pairs(tb) do
		if(v==restr)then
			
			table.remove(tb,i)
			--print(tb,i,"sssssssssssss")
			return table.concat(tb,"_")
		
		end
	end
	
	return table.concat(tb,"_")
end



--[[
@nums三条二条一条
@count一个连接两个连接三个连接
]]
function dnumscounts(str,nums,count)
nums=tonumber(nums)
count=tonumber(count)
local rstr=""
local kzcountstr=""
local sanshun=""


--print(str,nums)
rstr=countnumstr(str,nums)
--print(rstr,count)
	kzcountstr=kzcountex(rstr,count)
--print (rstr,kzcountstr,count,"kzcountstr")
	if(kzcountstr~="")then

		kzcountarr=split(kzcountstr,"_")
		for i, v in pairs(kzcountarr) do
			str=removestrd(str,kuozhan(v,nums,"|"))
			sanshun=sanshun.."_"..kuozhan(v,nums,"|")
		end
		sanshun=trim(sanshun)
	end
--print(sanshun,str,"dnumscounts")
if(sanshun~="")then
	sanshun=paixu(sanshun)
end
--print(sanshun,str,"dnumscounts+++++")
return sanshun,str
end


function paixu(str)

strarr=split(str, "_")


local res={}
local res2={}
local res3={}

	for i, v in pairs(strarr) do
	local num=tonumber(split(v,"|")[1])
		if(num==1 or num==2)then
			table.insert(res2,v)
		elseif(num==14 or num==15) then	
			table.insert(res3,v)
		else
			table.insert(res,v)
		end
	end

local resstrr=""
	if(table.concat(res,"|")~="")then
		resstrr=table.concat(res,"_")
	end

	if(table.concat(res2,"|")~="")then
		resstrr=resstrr.."_"..table.concat(res2,"_")
	end
	
	if(table.concat(res3,"|")~="")then
		resstrr=resstrr.."_"..table.concat(res3,"_")
	end
	resstrr=trim(resstrr)
	--print(resstrr)
	return resstrr
end

function kuozhan(zhadan,count,tag)
local zhadanres=""
count=tonumber(count)
if(zhadan ~= "" and zhadan~=nil )then
		local tbzhadan=split(zhadan,"|")
		--print(zhadan,"d")
		for i, v in pairs(tbzhadan) do
			--print(tbzhadan[i])
			str=removestr(str,tbzhadan[i],count)
			for j=0,count-1 do
				if(j==0)then
					if(i==1)then
						zhadanres=tostring(tbzhadan[i])
					else
						if(tag~=nil)then
							zhadanres=zhadanres..tag..tostring(tbzhadan[i])
						else
							zhadanres=zhadanres.."_"..tostring(tbzhadan[i])
						end


					end

				else
					zhadanres=zhadanres.."|"..tostring(tbzhadan[i])
				end
			end
		end
	end
return zhadanres
end

--lianjie("1|1|1|2|3|3|4|4|4|5|8|9|9|10|10|11|12|12|12|13")
--r=exists("1|1|1|2|3|3|4|4|4|5|8|9|9|10|10|11|12|12|12|13","14")
--r=huojian("1|1|1|2|3|3|4|4|4|5|8|9|9|10|10|11|12|12|14|15")
--r=countnum("1|1|1|2|3|3|4|4|4|5|8|9|9|10|10|11|12|12|14|15","2")

--r=removestr("1|1|1|2|3|3|4|4|4|5|8|9|9|10|10|11|12|12|14|15","1","3")
--r=removestrd("1|1|1|2|3|3|4|4|4|5|8|9|9|10|10|11|12|13|13|15","1|1|3|4|4|4|4|4")
--r=sz("1|1|1|2|3|3|4|4|5|6|8|9|9|10|10|11|12|13|15","10")
--local str="3|4|5|6|7|8|9|10|11|12|3|4|5|6|7|8|9|10|11|12|13|13|1|1|2|3|4|5|6|7|8"
--[[
r=sz2("1|1|1|2|3|3|4|4|4|5|8|9|9|10|10|11|12|12|14|15")
print(r)

--sr=sz3(str)
--sr=QMPlugin.kz("3|4|5|6|7|8|9|10|11|12|3|4|5|6|7|8|9|10|11|12|13|13|1|1|2|3|4|5|6|7|8")
sr=QMPlugin.kz("3|4|5|6|7|8|9|10|11|12|13|1|3|4|5|6|7|8|9|10|11|12|13|1|2")
print(sr)
--print(sd)
]]

--[[
str="1|1|2|2|3|3|12|12|13|13|14|14|14|15"
resstr=QMPlugin.numcountstr(str,2,3)
]]
--[[
str="1|1|2|2|2|3|3|3|12|12|12|13|13|13|14|14|14|15"
resstr=QMPlugin.numcountstr(str,3,2)
]]


--resstr=QMPlugin.numcountstr("2|2|2|5|5|6|6|7|8",1,1)


--print(resstr)
--r=QMPlugin.countnumstrex("15|2|1|11|10|9|6|5","1","1")
--print(r)



--QMPlugin.chaipai("5|5|5|6|6|6|7|7|7|8|8|8|9|9|9|10|10|10|11|11|11|12|12|12|13|13|13|1|1|1|2|2|2|3|3|3|4|4|4|15")
--QMPlugin.chaipai("1|1|1|2|2|2")
--QMPlugin.chaipai("1|1|1|13|13|13")
--print(sz3count("1|5|6|13",1))

--QMPlugin.chaipai("12|13|14|15")
--QMPlugin.chaipai("3|3|3|3|4|4|4|4|8|8|8|12|13|14|15")
--QMPlugin.chaipai("3|4|5|6|7|8|9|10|11|12|3|4|5|6|7|8|9|10|11|12|13|13|1|1|2|3|4|5|6|7|8")

--QMPlugin.chaipai("3|4|5|6|7|9|10|11|12|9|10|11|12|14")
--QMPlugin.chaipai("1|1|2|2|3|3")
--QMPlugin.chaipai("2|2|3|3|4|4|6|6|7|7|8|8")
--QMPlugin.chaipai("3|4|5|6|7|3|4|5|6|7|8|9|10|8|9|10")
--str="3|4|3|4|5|8|14|1|1|2|2|13|13"

--str="3|3|3|4|4|4|7|8|9|9|10|10|11|11|11|12|12|12|13|6|6"
--str="3|3|3|4|4|4|7|8|9|9|10|10|11|11|11|12|12|12|13|5|5"
--str="3|3|3|4|4|4|10|10|11|11|11|12|12|12|13"---????


--str="2|2|3|3|3|4|1|5|5|13|14|15"
--str="1|13|12|11|10"
--str="2|2|2|3|3|3"
--str="2|2|3|3|4|4"
--str="1|2|3|4|5|13|12|11|10"
--str="1|2|3|4|5|13|12|11|10|1|2|3|4|5|13|12|11|10"
--str="1|2|3|4|5|13|12|11|10|1|2|3|4|5|13|12|11|10|1|2|3|4|5|13|12|11|10"
--huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai=chaipaiee(str)



--print(huojianres,zhadanres,sanshun,danshun,shuangshun,shuangshunex,duizires,danpai)

--str="2|2|3|3|3|4|1|5|5|13|14|15|4|4|2"
--str="2|13|13|11|11|10|10|10|10|9|7|7|6|5|5"
--str="13|13|11|9|9|8|8|6|6"
--str="2|2|2|1|13|13|12|11|11|9|9|8|8|7|6"

--local dp,types=QMPlugin.chapaiexcd(str)
--print(str,"dddddddddd")
--local dp,types=QMPlugin.chapaiexcd(str)
--print(dp,types)




--sanshun,str=dnumscounts(str,3,1)
--print(sanshun,str)
--当前脚本第145行：str1111:15|14|2|2|1|1|13|13|11|6|5|5

--str="2|3|3|3|4|14|15|6|7|8|10|13|8"
--str="15|14|2|2|1|1"
--str="2|2|2"
--当前脚本第151行：str1111:13|12|12|10|6 brint:4
--str="15|13|12|12|11|11|10|6"
--str="3|3|3|2|2"
--r=QMPlugin.chapaiexcd(str,0)
--print(r)



--当前脚本第125行：duishoupaires:13|13 shoupaires:2|2|13|12|11|11|9|8|8|7|7|6|6 brint:3
--当前脚本第125行：duishoupaires:5 shoupaires:2|1|1|13|12|12|11|10|9|8|8|7|6|6|5|5|14 brint:4
--当前脚本第125行：duishoupaires:9|9 shoupaires:2|2|8|15 brint:0
--当前脚本第134行：duishoupaires:13 shoupaires:2|2|1|13|12|12|11|10|10|9|9|8|7|6|6|5|14 brint:4
--当前脚本第134行：duishoupaires:13 shoupaires:2|1|1|13 brint:3
--当前脚本第134行：duishoupaires:1 shoupaires:2|1|1|13 brint:3
--当前脚本第134行：duishoupaires:11 shoupaires:2|2|1|1|13|13|11|11|8|6|5 brint:3
--当前脚本第134行：duishoupaires:7 shoupaires:2|1|1|13|12|11|10|9|8|8|8|7|7|7|5|5 brint:3

str="2|1|1|13|12|11|10|9|8|8|8|7|7|7|5|5"
dsstr="7"
rp="3"
print(QMPlugin.ds(str,rp,dsstr))


--print(QMPlugin.chapaiexcd(str,0))


