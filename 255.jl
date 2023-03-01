using Plots, Random, Colors 

function zpW(num::Int)    
  ncol = 1001
# number of rows 
  nrow =  ncol
  locM = div(ncol,2)
  St = zeros(Int,ncol)
  spM = zeros(Int,nrow,ncol)
  St[locM] = 1 
  nrow,ncol = size(spM)
  nextSt = zeros(Int,ncol)  
  d1= digits(num,base=2,pad=8)
  for i in 1:nrow
      spM[i,:] = St
      perm=[[ii,jj,kk] for ii=0:1,jj=0:1,kk=0:1]            
      #====================#
      for j in 2:ncol-1
          for ip=1:length(perm)
              if St[j-1:j+1]==perm[ip]
                  nextSt[j]= d1[ip]
              end
          end    
      end        
      #====================#
      nextSt[1]   = mod(St[ncol] + St[1] + St[2],2)
      nextSt[ncol]= mod(St[ncol-1] + St[ncol] + St[1],2)
      St =copy(nextSt)         
  end
  return spM 
end

anim = @animate for iter in 1:254
  plot(Gray.(zpW(iter)),ticks = false, title="Rule=$iter");
end   
gif(anim,"fig02.gif",fps=1);

 

