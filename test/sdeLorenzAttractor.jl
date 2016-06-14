using DifferentialEquations, Plots, EllipsisNotation
srand(100)
prob = lorenzAttractorSDEExample(σ₀=3)

Tend = 10
## Solve and plot
println("Solve and Plot")
println("Plot 1")
sol1 =solve(prob::SDEProblem,[0,Tend];Δt=1/2^(4),fullSave=true,alg="SRI",adaptive=true,abstol=10,reltol=0)
p1 = plot(sol1.uFull[..,1],sol1.uFull[..,2],sol1.uFull[..,3],title="Absolute Tolerance = 10",leg=false)

println("Plot 2")
sol2 =solve(prob::SDEProblem,[0,Tend];Δt=1/2^(4),fullSave=true,alg="SRI",adaptive=true,abstol=1,reltol=0)
p2 = plot(sol2.uFull[..,1],sol2.uFull[..,2],sol2.uFull[..,3],title="Absolute Tolerance = 1",leg=false)

println("Plot 3")
sol3 =solve(prob::SDEProblem,[0,Tend];Δt=1/2^(4),fullSave=true,alg="SRI",adaptive=true,abstol=1/10,reltol=0)
p3 = plot(sol3.uFull[..,1],sol3.uFull[..,2],sol3.uFull[..,3],title="Absolute Tolerance = 1/10",leg=false)

println("Plot 4")
sol4 =solve(prob::SDEProblem,[0,Tend];Δt=1/2^(4),fullSave=true,alg="SRI",adaptive=true,abstol=1/100,reltol=0)
p4 = plot(sol4.uFull[..,1],sol4.uFull[..,2],sol4.uFull[..,3],title="Absolute Tolerance = 1/100",leg=false)

plot(p1,p2,p3,p4,size=(1200,800),plot_title="Lorenz Attractors")
gui()

true
