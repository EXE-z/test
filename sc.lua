game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)

local equipped = false
local equippedName = ""
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, isTyping)
	
	if isTyping then return end
	
	local lplr = game.Players.LocalPlayer
	local char = lplr.Character
	
	for i, item in pairs(script.Parent.Hotbar:GetChildren()) do
		
		if item:IsA("TextButton") then
		
			if input.KeyCode == Enum.KeyCode[item.Name]  then
				
				if not char:FindFirstChildOfClass("Tool") then
				
					for i, tools in pairs(lplr.Backpack:GetChildren()) do
						
						if item.Text == tools.Name then
							
							if not equipped then
								
								equipped = true
								
								equippedName = item.Name
								
								TS:Create(item, TweenInfo.new(0.2), {Size = UDim2.new(0,203,0,19)}):Play()
								
								char.Humanoid:EquipTool(lplr.Backpack[item.Text])
								
							end
							
						end
						
					end
					
				else
					
					if equipped then
						
						equipped = false
						
						equippedName = ""
						
						TS:Create(item, TweenInfo.new(0.2), {Size = UDim2.new(0,200,0,17)}):Play()
						
						char.Humanoid:UnequipTools()
						
					end
					
				end
				
			end
			
		end
		
	end
	
end)
