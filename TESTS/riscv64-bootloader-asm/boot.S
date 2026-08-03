.global _start

_start:
    # Load the immediate value 42 into register x5 (t0)
    li x5, 42       
    
    # Add x5 and x5 together, store the result (84) in x6 (t1)
    add x6, x5, x5  

end:
    # Jump to the 'end' label (infinite loop to safely halt)
    j end
