# Reactions
# "V1: G + RNAP -> G*"
# "V2: G* + nNTP -> mRNA + G + RNAP + 2nPi"
# "V3: mRNA -> nNMP"
# "V4: mRNA + rib -> rib*"
# "V5: rib* + aAAtRNA + 2aGTP -> atRNA + 2aGDP + 2aPi + rib + mRNA + protein"
# "V6: AA + tRNA + ATP -> AMP + 2 Pi + AAtRNA"
# "B1: AA(ext) -> AA"
# "B2: NTP (ext) -> NTP"
# "B3: protein -> protein (ext)"
# "B4: NMP -> NMP (ext)"
# "B5: ATP (ext) -> ATP"
# "B6: AMP -> AMP (ext)"
# "B7: GTP (ext) -> GTP"
# "B8: GDP -> GDP (ext)"
# "B9: Pi -> Pi (ext)"

Stoich=[
                -1.0   1.0    0     0     0     0     0     0     0     0     0     0     0     0     0
                 1.0  -1.0    0     0     0     0     0     0     0     0     0     0     0     0     0
                  0     0     0     0     0   -1.0   1.0    0     0     0     0     0     0     0     0
                  0    2.0    0     0    2.0   2.0    0     0     0     0     0     0     0     0   -1.0
                  0     0     0     0     0    1.0    0     0     0     0     0   -1.0    0     0     0
                  0     0     0     0     0   -1.0    0     0     0     0    1.0    0     0     0     0
                  0     0     0     0    2.0    0     0     0     0     0     0     0     0   -1.0    0
                  0     0     0     0   -2.0    0     0     0     0     0     0     0    1.0    0     0
                  0     0    1.0    0     0     0     0     0     0   -1.0    0     0     0     0     0
                  0   -1.0    0     0     0     0     0    1.0    0     0     0     0     0     0     0
                 -1.0  1.0    0     0     0     0     0     0     0     0     0     0     0     0     0
                  0    1.0  -1.0  -1.0   1.0    0     0     0     0     0     0     0     0     0     0
                  0     0     0     0    1.0   -1.0   0     0     0     0     0     0     0     0     0
                  0     0     0     0   -1.0    1.0   0     0     0     0     0     0     0     0     0
                  0     0     0   -1.0   1.0    0     0     0     0     0     0     0     0     0     0
                  0     0     0    1.0  -1.0    0     0     0     0     0     0     0     0     0     0
                  0     0     0     0    1.0    0     0     0   -1.0    0     0     0     0     0     0
];

# Species Balance
species_bounds_array = [
         0.0    0.0	;       # G
         0.0    0.0	;       # G*
         0.0    0.0	;       # AA
         0.0    0.0	;       # Pi
         0.0    0.0	;       # AMP
         0.0    0.0	;       # ATP
         0.0    0.0	;       # GDP
         0.0    0.0	;       # GTP
         0.0    0.0	;       # NMP
         0.0    0.0	;       # NTP
         0.0    0.0	;       # RNAP
         0.0    0.0	;       # mRNA
         0.0    0.0	;       # tRNA
         0.0    0.0	;       # AAtRNA
         0.0    0.0	;       # rib
         0.0    0.0	;       # rib*
         0.0    0.0	;       # protein
    ];

# Objective coefficient array
objective_coefficient_array = [
    	0.0    ;    # V1
        0.0    ;    # V2
        0.0    ;    # V3
        0.0    ;    # V4
        1.0    ;    # V5
        0.0    ;    # V6
        0.0    ;    # B2
        0.0    ;    # B3
        0.0    ;    # B4:
        0.0    ;    # B5
        0.0    ;    # B6
        0.0    ;    # B7
        0.0    ;    # B8
        0.0    ;    # B9
    ];

for i in 1:length(I)
# Defining Default bounds array
default_bounds_array = [
       0	10000	;	# V1
    TX_I[i]	TX_I[i]	;	# V2
       0	10000	;	# V3
       0	10000	;	# V4
       0	TL_I[i]	;	# V5
       0	10000  ;   # V6
      -100000	100000     ;       # B1
      -100000	100000     ;       # B2
      -100000	100000     ;       # B3
      -100000	100000     ;       # B4
      -100000	100000     ;       # B5
      -100000	100000     ;       # B6
      -100000	100000     ;       # B7
      -100000	100000     ;       # B8
      -100000	100000     ;       # B9
   ];
end
