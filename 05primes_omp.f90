PROGRAM main
  USE omp_lib
  IMPLICIT NONE

  INTEGER :: i,j,n=200000,prime=0,total=0
  INTEGER(8) :: clock1,clock2,clockrate
  REAL(8) :: tstart

  CALL SYSTEM_CLOCK(clock1)

  !$omp parallel default(none)
  tstart=omp_get_wtime()
  !$omp do reduction(+:total)
  DO i=2,n
     prime=1
     DO j=2,i-1
        IF(MOD(i,j)==0)THEN
           prime=0
           EXIT
        ENDIF
     ENDDO
     total = total + prime
  ENDDO
  !$omp end do
  PRINT*,'thread ',omp_get_thread_num(),' time :',(omp_get_wtime()-tstart)
  !$omp end parallel

  CALL system_CLOCK(clock2,clockrate)

  PRINT*,'total ',total

  PRINT*,'time : ',REAL(clock2-clock1)/REAL(clockrate)
END PROGRAM main
