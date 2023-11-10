function [t_zero, ifreq] = instfreq_zerocross(t,signal)


%Based on https://www.mathworks.com/matlabcentral/answers/852305-how-to-find-the-zero-crossing-in-x-and-time-data-sets

signal = signal - mean(signal);

idx_signal = find( (signal(2:end).*signal(1:end-1)<0) & (signal(1:end-1)<0) );


t_zero_signal = zeros(size(idx_signal));
for i=1:numel(idx_signal)
    j = idx_signal(i); % Need both the index in the idx/t_zero vector, and the f/t vector
    t_zero_signal(i) = interp1( signal(j:j+1), t(j:j+1), 0.0, 'linear' );
end

ifreq = 1./diff(t_zero_signal(1:end));
t_zero = t_zero_signal(2:end);
    

