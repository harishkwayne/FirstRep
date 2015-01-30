n = 500;
N_est=zeros(1,50);
for k=1:500
    
    m = randsample(500,k);
    for l=1:49
        r = randsample(500,k); %generate k random numbers
        m = [m r];
    end
    m_k = max(m);
    if(mod(k,10)==0)
        N_est = [N_est;((k+1)/k)*m_k - 1];
    else
        N_est = [N_est;zeros(1,50)];
    end
    
end

Variance = std(N_est');
figure % new figure
subplot(2,1,1); % top subplot
plot(N_est,'.')
%plot([1:1:500],N_est,[1:1:500],ones(500,1)*500,'.')
title('Estimates of N')
ylabel('N')
xlabel('Number of Observations')
subplot(2,1,2); % bottom subplot


bar(Variance')
title('Variance in different trials')
ylabel('Variance')
xlabel('Number of Observations')

