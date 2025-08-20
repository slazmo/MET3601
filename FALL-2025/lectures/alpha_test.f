      PROGRAM alpha_test

      integer nlev
      parameter(nlev=11)

      real vr, zr, a
c     parameter (vr=1.,zr=6.,a=.14285)
c     parameter (vr=6.,zr=30.,a=.45547)
      parameter (vr=15.93,zr=10.)
      real vob(nlev),zob(nlev)
c     data zob /6.,12.,54.,162.,204.,295./
      data zob /10,14,24,29,38,39,49,74,99,124,149/
      data vob /15.93,17.73,19.08,19.85,21.12,
     &          21.27,21.82,23.00,23.63,23.98,24.06/

ccc 
c
c   to compile:
c       f95 -o alpha_test alpha_test.f
ccc 

      DO k=1,nlev
c       vob(k) = vr*((zob(k)/zr)**a)
        write(6,*) 'zob,vob: ',zob(k),vob(k)
      END DO

ccc
c     Estimate alpha from least squares method
ccc
      CALL alpha(nlev,vr,zr,vob,zob,als)

      write(6,*) 'alpha ls: ',als
           
      END
ccc
      SUBROUTINE alpha(nlev,vr,zr,vob,zob,als)

      integer nlev
      real vob(nlev),zob(nlev)
      real spval
      data spval/-9999./
ccc 
c
c  input heights 
c
ccc      
      top = 0.
      bot = 0.

      DO k=1,nlev
        vrat= vob(k)/vr
        zrat= zob(k)/zr
        top = top + alog(vrat)*alog(zrat)
        bot = bot + alog(zrat)*alog(zrat)
        write(6,*) 'vob,zob,vrat,zrat,top,bot: ',vob(k),zob(k),vrat,zrat,top,bot
      END DO

ccc
c
c Calculate the least-square fit parameter alpha (see Archer and Jacobson
c Eq. (4) JGR VOL 108, 2003.
c
ccc
      als = top/bot

      RETURN

      END
