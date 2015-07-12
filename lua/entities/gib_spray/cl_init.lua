include( "shared.lua" )

function ENT:Initialize()
end

function ENT:Think()	
	self.Delay = self.Delay or 0
	if ( self.Delay > CurTime() ) then return end
	self.Delay = CurTime() + 0.05
	
	if ( self.BoneIndex == nil or !IsValid( self.Parent ) ) then
		self.Parent = self.Entity:GetNWEntity( "parent" )
		self.BoneIndex = self.Entity:GetNWInt( "boneid" )
		
		if ( IsValid( self.Parent ) ) then
			self.PhysBone = self.Parent:GetPhysicsObjectNum( self.BoneIndex )
		end
		return
	end
	
	local scale = 0.5
	local angle = self.PhysBone:GetAngles():Forward()

	local effectdata = EffectData()
		effectdata:SetOrigin( self.PhysBone:GetPos() )
		effectdata:SetNormal( angle * 0.7 )
		effectdata:SetMagnitude( 10 )
		effectdata:SetScale( 5 )
		effectdata:SetColor( 0 )
		effectdata:SetFlags( 3 )
	util.Effect( "bloodspray", effectdata, true, true )
end