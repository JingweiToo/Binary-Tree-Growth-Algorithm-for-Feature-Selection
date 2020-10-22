function [sFeat,Sf,Nf,curve]=jBTGA(feat,label,N,T,N1,N2,N4,theta,lambda,HO)

if N4 > N1+N2, N4=N1+N2; end
fun=@jFitnessFunction; 
D=size(feat,2); X=zeros(N,D);
for i=1:N
  for d=1:D
    if rand() > 0.5
      X(i,d)=1;
    end
  end
end
fit=zeros(1,N); fitG=inf; 
for i=1:N
  fit(i)=fun(feat,label,X(i,:),HO);
  if fit(i) < fitG
    fitG=fit(i); Xgb=X(i,:);
  end
end
[fit,idx]=sort(fit,'ascend'); X=X(idx,:); 
Xnew=zeros(N4,D); Fnew=zeros(1,N4); dist=zeros(1,N1+N2); 
X1=zeros(N1,D); curve=inf; t=1; 
%---Iteration start-------------------------------------------------------
while t <= T
  for i=1:N1
    r1=rand();
    for d=1:D
      Xn=X(i,d)/theta+r1*X(i,d);
      S=1/(1+exp(-Xn));
      if rand() < S
        X1(i,d)=1;
      else
        X1(i,d)=0;
      end
    end
    fitT=fun(feat,label,X1(i,:),HO); 
    if fitT <= fit(i)
      X(i,:)=X1(i,:); fit(i)=fitT;
    end
  end
  Xorg=X;
  for i=N1+1:N1+N2
    for j=1:N1+N2
      if j~=i
        dist(j)=sqrt(sum((Xorg(j,:)-Xorg(i,:)).^2));
      else
        dist(j)=inf;
      end
    end
    [~,idx2]=sort(dist,'ascend'); T1=Xorg(idx2(1),:); T2=Xorg(idx2(2),:);
    alpha=rand();
    for d=1:D
      Y=lambda*T1(d)+(1-lambda)*T2(d);
      Xn=X(i,d)+alpha*Y;
      S=1/(1+exp(-Xn));
      if rand() < S
        X(i,d)=1;
      else
        X(i,d)=0;
      end
    end
    fit(i)=fun(feat,label,X(i,:),HO);
  end
  for i=N1+N2+1:N
    for d=1:D
      X(i,d)=randi([0,1]);
    end
    fit(i)=fun(feat,label,X(i,:),HO);
  end
  for i=1:N4
    r=randi([1,N1]); Xbest=X(r,:);
    mask=randi([0,1],1,D);
    for d=1:D
      Xn=randi([0,1]);
      if mask(d)==1
        Xnew(i,d)=Xbest(d);
      elseif mask(d)==0
        Xnew(i,d)=Xn;
      end
    end
    Fnew(i)=fun(feat,label,Xnew(i,:),HO);
  end
  XX=[X;Xnew]; FF=[fit,Fnew]; [FF,idx]=sort(FF,'ascend');
  X=XX(idx(1:N),:); fit=FF(1:N);
  if fit(1) < fitG
    fitG=fit(1); Xgb=X(1,:);
  end
  curve(t)=fitG; 
  fprintf('\nIteration %d Best (BTGA)= %f',t,curve(t))
  t=t+1;
end
Pos=1:D; Sf=Pos(Xgb==1); Nf=length(Sf); sFeat=feat(:,Sf); 
end

