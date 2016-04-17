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

function nextscr(newscr)
	scr = newscr
	if newscr == -1 then
		quit()
	end
end

function waitscri(newscr,key)
	if Controls.check(pad, key) and NOT Controls.check(oldpad, key) then
		nextscr(newscr)
	end
end


--Screens
function head()
		Screen.debugPrint(0,0,"MMAP XML Updater by gnmmarechal", white, TOP_SCREEN)
		Screen.debugPrint(0,20,"===============================", red, TOP_SCREEN)
end

function mainscr() -- scr = 1
	head()
	Screen.debugPrint(0,60,"A: Update", white, TOP_SCREEN)
	Screen.debugPrint(0,80,"B: Exit", white, TOP_SCREEN)
	waitscri(2,KEY_A)
	waitscri(-1,KEY_B)
end

function install()
	head()
	if wifion == 1 then
	
	else
	 scr = 0
	end
end

function wifierr() -- scr = 0
	head()
	Screen.debugPrint(0,60,"There is no internet connection.", red, TOP_SCREEN)
	waitscri(-1,KEY_B)
	waitscri(1,KEY_A)
end

oldpad = Controls.read()



while true do
	clear()
	pad = Controls.read()
	if scr == 1 then
		mainscr()
	end
	if scr == 2 then
		install()
	end

	flip()
end
