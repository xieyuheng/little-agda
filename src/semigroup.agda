{-# OPTIONS --type-in-type #-}
{-# OPTIONS --prop #-}
{-# OPTIONS --allow-unsolved-metas #-}

module semigroup where

open import basic
open eqv-reasoning

record semigroup-t : type where
  field
    elem-t : type
    mul : elem-t -> elem-t -> elem-t
    mul-associative :
      (x y z : elem-t) ->
      the-eqv-t elem-t
        (mul x (mul y z))
        (mul (mul x y) z)
