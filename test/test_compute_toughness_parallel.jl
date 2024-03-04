using Test
using MPI
using assignment12

MPI.Init()

comm = MPI.COMM_WORLD
rank = MPI.Comm_rank(comm)

data_path = dirname(@__FILE__)*"/../data/"

ans = compute_toughness_parallel(data_path, comm)

if rank == 0
    @test isapprox(ans, 70836.1434834513, atol=1.0e-3)
elseif rank == 1
    @test isapprox(ans, 42744.4360224889, atol=1.0e-3)
end

MPI.Finalize()
