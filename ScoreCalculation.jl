using LinearAlgebra
using CSV
# Order: tds, calcium, alkalinity, sodium, ph, chlorine
targets = [150,68,40,10,7.0,0]
acceptableRanges = [(75, 250),(17, 85),(35, 45),(5, 15),(6.5, 7.5),(0,0)]

function flagUnacceptableVals(values::Array{Float64})
    acceptable = [x1<val<x2 for ((x1,x2),val) in zip(acceptableRanges,values)]
    unacceptableCount = max(1,length(values)-sum(acceptable))
    return unacceptableCount
end

function calculateScore(values::Array{Float64}, standardDeviation::Array{Float64})
    multiplier = flagUnacceptableVals(values)
    k = 2 #Instead of a baseline sensitivity hyperparam, it might be cool to apply different sensitivities to different values. Will experiment with this.
    rValues = values .- targets #the period means to apply element-wise operations between lists.
    normalizedR = sum(rValues/standardDeviation)
    S = 100 - (abs.(k * normalizedR)*multiplier)
    return max(0,S)
end