local numBurstParts = 50

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	local Vel = data:GetStart()
	
	local emitter = ParticleEmitter( Pos )
	
	local myData = data:GetAngles()
	
	for i=0, numBurstParts do
		local particle = emitter:Add( "effects/blood_core", Pos + (VectorRand() * 10) )
		particle:SetColor( 50, 0, 0 )
		
		particle:SetCollide( true )
		particle:SetBounce( 0.025 )
		
		local velMul = math.Rand(0, 0.2)
		--print(( Vel * velMul ))
		
		particle:SetVelocity( (VectorRand() * 200) + ( Vel * velMul ) + Vector( 0, 0, math.random(-300, 300) ) )
		particle:SetGravity( Vector( 0, 0, -600 ) )
		
		particle:SetDieTime( math.Rand( 4, 6 ) )
		
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		
		particle:SetStartSize( math.Rand( 10.75, 20.75 ) )
		particle:SetEndSize( 10 )
	end
		
	emitter:Finish()
	
	self.RunSim = CurTime() + GetConVar( "gibmod_effecttime" ):GetInt() + 1
end

function EFFECT:Think()		
	return self.RunSim>CurTime()
end

function EFFECT:Render()
end