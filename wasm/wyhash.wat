(module
  (type (;0;) (func))
  (type (;1;) (func (param i32 i64 i64 i64 i64)))
  (type (;2;) (func (param i64 i32)))
  (type (;3;) (func (param i64) (result f64)))
  (type (;4;) (func (param i64 i64) (result i64)))
  (type (;5;) (func (param i32 i32 i64 i32) (result i64)))
  (type (;6;) (func (param i32) (result i64)))
  (func (;0;) (type 0))
  (func (;1;) (type 0)
    call 0
    call 0)
  (func (;2;) (type 1) (param i32 i64 i64 i64 i64)
    (local i64)
    local.get 0
    local.get 4
    local.get 1
    i64.mul
    local.get 2
    local.get 3
    i64.mul
    i64.add
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 2
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 4
    i64.mul
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.tee 3
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 1
    i64.mul
    local.tee 5
    i64.const 32
    i64.shr_u
    local.get 3
    local.get 4
    i64.mul
    i64.add
    local.tee 3
    i64.const 32
    i64.shr_u
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.get 2
    local.get 1
    i64.mul
    i64.add
    local.tee 1
    i64.const 32
    i64.shr_u
    i64.add
    i64.store offset=8
    local.get 0
    local.get 1
    i64.const 32
    i64.shl
    local.get 5
    i64.const 4294967295
    i64.and
    i64.or
    i64.store)
  (func (;3;) (type 2) (param i64 i32)
    (local i32 i32 i32 i32 i64 i32 i64)
    global.get 0
    i32.const 256
    i32.sub
    local.tee 2
    global.set 0
    i32.const 0
    local.set 3
    local.get 2
    i32.const 112
    i32.add
    i32.const 8
    i32.add
    local.set 4
    loop  ;; label = @1
      local.get 1
      local.get 3
      i32.const 3
      i32.shl
      i32.add
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 0
          i64.const 2206103915379282803
          i64.add
          local.set 6
          loop  ;; label = @4
            local.get 2
            i32.const 112
            i32.add
            local.get 6
            i64.const -9090386578408894276
            i64.add
            local.tee 0
            i64.const -1800455987208640293
            i64.xor
            i64.const 0
            local.get 0
            i64.const 0
            call 2
            local.get 6
            i64.const 265970916891763064
            i64.add
            local.set 6
            local.get 4
            i64.load
            local.get 2
            i64.load offset=112
            i64.xor
            i64.const 70
            i64.rem_u
            i32.wrap_i64
            i32.const 1024
            i32.add
            i32.load8_u
            local.tee 7
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 2
          i32.const 96
          i32.add
          local.get 6
          i64.const 2206103915379282803
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 80
          i32.add
          local.get 6
          i64.const -4678178747650328670
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 64
          i32.add
          local.get 6
          i64.const 6884282663029611473
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 48
          i32.add
          local.get 6
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 6
          i64.const 0
          call 2
          local.get 2
          i32.const 32
          i32.add
          local.get 6
          i64.const -6884282663029611473
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 16
          i32.add
          local.get 6
          i64.const 4678178747650328670
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          local.get 6
          i64.const -2206103915379282803
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 5
          local.get 2
          i32.const 96
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=96
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 8
          i64.shl
          local.get 7
          i64.extend_i32_u
          i64.or
          local.get 2
          i32.const 80
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=80
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 16
          i64.shl
          i64.or
          local.get 2
          i32.const 64
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=64
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 24
          i64.shl
          i64.or
          local.get 2
          i32.const 48
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=48
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 32
          i64.shl
          i64.or
          local.get 2
          i32.const 32
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=32
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 40
          i64.shl
          i64.or
          local.get 2
          i32.const 16
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=16
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 48
          i64.shl
          i64.or
          local.get 2
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 56
          i64.shl
          i64.or
          i64.store
          br 1 (;@2;)
        end
        local.get 0
        i64.const 7150253579921374537
        i64.add
        local.set 6
        loop  ;; label = @3
          local.get 2
          i32.const 240
          i32.add
          local.get 6
          i64.const 4412207830758565606
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 224
          i32.add
          local.get 6
          i64.const -2472074832271045867
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 208
          i32.add
          local.get 6
          i64.const 9090386578408894276
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 192
          i32.add
          local.get 6
          i64.const 2206103915379282803
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 176
          i32.add
          local.get 6
          i64.const -4678178747650328670
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 160
          i32.add
          local.get 6
          i64.const 6884282663029611473
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 2
          i32.const 144
          i32.add
          local.get 6
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 6
          i64.const 0
          call 2
          local.get 2
          i32.const 128
          i32.add
          local.get 6
          i64.const -6884282663029611473
          i64.add
          local.tee 0
          i64.const -1800455987208640293
          i64.xor
          i64.const 0
          local.get 0
          i64.const 0
          call 2
          local.get 5
          local.get 2
          i32.const 224
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=224
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 8
          i64.shl
          local.get 2
          i32.const 208
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=208
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 16
          i64.shl
          i64.or
          local.get 2
          i32.const 192
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=192
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 24
          i64.shl
          i64.or
          local.get 2
          i32.const 176
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=176
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 32
          i64.shl
          i64.or
          local.get 2
          i32.const 160
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=160
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 40
          i64.shl
          i64.or
          local.get 2
          i32.const 144
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=144
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 48
          i64.shl
          i64.or
          local.get 2
          i32.const 128
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=128
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i64.load8_u
          i64.const 56
          i64.shl
          i64.or
          local.get 2
          i32.const 240
          i32.add
          i32.const 8
          i32.add
          i64.load
          local.get 2
          i64.load offset=240
          i64.xor
          i64.const 70
          i64.rem_u
          i32.wrap_i64
          i32.const 1024
          i32.add
          i32.load8_u
          local.tee 7
          i64.extend_i32_u
          i64.or
          local.tee 8
          i64.store
          block  ;; label = @4
            local.get 7
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i64.load
            local.get 8
            i64.xor
            i64.popcnt
            i64.const 32
            i64.ne
            br_if 0 (;@4;)
            local.get 3
            i32.const 1
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i64.load offset=8
            local.get 8
            i64.xor
            i64.popcnt
            i64.const 32
            i64.ne
            br_if 0 (;@4;)
            local.get 3
            i32.const 2
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i64.load offset=16
            local.get 8
            i64.xor
            i64.popcnt
            i64.const 32
            i64.eq
            br_if 2 (;@2;)
          end
          local.get 6
          i64.const 265970916891763064
          i64.add
          local.set 6
          br 0 (;@3;)
        end
      end
      local.get 3
      i32.const 1
      i32.add
      local.tee 3
      i32.const 4
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 2
    i32.const 256
    i32.add
    global.set 0)
  (func (;4;) (type 3) (param i64) (result f64)
    local.get 0
    i64.const 21
    i64.shr_u
    i64.const 2097151
    i64.and
    local.get 0
    i64.const 2097151
    i64.and
    i64.add
    local.get 0
    i64.const 42
    i64.shr_u
    i64.const 2097151
    i64.and
    i64.add
    f64.convert_i64_u
    f64.const 0x1p-20 (;=9.53674e-07;)
    f64.mul
    f64.const -0x1.8p+1 (;=-3;)
    f64.add)
  (func (;5;) (type 3) (param i64) (result f64)
    local.get 0
    i64.const 12
    i64.shr_u
    f64.convert_i64_u
    f64.const 0x1p-52 (;=2.22045e-16;)
    f64.mul)
  (func (;6;) (type 4) (param i64 i64) (result i64)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i64.const 0
    local.get 0
    i64.const 0
    call 2
    local.get 2
    i32.const 8
    i32.add
    i64.load
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;7;) (type 5) (param i32 i32 i64 i32) (result i64)
    (local i32 i64 i64 i32 i64 i64 i64 i64)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    i32.const 96
    i32.add
    local.get 3
    i64.load offset=8
    local.tee 5
    i64.const 0
    local.get 3
    i64.load
    local.tee 6
    local.get 2
    i64.xor
    i64.const 0
    call 2
    local.get 4
    i32.const 104
    i32.add
    i64.load
    local.get 4
    i64.load offset=96
    i64.xor
    local.get 2
    i64.xor
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 16
        i32.gt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.add
          i32.const -4
          i32.add
          local.tee 3
          i64.load32_u align=1
          i64.const 32
          i64.shl
          local.get 3
          local.get 1
          i32.const 1
          i32.shr_u
          i32.const 2147483644
          i32.and
          local.tee 7
          i32.sub
          i64.load32_u align=1
          i64.or
          local.set 8
          local.get 0
          i64.load32_u align=1
          i64.const 32
          i64.shl
          local.get 0
          local.get 7
          i32.add
          i64.load32_u align=1
          i64.or
          local.set 9
          br 2 (;@1;)
        end
        i64.const 0
        local.set 8
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          i64.const 0
          local.set 9
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        i32.const 1
        i32.shr_u
        i32.add
        i64.load8_u
        i64.const 8
        i64.shl
        local.get 0
        i64.load8_u
        i64.const 16
        i64.shl
        i64.or
        local.get 1
        local.get 0
        i32.add
        i32.const -1
        i32.add
        i64.load8_u
        i64.or
        local.set 9
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 49
            i32.ge_u
            br_if 0 (;@4;)
            local.get 1
            local.set 3
            br 1 (;@3;)
          end
          local.get 3
          i64.load offset=24
          local.set 10
          local.get 3
          i64.load offset=16
          local.set 11
          local.get 1
          local.set 3
          local.get 2
          local.set 8
          local.get 2
          local.set 9
          loop  ;; label = @4
            local.get 4
            i32.const 80
            i32.add
            local.get 0
            i64.load offset=8 align=1
            local.get 2
            i64.xor
            i64.const 0
            local.get 0
            i64.load align=1
            local.get 5
            i64.xor
            i64.const 0
            call 2
            local.get 4
            i32.const 64
            i32.add
            local.get 0
            i64.load offset=24 align=1
            local.get 8
            i64.xor
            i64.const 0
            local.get 0
            i64.load offset=16 align=1
            local.get 11
            i64.xor
            i64.const 0
            call 2
            local.get 4
            i32.const 48
            i32.add
            local.get 0
            i64.load offset=40 align=1
            local.get 9
            i64.xor
            i64.const 0
            local.get 0
            i64.load offset=32 align=1
            local.get 10
            i64.xor
            i64.const 0
            call 2
            local.get 0
            i32.const 48
            i32.add
            local.set 0
            local.get 4
            i32.const 48
            i32.add
            i32.const 8
            i32.add
            i64.load
            local.get 4
            i64.load offset=48
            i64.xor
            local.set 9
            local.get 4
            i32.const 64
            i32.add
            i32.const 8
            i32.add
            i64.load
            local.get 4
            i64.load offset=64
            i64.xor
            local.set 8
            local.get 4
            i32.const 80
            i32.add
            i32.const 8
            i32.add
            i64.load
            local.get 4
            i64.load offset=80
            i64.xor
            local.set 2
            local.get 3
            i32.const -48
            i32.add
            local.tee 3
            i32.const 48
            i32.gt_u
            br_if 0 (;@4;)
          end
          local.get 8
          local.get 2
          i64.xor
          local.get 9
          i64.xor
          local.set 2
          local.get 3
          i32.const 17
          i32.lt_u
          br_if 1 (;@2;)
        end
        local.get 4
        i32.const 40
        i32.add
        local.set 7
        loop  ;; label = @3
          local.get 4
          i32.const 32
          i32.add
          local.get 0
          i64.load offset=8 align=1
          local.get 2
          i64.xor
          i64.const 0
          local.get 0
          i64.load align=1
          local.get 5
          i64.xor
          i64.const 0
          call 2
          local.get 0
          i32.const 16
          i32.add
          local.set 0
          local.get 7
          i64.load
          local.get 4
          i64.load offset=32
          i64.xor
          local.set 2
          local.get 3
          i32.const -16
          i32.add
          local.tee 3
          i32.const 16
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 3
      i32.add
      local.tee 0
      i32.const -8
      i32.add
      i64.load align=1
      local.set 8
      local.get 0
      i32.const -16
      i32.add
      i64.load align=1
      local.set 9
    end
    local.get 4
    i32.const 16
    i32.add
    local.get 2
    local.get 8
    i64.xor
    i64.const 0
    local.get 9
    local.get 5
    i64.xor
    i64.const 0
    call 2
    local.get 4
    local.get 5
    local.get 4
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.xor
    i64.const 0
    local.get 1
    i64.extend_i32_u
    local.get 4
    i64.load offset=16
    i64.xor
    local.get 6
    i64.xor
    i64.const 0
    call 2
    local.get 4
    i32.const 8
    i32.add
    i64.load
    local.set 5
    local.get 4
    i64.load
    local.set 2
    local.get 4
    i32.const 112
    i32.add
    global.set 0
    local.get 5
    local.get 2
    i64.xor)
  (func (;8;) (type 4) (param i64 i64) (result i64)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 16
    i32.add
    local.get 1
    i64.const -1800455987208640293
    i64.xor
    i64.const 0
    local.get 0
    i64.const -6884282663029611473
    i64.xor
    i64.const 0
    call 2
    local.get 2
    local.get 2
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.const -1800455987208640293
    i64.xor
    i64.const 0
    local.get 2
    i64.load offset=16
    i64.const -6884282663029611473
    i64.xor
    i64.const 0
    call 2
    local.get 2
    i32.const 8
    i32.add
    i64.load
    local.set 0
    local.get 2
    i64.load
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 0
    local.get 1
    i64.xor)
  (func (;9;) (type 6) (param i32) (result i64)
    (local i32 i64 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    local.get 0
    i64.load
    i64.const -6884282663029611473
    i64.add
    local.tee 2
    i64.store
    local.get 1
    local.get 2
    i64.const -1800455987208640293
    i64.xor
    i64.const 0
    local.get 2
    i64.const 0
    call 2
    local.get 1
    i32.const 8
    i32.add
    i64.load
    local.set 2
    local.get 1
    i64.load
    local.set 3
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 2
    local.get 3
    i64.xor)
  (func (;10;) (type 4) (param i64 i64) (result i64)
    local.get 0
    local.get 1
    call 8
    call 1)
  (func (;11;) (type 6) (param i32) (result i64)
    local.get 0
    call 9
    call 1)
  (func (;12;) (type 3) (param i64) (result f64)
    local.get 0
    call 5
    call 1)
  (func (;13;) (type 4) (param i64 i64) (result i64)
    local.get 0
    local.get 1
    call 6
    call 1)
  (func (;14;) (type 3) (param i64) (result f64)
    local.get 0
    call 4
    call 1)
  (func (;15;) (type 2) (param i64 i32)
    local.get 0
    local.get 1
    call 3
    call 1)
  (func (;16;) (type 5) (param i32 i32 i64 i32) (result i64)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 7
    call 1)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 1360))
  (global (;1;) i32 (i32.const 1094))
  (global (;2;) i32 (i32.const 1360))
  (export "memory" (memory 0))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (export "wyhash64" (func 10))
  (export "wyrand" (func 11))
  (export "wy2u01" (func 12))
  (export "wy2u0k" (func 13))
  (export "wy2gau" (func 14))
  (export "make_secret" (func 15))
  (export "wyhash" (func 16))
  (data (;0;) (i32.const 1024) "\0f\17\1b\1d\1e'+-.3569:<GKMNSUVYZ\5ccefijlqrtx\87\8b\8d\8e\93\95\96\99\9a\9c\a3\a5\a6\a9\aa\ac\b1\b2\b4\b8\c3\c5\c6\c9\ca\cc\d1\d2\d4\d8\e1\e2\e4\e8\f0"))
