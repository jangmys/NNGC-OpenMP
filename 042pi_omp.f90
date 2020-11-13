PROGRAM main
  IMPLICIT NONE

  INTEGER(kind=8) :: n=1000
  INTEGER(kind=8) :: i
  REAL(kind=8) :: sum=0.0d0

  INTEGER(kind=8) :: t1,t2,clock_rate
  CHARACTER(len=32) :: arg

  CALL getarg(1, arg)
  READ(arg,*)n

  CALL system_clock(t1)

  !$omp parallel do reduction(+:sum)
  DO i=0,n
     sum = sum + ((-1)**i)/(2.0d0*i+1.0d0)
  ENDDO
  !$omp end parallel do

  CALL system_clock(t2,clock_rate)
  PRINT*,'time :	',REAL(t2-t1)/REAL(clock_rate)
  PRINT*,'PI :	',4*sum

END PROGRAM main
