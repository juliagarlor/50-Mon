EntityIdleState = Class{__includes = EntityBaseState}

function EntityIdleState:init(entity)
self.entity = entity
self.entity:changeAnimation('idle-'.. tostring(self.entity.direction))
end