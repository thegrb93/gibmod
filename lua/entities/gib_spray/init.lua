AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()	
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )   
	self:SetSolid( SOLID_VPHYSICS )
	
	self:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
	self:DrawShadow( false )
end

function ENT:Think()	
end