-- BRS_CityBanner_Otherworldly_Nexus
-- Author: Sanakan
-- DateCreated: 1/18/2024 6:20:12 PM
--------------------------------------------------------------

local Original_CityBannerCreateEncampmentBanner = CityBanner.CreateEncampmentBanner;

function CityBanner:CreateEncampmentBanner()
    Original_CityBannerCreateEncampmentBanner(self);

    local pDistrict = self:GetDistrict();
    if pDistrict ~= nil then
        local kDistrictDef = GameInfo.Districts[pDistrict:GetType()];
        if kDistrictDef ~= nil and kDistrictDef.DistrictType == "DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS" then
            self.m_Instance.EncampmentFontIcon:SetText("[ICON_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS]")
        end
    end
end