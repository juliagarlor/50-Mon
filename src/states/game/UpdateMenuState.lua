UpdateMenuState = Class{__includes = BaseState}


function UpdateMenuState:init(hpincrease, attackincrease, defenseincrease, speedincrease, finalhp, finalattack, finaldefense, finalspeed)
self.updateMenu = Menu{
	x = VIRTUAL_WIDTH - 128,
	y = VIRTUAL_HEIGHT - 192,
	width = 128,
	height = 128,
	items = {
		{
			text = 'Hp: +'..tostring(hpincrease)..'  '..tostring(finalhp)
		},
		{
			text = 'At: +'..tostring(attackincrease)..'  '..tostring(finalattack)
		},
		{	text = 'Def: +'..tostring(defenseincrease)..'  '..tostring(finaldefense)
		},
		{	text = 'Sp: +'..tostring(speedincrease)..'  '..tostring(finalspeed)
		}
	},
	selection = false
}
end

function UpdateMenuState:update(dt)
end

function UpdateMenuState:render()
self.updateMenu:render()
end