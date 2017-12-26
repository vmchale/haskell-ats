#include "share/atspre_staload.hats"

#define ATS_MAINATSFLAG 1

fun fact {n : nat} (n : int(n)) : int =
  let
    fun loop {n : nat}{l : addr} .<n>. ( pf : !int @ l | n : int(n)
                                       , res : ptr(l)
                                       ) : void =
      if n > 0 then
        let
          val () = !res := n * !res
        in
          loop(pf | n - 1, res)
        end
    
    var res: int with pf = 1
    val () = loop(pf | n, addr@res)
  in
    res
  end

extern
fun factorial {n : nat} : int(n) -> int =
  "mac#"

implement factorial (m) =
  fact(m)