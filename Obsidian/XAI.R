r=1/2; q=sqrt(r^2+1); 
w1=r/q; w2=1/q; 
w=c(w1,w2); t=5/q;
x0=t/w[1]; y0=t/w[2]
lim=c(0,max(x0,y0))
plot(NA, xlim=lim, ylim=lim, xlab="feature 1", ylab="feature 2", lwd=3)

vec <- function(x0=0,y0=0,x1=1,y1=1,col='black',lty=1) {
  arrows(x0,y0,x1,y1,lwd=3,length=0.1,angle=20,col=col,lty=lty)
  }

db <- function(w=w, t=t) {
  x0=t/w[1]; y0=t/w[2]; 
  lines(c(0,x0),c(y0,0),lwd=3); 
  vec(x0/2,y0/2,x0/2+w[1],y0/2+w[2])
  }

db(w,t)

x=c(3,1)
vec(0,0,x[1],x[2],'red')

rec <- function(x) {
  col='blue';
  alpha = t - sum(w*x); 
  rc = x+alpha*w; 
  #vec(x[1],x[2],rc[1],rc[2],'blue',lty=5);
  lines(c(x[1],rc[1]),c(x[2],rc[2]),lty=3,col=col,lwd=2); 
  points(rc[1],rc[2],pch='o',col=col)
}

rec(x)