{-# OPTIONS --prop --safe #-}

module functor where

open import pure
open import simple
open import category

open category-t

record functor-t (lv : level-t) : type (lsucc lv) where
  field
    dom : category-t lv
    cod : category-t lv
    map : dom .object-t  -> cod .object-t
    fmap : {a b : dom .object-t} ->
      dom .morphism-t a b ->
      cod .morphism-t (map a) (map b)
    fmap-respect-compose : {a b c : dom .object-t} ->
      (f : dom .morphism-t a b) ->
      (g : dom .morphism-t b c) ->
      the-eqv-t (cod .morphism-t (map a) (map c))
        (fmap (dom .compose f g))
        (cod .compose (fmap f) (fmap g))
    fmap-respect-id : {a : dom .object-t} ->
      the-eqv-t (cod .morphism-t (map a) (map a))
        (fmap (dom .id a))
        (cod .id (map a))