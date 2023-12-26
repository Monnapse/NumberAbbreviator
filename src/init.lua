--[[
    Made by Monnapse

    Number Abbreviator
    
    @0.1.0
--]]

local numbers = {}

type NameType = {
    Name: string,
    Value: string
}

local function NewNameType(Name: string,Value: string)
    local NewType: NameType = {
        Name = Name,
        Value = Value
    }
    return NewType
end

numbers.NameType = {
    Abbreviation = NewNameType("Abbreviation","Short Name"),
    Name = NewNameType("Name", "Long Name")
}

numbers.Notations = {
    [1] = {
        Name = "Thousand",
        Abbreviation = "K"
    },
    [2] = {
        Name = "Million",
        Abbreviation = "M"
    },
    [3] = {
        Name = "Billion",
        Abbreviation = "B"
    },
    [4] = {
        Name = "Trillion",
        Abbreviation = "T"
    },
    [5] = {
        Name = "Quadrillion",
        Abbreviation = "Qa"
    },
    [6] = {
        Name = "Quintillion",
        Abbreviation = "Qi"
    },
    [7] = {
        Name = "Sextillion",
        Abbreviation = "Sx"
    },
    [8] = {
        Name = "Septillion",
        Abbreviation = "Sp"
    },
    [9] = {
        Name = "Octillion",
        Abbreviation = "Oc"
    },
    [10] = {
        Name = "Nonillion",
        Abbreviation = "No"
    },
    [11] = {
        Name = "Decillion",
        Abbreviation = "Dc"
    },
    [12] = {
        Name = "Undecillion",
        Abbreviation = "Ud"
    },
    [13] = {
        Name = "Duodecillion",
        Abbreviation = "Dd"
    },
    [14] = {
        Name = "Tredecillion",
        Abbreviation = "Td"
    },
    [15] = {
        Name = "Quattuordecillion",
        Abbreviation = "Qad"
    },
    [16] = {
        Name = "Quindecillion",
        Abbreviation = "Qid"
    },
    [17] = {
        Name = "Sexdecillion",
        Abbreviation = "Sxd"
    },
    [18] = {
        Name = "Septendecillion",
        Abbreviation = "Spd"
    },
    [19] = {
        Name = "Octodecillion",
        Abbreviation = "Ocd"
    },
    [20] = {
        Name = "Novemdecillion",
        Abbreviation = "Nod"
    },
    [21] = {
        Name = "vigintillion",
        Abbreviation = "Vg"
    },
    [22] = {
        Name = "Unvigintillion",
        Abbreviation = "Uvg"
    }
}

function numbers.FormatNumber(Number: number, NameLength: NameType, DecimalPlaces: number?)
    local NameLength = NameLength.Name
    local NumberValue = Number
    local Index
    local Notation

    --for index, value in ipairs(numbers.Guide) do
    --    if not Smallest or (math.abs(Number-value.Value) < Smallest) then
    --        Smallest = math.abs(Number-value.Value)
    --        Index = index
    --    end
    --end

    for index, value in ipairs(numbers.Notations) do
        local Value = math.pow(10, index * 3)

        if Number >= Value then
            Index = index
            NumberValue = Number

            if DecimalPlaces then
                local format = "%."..tostring(DecimalPlaces).."f"
                NumberValue = format:format(NumberValue / Value):gsub("%.?0+$", "")
            end
        end
    end

    local Notation = numbers.Notations[Index] or ""
    return NumberValue..(Notation[NameLength] or "")
end

return numbers