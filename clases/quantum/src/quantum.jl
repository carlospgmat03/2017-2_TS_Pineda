__precompile__()

module quantum

using LsqFit: curve_fit

export random_state, projector, sigma_x, sigma_y, sigma_z, sigmas, apply_unitary!, apply_ising!, testbit, staircase, unfolding, apply_kick!, base_state, P_Unitary, P_Orthogonal


"""
function testbit(n, bit)

This function test if a a given bit in position "bit" of number "n" is on. 
"""
function testbit(n, bit)
    ~(n&(1<<bit)==0)
end 


"""
random_state(dim)

This function creates a random quantum state with dimension dim. 
"""
function random_state(dim::Int=2)
    v=randn(1,dim)+randn(1,dim)im
    v=v/norm(v)
    return v'
end

function projector(state)
    return state*state'
end

sigma_x=[0. 1.; 1. 0.]
sigma_y=[0. -im; im 0]
sigma_z=[1. 0.;0. -1.]
sigmas=Array[sigma_x, sigma_y, sigma_z]

"""
    apply_unitary!(psi, u, target_qubit)

This function applies efficiently an arbitrary unitary "u" to the target qubit, and modifies the state psi. 

"""
function apply_unitary!(psi, u, target_qubit)
    number_of_qubits = trailing_zeros(length(psi))
    end_outer_counter = 2^(number_of_qubits-target_qubit-1)-1
    for counter_left_bits = 0:end_outer_counter
        number_left=counter_left_bits<< (target_qubit+1)
        end_right_counter = number_left + (1<<target_qubit)-1
        for counter_right_bits = number_left:end_right_counter
            counter_right_bits_1 = counter_right_bits + (1<<target_qubit)
            psi[counter_right_bits+1], psi[counter_right_bits_1+1]=u*[psi[counter_right_bits+1], psi[counter_right_bits_1+1]]
        end
    end
end


"""
apply_ising!(psi, u, target_qubit)

This function applies efficiently the ising operator "\sigma_z^target_1 \sigma_z^target_2", and modifies the state psi. 

"""
function apply_ising!(psi, J, target_qubit_1, target_qubit_2)
    expJ=exp(-im*J)
    expJc=conj(expJ)
    for i = 0: length(psi)-1
        if testbit(i,target_qubit_1) $ testbit(i,target_qubit_2)
            psi[i+1]*=expJc
        else
            psi[i+1]*=expJ
        end
    end
end 

function apply_kick!(psi, b, target_qubit)
    phi=norm(b)
    if phi!=0
        b_normalized=b/phi
        sigma_n=sigmas[1]*b_normalized[1]+sigmas[2]*b_normalized[2]+sigmas[3]*b_normalized[3]
        u=eye(2)*cos(phi)-1.0im*sigma_n*sin(phi)
        apply_unitary!(psi, u, target_qubit)
    end
end 

function staircase(list,x)
    y=zeros(length(x));
    for i in range(1,length(x))
        y[i]=count(j->(j<=x[i]),list)
    end
    return y
end

function unfolding(list)
    x=linspace(minimum(list),maximum(list),1000);
    y=staircase(list,x);
    model(x,p)=p[1]+p[2]*x+p[3]*x.^2+p[4]*x.^3+p[5]*x.^4+p[6]*x.^5+p[7]*x.^6+p[8]*x.^7+p[9]*x.^8+p[10]*x.^9;
    fit = curve_fit(model, x, y,ones(10));
    p=fit.param;
    return model(list,p)
end

"""
Construye los elementos de la base
"""
function base_state(i,dim)
    psi=zeros(Complex{Float64},dim)
    psi[i+1]=1;
    return psi
end

function P_Orthogonal(x)
    return x.*exp(-x.^2*pi/4)*pi/2
end

function P_Unitary(x)
    return (x.^2*32/pi^2).*exp(-x.^2*4/pi)
end

end
