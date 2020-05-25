using HRV
using Test

n=HRV.infile("e1304.txt")
td=HRV.time_domain(n)
#fd=HRV.frequency(n)
#nl=HRV.nonlinear(n)

@testset "HRV.jl" begin

    @testset "HRV.infile" begin
        @test HRV.infile("e1304","atr")==HRV.infile("e1304.txt")
    end

    @testset "HRV.time_domain" begin
        @test td.mean≈917.24 atol=0.1
        @test td.sdnn≈137.19 atol=0.1
        @test td.rmssd≈27.85 atol=0.1
        @test td.sdsd≈20.35 atol=0.1
        @test td.nn50≈342 atol=1
        @test td.pnn50≈4.413472706155633 atol=0.1
        @test td.nn20≈2831 atol=1
        @test td.pnn20≈36.53374628984385 atol=0.1
    end
end
