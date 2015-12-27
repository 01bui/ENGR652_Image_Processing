function Pout = imlin2(Pin,a,b)
    %G gain, B bias
    c = min(Pin(:));
    d = max(Pin(:));
    Pout = (Pin -c)*(b-a)/(d-c)+a;
end