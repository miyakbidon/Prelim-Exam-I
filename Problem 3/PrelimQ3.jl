include("VarnerFlux.jl")
include("PrelimQ3_matrices.jl")

# parameters
W1 = 0.26
W2 = 300.0
Gj = 5.0                # nM of peptide
n = 1.5
k = 0.30                # mM
I = [0.0001:0.01:10...]
ke_TX = 0.069435        # s^-1 (TX elongation rate/gene length)
ke_TL = 0.053571        # s^-1 (TL elongation rate/peptide length)
R_TX = 0.15             # uM RNA polymerase concentration
R_TL = 1.6              # uM ribosome concentration
K_D_TX = 0.3            # uM saturation constant TX
K_D_TL = 57.0           # uM saturation constant TL
tau_TX = 2.7            # time constant TX
tau_TL = 0.8            # time constant TL

# developing arrays
F_I = [0.0001:0.01:10...]
U_I = [0.0001:0.01:10...]
TX_I = [0.0001:0.01:10...]
TL_I = [0.0001:0.01:10...]
mRNA_I = [0.0001:0.01:10...]

# Control function terms
for i = 1:length(1)
    F_I[i] = (I[i]^n / (k^n +I[i]^n))
    U_I[i] = (0 + W2 * F_I[i]) / (1 + 0 + W2 * F_I[i])
    # Transcription & Translation
    TX_I[i] = (U_I[i] * (ke_TX * R_TX * Gj)) / (tau_TX * K_D_TX + (tau_TX + 1) * Gj)
    TL_I[i] = (1 * (ke_TL * R_TL * mRNA_I[i])) / (tau_TL  * K_D_TL + (tau_TL + 1) * mRNA_I[i])
    mRNA_I[i] = TX_I[i]
end


(objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag, status_flag) = calculate_optimal_flux_distribution(Stoich, default_bounds_array, species_bounds_array, objective_coefficient_array, min_flag = false)
