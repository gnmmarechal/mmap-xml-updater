--This script downloads the latest master branch from ihaveamac/9.6-dbgen-xmls and extracts the files to SDMC:/mmap

--Server variables
xmlzipurl = "https://github.com/ihaveamac/9.6-dbgen-xmls/archive/master.zip"

--Script Variables

--Colour Variables
white = Color.new(255,255,255)
green = Color.new(0,240,32)
red = Color.new(255,0,0)

--Version Variables
major = 1
minor = 0
revision = 0
stage = "Alpha"
verstring = major.."."..minor.."."..revision.." "..stage

--Installation Variables
System.currentDirectory("/")
rootdir = System.currentDirectory()


--Switches
complete = 0
wifion = 0

--Screen
scr = 1

--Basic Functions

function quit()
	System.quit()
end

function clear()

	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.clear(BOTTOM_SCREEN)
end 

function iswifion()
	if (Network.isWifiEnabled()) then
		wifion = 1
	else
		wifion = 0
	end
end

function flip()
	Screen.flip()
	Screen.waitVblankStart()
	oldpad = pad
end

function checkquit()
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) then
		quit()
	
	end
end



--Screens
function mainscr() -- scr = 1
	
end

oldpad = Controls.read()



while true do
	clear()
	pad = Controls.read()
	

	flip()
end