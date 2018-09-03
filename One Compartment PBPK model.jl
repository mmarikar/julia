#Single compartment PBPK dosing model. 
By Mo M. Using the ode presentation by Chris R.
9/3/2018f(u,p,t) = -10*0.1u # -ve since dose in compartment should decrease over time. 
                    # 0.1 absorption rate constant (Liters/hr)
u0 = 10.0 # dose styrene 10 mg oral
tspan = (0.0, 24.0) #simulate over 24 hours
prob = ODEProblem(f,u0,tspan)
sol = solve(prob,alg_hints=[:stiff],abstol=1e-30,reltol=1e-6,saveat=0.1)

using Plots
plot(sol,linewidth=1,title="Amount",
     xaxis="Time (hours)",yaxis="Amount in dosing compartment (mg)", label ="dosing over time") 

