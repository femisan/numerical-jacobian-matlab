# numerical-jacobian-matlab
This is a matlab code for calculate jacobian matrix in numarical way
Usage example1: 
```code:matlab
    func_1 = @(x) x(1).^2 +x(2).^2
    J = numJaco({func_1},[2;3])
    
    J =
    4.0000    6.0000
```

Usage example2: 
```code:matlab

    func_1 = @(x) x(1).^2 +x(2).^2
    func_2 = @(x) x(1).^2 
    func_3 = @(x) x(2).^2 
    J = numJaco({func_1,func_2,func_3},[2;3]) give you 
        
    J =
    
        4.0000    6.0000
        4.0000         0
             0    6.0000
```
