
--  Author: eeea
-- Edit for Repo : 21:29, 15/10/2024
--  Commands:
--      - `enableMode_boneCheck`: Activates bone checking mode to see lines drawn between character bones.
--      - `enableMode_boneCheck-Precision`: Activates bone checking mode with precision.
--  Note:
--      - Ensure the required character models are pre-loaded.
--      - Coordinates and bone indices are specific to the models used.
--  License: MIT License

newPolice = {}

newPolice.GetColumnInTable = function(searchKey)
    for columnIndex = 1, 2 do
        for key, value in pairs(tableE[columnIndex]) do
            if key == searchKey then
                return columnIndex  end
        end
    end return nil
end

newPolice.CrimeSceneHasGenerated = true

newPolice.BoneOfParam = {
    { ['BONETAG_L_CLAVICLE'] = 64729, ['BONETAG_L_UPPERARM'] = 45509, ['BONETAG_L_FOREARM'] = 61163, ['BONETAG_L_HAND'] = 18905, ['BONETAG_L_FINGER0'] = 26610, ['BONETAG_L_FINGER01'] = 4089, ['BONETAG_L_FINGER02'] = 4090, ['BONETAG_L_FINGER1'] = 26611, ['BONETAG_L_FINGER11'] = 4169, ['BONETAG_L_FINGER12'] = 4170, ['BONETAG_L_FINGER2'] = 26612, ['BONETAG_L_FINGER21'] = 4185, ['BONETAG_L_FINGER22'] = 4186, ['BONETAG_L_FINGER3'] = 26613, ['BONETAG_L_FINGER31'] = 4137, ['BONETAG_L_FINGER32'] = 4138, ['BONETAG_L_FINGER4'] = 26614, ['BONETAG_L_FINGER41'] = 4153, ['BONETAG_L_FINGER42'] = 4154, ['BONETAG_L_PH_HAND'] = 60309 },
    { ['BONETAG_R_CLAVICLE'] = 10706, ['BONETAG_R_UPPERARM'] = 40269, ['BONETAG_R_FOREARM'] = 28252, ['BONETAG_R_HAND'] = 57005, ['BONETAG_R_FINGER0'] = 58866, ['BONETAG_R_FINGER01'] = 64016, ['BONETAG_R_FINGER02'] = 64017, ['BONETAG_R_FINGER1'] = 58867, ['BONETAG_R_FINGER11'] = 64096, ['BONETAG_R_FINGER12'] = 64097, ['BONETAG_R_FINGER2'] = 58868, ['BONETAG_R_FINGER21'] = 64112, ['BONETAG_R_FINGER22'] = 64113, ['BONETAG_R_FINGER3'] = 58869, ['BONETAG_R_FINGER31'] = 64064, ['BONETAG_R_FINGER32'] = 64065, ['BONETAG_R_FINGER4'] = 58870, ['BONETAG_R_FINGER41'] = 64080, ['BONETAG_R_FINGER42'] = 64081, ['BONETAG_R_PH_HAND'] = 28422 },
    { ['BONETAG_SPINE_ROOT'] = 57597, ['BONETAG_SPINE'] = 23553, ['BONETAG_SPINE1'] = 24816, ['BONETAG_SPINE2'] = 24817, ['BONETAG_SPINE3'] = 24818 },
    { ['BONETAG_PELVIS'] = 11816, ['BONETAG_L_THIGH'] = 58271, ['BONETAG_L_CALF'] = 63931, ['BONETAG_L_FOOT'] = 14201, ['BONETAG_L_PH_FOOT'] = 57717 },
    { ['BONETAG_PELVIS'] = 11816, ['BONETAG_R_THIGH'] = 51826, ['BONETAG_R_CALF'] = 36864, ['BONETAG_R_FOOT'] = 52301, ['BONETAG_R_PH_FOOT'] = 24806 },
    { ['BONETAG_NECK'] = 39317, ['BONETAG_HEAD'] = 31086 }
}

newPolice.boneId_Touch = false

newPolice.lineHasNeedparam = {
    ["colR"] = 0.0,
    ["colG"] = 0.0,
    ["colB"] = 0.0,
    ["colA"] = 0.0,

    ["colAll"] = 238,
    ["colNil"] = 0.0,
}

newPolice._3d = "not defined"

newPolice.Trace = function(s) 
    Citizen.Trace(s) end

newPolice.pedIndex = function(s)
    idPed = GetPlayerPed(-1)
    if idPed and idPed ~= -1 then
        return idPed end
end

newPolice.GetPedLastDamageBoneIndex = function(s)
    return GetPedLastDamageBone(s) end

newPolice.GetLastWeaponImpactCoords = function(s)
    return GetPedLastWeaponImpactCoord(s) end

newPolice.GetAllBoneIndex = function(ped, precision)
    local boneIndex, lastDamageValue = newPolice.GetPedLastDamageBoneIndex(ped)
        if precision == 0.03 then 
            if lastDamageValue then
                newPolice.Trace("BoneIndexGet : " .. lastDamageValue)
        return lastDamageValue end
    end return nil
end

newPolice.GetAllParamBullet = function()
    local impactCoords, pedWeaponCoords = newPolice.GetLastWeaponImpactCoords(newPolice.pedIndex())
    if impactCoords and pedWeaponCoords then
        newPolice.Trace("paramBullOne[Coords] : " .. tostring(pedWeaponCoords)) end
    return pedWeaponCoords
end

newPolice.add3InformationIndex = function()
    local paramBullCoords
    repeat Wait(0)
        paramBullCoords = newPolice.GetAllparamBull()
    until paramBullCoords.z ~= 0.0

    while paramBullCoords.z ~= 0.0 do Wait(0)
        if paramBullCoords.x ~= 0.0 then
            newPolice.Trace("paramBullTwo[3D Coords] : " .. paramBullCoords.z)
        DrawText3D(paramBullCoords.x, paramBullCoords.y, paramBullCoords.z, newPolice._3d .. " index", {r = 255, g = 255, b = 255}) end
    end
end

newPolice.GetAllParamBone = function(pedToTest)
    local firstIndexValue, secondIndexValue = newPolice.GetPedLastDamageBoneIndex(pedToTest)
    local coordsBoneItem
    coordsBoneItem = GetPedBoneCoords(pedToTest, secondIndexValue, 0, 0, 0)
        while coordsBoneItem.z ~= 0.0 do Wait(0)
            coordsBoneItem = GetPedBoneCoords(pedToTest, secondIndexValue, 0, 0, 0)
    DrawText3D(coordsBoneItem.x, coordsBoneItem.y, coordsBoneItem.z, newPolice._3d .. " index2", {r = 255, g = 255, b = 255})  end
end

newPolice.returnWorldPositionBone = function(s, s_)
    return GetWorldPositionOfEntityBone(s, GetEntityBoneIndexByName(s, s_)) end

newPolice.GetBoneIndexWithLine_wPrecision = function(s)
    return s end

newPolice.GetBoneIndexWithLine = function(boneArray, playerPed)
    while newPolice_CoordsOfBone_Touch == 0.0 do Wait(0) end
        for boneIndex = 1, 6 do
            if boneArray[boneIndex] then
                for boneKey, boneValue in pairs(boneArray[boneIndex]) do
                    newPolice.indexBone = boneKey
                    
                    local currentBoneIndex = newPolice.GetAllBoneIndex(playerPed, 0.03)
                    if currentBoneIndex == boneValue then
                        local newValueCompare = boneKey
                        local newValueForBloodFlow = boneValue

                        newPolice.GetBoneIndexWithLineAfterFirst(boneIndex)
                return newValueCompare, newValueForBloodFlow end
            end
        else
            newPolice.Trace("w/Line_initial: boneArray[" .. boneIndex .. "] is nil") end
        end 
    newPolice.Trace("w/Line_initial: IndexBone not found")
end

newPolice.GetBoneIndexWithLineAfterFirst = function(boneIndex)
    while newPolice_CoordsOfBone_Touch ~= 0.0 do  Wait(0)
        for boneKey, boneValue in pairs(newPolice.BoneOfParam[boneIndex]) do
            newPoliceindexBone_Old = boneKey
            if newPolice.GetAllBoneIndex(pedToTest, 0.03) == boneValue then
                newValueCompare_Old = boneKey  end
            
            local boneId_X, boneId_Y, boneId_Z = table.unpack(newPolice.returnWorldPositionBone(pedToTest, boneKey))
            local boneTags = { 'BONETAG_L_PH_HAND', 'BONETAG_R_PH_HAND', 'BONETAG_SPINE3', 'BONETAG_L_PH_FOOT', 'BONETAG_R_PH_FOOT', 'BONETAG_HEAD' }
            
            if boneIndex >= 1 and boneIndex <= #boneTags then
                newPolice_CoordsOfBone_Touch = newPolice.returnWorldPositionBone(pedToTest, boneTags[boneIndex])  end

            if newPoliceindexBone_Old == newValueCompare_Old and newPolice.GetBoneIndexWithLine_wPrecision(newPolice.boneId_Touch) then
                Citizen.InvokeNative(0x6B7256074AE34680, boneId_X, boneId_Y, boneId_Z,
                    newPolice_CoordsOfBone_Touch.x, newPolice_CoordsOfBone_Touch.y, newPolice_CoordsOfBone_Touch.z,
                    newPolice.lineHasNeedparam["colAll"], newPolice.lineHasNeedparam["colNil"],
                    newPolice.lineHasNeedparam["colNil"], newPolice.lineHasNeedparam["colAll"])
            else
                Citizen.InvokeNative(0x6B7256074AE34680, boneId_X, boneId_Y, boneId_Z,
                    newPolice_CoordsOfBone_Touch.x, newPolice_CoordsOfBone_Touch.y, newPolice_CoordsOfBone_Touch.z,
                    newPolice.lineHasNeedparam["colAll"], newPolice.lineHasNeedparam["colAll"],
                    newPolice.lineHasNeedparam["colAll"], newPolice.lineHasNeedparam["colAll"])
                end
            end
        end
    newPolice.Trace("w/Line_initial: redLine")
end

CreateThread(function()
    local x1,y1,z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
        RequestModel("s_m_y_pestcont_01")
        if pedToTest == nil then
    pedToTest = CreatePed(30, "s_m_y_pestcont_01", x1,y1,z1, 10.0, 1, 1) end
end)

RegisterCommand("enableMode_boneCheck", function()
    SetEntityAlpha(pedToTest, 51, false)
     newPolice.GetBoneIndexWithLine(newPolice.BoneOfParam, pedToTest) end)

RegisterCommand("enableMode_boneCheck-Precision", function()
    newPolice.boneId_Touch = 1 end)
