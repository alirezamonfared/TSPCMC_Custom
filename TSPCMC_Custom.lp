\ENCODING=ISO-8859-1
\Problem name: IloCplex

Minimize
 obj: r(5) + x2
Subject To
 c1:   x({3,2}) + x({5,2}) + x({6,2}) + x({7,2}) + x({8,2}) + x({9,2})  = 1
 c2:   x({2,3}) + x({5,3}) + x({6,3}) + x({7,3}) + x({8,3}) + x({9,3})  = 1
 c3:   x({2,5}) + x({3,5}) + x({6,5}) + x({7,5}) + x({8,5}) + x({9,5})  = 1
 c4:   x({2,6}) + x({3,6}) + x({5,6}) + x({7,6}) + x({8,6}) + x({9,6})  = 1
 c5:   x({2,7}) + x({3,7}) + x({5,7}) + x({6,7}) + x({8,7}) + x({9,7})  = 1
 c6:   x({2,8}) + x({3,8}) + x({5,8}) + x({6,8}) + x({7,8}) + x({9,8})  = 1
 c7:   x({2,9}) + x({3,9}) + x({5,9}) + x({6,9}) + x({7,9}) + x({8,9})  = 1
 c8:   x({2,3}) + x({2,5}) + x({2,6}) + x({2,7}) + x({2,8}) + x({2,9})  = 1
 c9:   x({3,2}) + x({3,5}) + x({3,6}) + x({3,7}) + x({3,8}) + x({3,9})  = 1
 c10:  x({5,2}) + x({5,3}) + x({5,6}) + x({5,7}) + x({5,8}) + x({5,9})  = 1
 c11:  x({6,2}) + x({6,3}) + x({6,5}) + x({6,7}) + x({6,8}) + x({6,9})  = 1
 c12:  x({7,2}) + x({7,3}) + x({7,5}) + x({7,6}) + x({7,8}) + x({7,9})  = 1
 c13:  x({8,2}) + x({8,3}) + x({8,5}) + x({8,6}) + x({8,7}) + x({8,9})  = 1
 c14:  x({9,2}) + x({9,3}) + x({9,5}) + x({9,6}) + x({9,7}) + x({9,8})  = 1
 c15:  x({5,3})  = 1
 c16:  z(0)(0) + z(1)(0)  = 1
 c17:  s(0) >= 0
 c18:  W(0) >= 0
 c19:  - r(5) + s(0) - W(0) <= 0
 c20:  r(5) - s(0) + W(0) >= 0
 c21:  z(0)(1) + z(1)(1)  = 1
 c22:  s(1) >= 0
 c23:  W(1) >= 0
 c24:  100 z(0)(1) + 100 z(1)(1) + s(1) - W(1) - r(6) <= 0
 c25:  - 100 z(0)(1) - 100 z(1)(1) - s(1) + W(1) + r(6) >= 0
 c26:  z(0)(2) + z(1)(2)  = 1
 c27:  s(2) >= 0
 c28:  W(2) >= 0
 c29:  100 z(0)(2) + 100 z(1)(2) + s(2) - W(2) - r(7) <= 0
 c30:  - 100 z(0)(2) - 100 z(1)(2) - s(2) + W(2) + r(7) >= 0
 c31:  z(0)(3) + z(1)(3)  = 1
 c32:  s(3) >= 0
 c33:  W(3) >= 0
 c34:  100 z(0)(3) + 100 z(1)(3) + s(3) - W(3) - r(8) <= 0
 c35:  - 100 z(0)(3) - 100 z(1)(3) - s(3) + W(3) + r(8) >= 0
 c36:  z(0)(4) + z(1)(4)  = 1
 c37:  s(4) >= 0
 c38:  W(4) >= 0
 c39:  100 z(0)(4) + 100 z(1)(4) + s(4) - W(4) - r(9) <= 0
 c40:  - 100 z(0)(4) - 100 z(1)(4) - s(4) + W(4) + r(9) >= 0
 c41:  r(2) >= 0
 c42:  r(3) >= 0
 c43:  r(5) >= 0
 c44:  r(6) >= 0
 c45:  r(7) >= 0
 c46:  r(8) >= 0
 c47:  r(9) >= 0
 c48:  s(2) - r(2) >= 0
 c49:  r(7) - r(2) >= 0
 c50:  s(3) - r(3) >= 0
 c51:  r(8) - r(3) >= 0
 c52:  r(3)  = 0
 c53:  s(0)  = 0
 c54:  W(0)  = 0
 c55:  - r(5) + 2792 x({2,5}) + r(2) <= 2742
 c56:  2792 x({2,6}) - r(6) + r(2) <= 2756
 c57:  2792 x({2,7}) - r(7) + r(2) <= 2792
 c58:  2792 x({2,8}) - r(8) + r(2) <= 2762
 c59:  2792 x({2,9}) - r(9) + r(2) <= 2741
 c60:  2792 x({3,2}) - r(2) + r(3) <= 2762
 c61:  - r(5) + 2792 x({3,5}) + r(3) <= 2760
 c62:  2792 x({3,6}) - r(6) + r(3) <= 2772
 c63:  2792 x({3,7}) - r(7) + r(3) <= 2762
 c64:  2792 x({3,8}) - r(8) + r(3) <= 2792
 c65:  2792 x({3,9}) - r(9) + r(3) <= 2770
 c66:  r(5) + 2792 x({5,2}) + W(0) - r(2) <= 2742
 c67:  r(5) + 2792 x({5,6}) + W(0) - r(6) <= 2778
 c68:  r(5) + 2792 x({5,7}) + W(0) - r(7) <= 2742
 c69:  r(5) + 2792 x({5,8}) + W(0) - r(8) <= 2760
 c70:  r(5) + 2792 x({5,9}) + W(0) - r(9) <= 2770
 c71:  2792 x({6,2}) + W(1) + r(6) - r(2) <= 2756
 c72:  - r(5) + 2792 x({6,5}) + W(1) + r(6) <= 2778
 c73:  2792 x({6,7}) + W(1) + r(6) - r(7) <= 2756
 c74:  2792 x({6,8}) + W(1) + r(6) - r(8) <= 2772
 c75:  2792 x({6,9}) + W(1) + r(6) - r(9) <= 2770
 c76:  2792 x({7,2}) + W(2) + r(7) - r(2) <= 2792
 c77:  - r(5) + 2792 x({7,5}) + W(2) + r(7) <= 2742
 c78:  2792 x({7,6}) - r(6) + W(2) + r(7) <= 2756
 c79:  2792 x({7,8}) + W(2) + r(7) - r(8) <= 2762
 c80:  2792 x({7,9}) + W(2) + r(7) - r(9) <= 2741
 c81:  2792 x({8,2}) + W(3) + r(8) - r(2) <= 2762
 c82:  - r(5) + 2792 x({8,5}) + W(3) + r(8) <= 2760
 c83:  2792 x({8,6}) - r(6) + W(3) + r(8) <= 2772
 c84:  2792 x({8,7}) - r(7) + W(3) + r(8) <= 2762
 c85:  2792 x({8,9}) + W(3) + r(8) - r(9) <= 2770
 c86:  2792 x({9,2}) + W(4) + r(9) - r(2) <= 2741
 c87:  - r(5) + 2792 x({9,5}) + W(4) + r(9) <= 2770
 c88:  2792 x({9,6}) - r(6) + W(4) + r(9) <= 2770
 c89:  2792 x({9,7}) - r(7) + W(4) + r(9) <= 2741
 c90:  2792 x({9,8}) - r(8) + W(4) + r(9) <= 2770
 c91:  s(0) - s(1) + 2792 y(0)(1) <= 2792
 c92:  s(0) - s(2) + 2792 y(0)(2) <= 2792
 c93:  s(0) - s(3) + 2792 y(0)(3) <= 2792
 c94:  s(0) - s(4) + 2792 y(0)(4) <= 2792
 c95:  - s(0) + 100 z(0)(1) + 100 z(1)(1) + s(1) + 2792 y(1)(0) <= 2792
 c96:  100 z(0)(1) + 100 z(1)(1) + s(1) - s(2) + 2792 y(1)(2) <= 2792
 c97:  100 z(0)(1) + 100 z(1)(1) + s(1) - s(3) + 2792 y(1)(3) <= 2792
 c98:  100 z(0)(1) + 100 z(1)(1) + s(1) - s(4) + 2792 y(1)(4) <= 2792
 c99:  - s(0) + 100 z(0)(2) + 100 z(1)(2) + s(2) + 2792 y(2)(0) <= 2792
 c100: - s(1) + 100 z(0)(2) + 100 z(1)(2) + s(2) + 2792 y(2)(1) <= 2792
 c101: 100 z(0)(2) + 100 z(1)(2) + s(2) - s(3) + 2792 y(2)(3) <= 2792
 c102: 100 z(0)(2) + 100 z(1)(2) + s(2) - s(4) + 2792 y(2)(4) <= 2792
 c103: - s(0) + 100 z(0)(3) + 100 z(1)(3) + s(3) + 2792 y(3)(0) <= 2792
 c104: - s(1) + 100 z(0)(3) + 100 z(1)(3) + s(3) + 2792 y(3)(1) <= 2792
 c105: - s(2) + 100 z(0)(3) + 100 z(1)(3) + s(3) + 2792 y(3)(2) <= 2792
 c106: 100 z(0)(3) + 100 z(1)(3) + s(3) - s(4) + 2792 y(3)(4) <= 2792
 c107: - s(0) + 100 z(0)(4) + 100 z(1)(4) + s(4) + 2792 y(4)(0) <= 2792
 c108: - s(1) + 100 z(0)(4) + 100 z(1)(4) + s(4) + 2792 y(4)(1) <= 2792
 c109: - s(2) + 100 z(0)(4) + 100 z(1)(4) + s(4) + 2792 y(4)(2) <= 2792
 c110: - s(3) + 100 z(0)(4) + 100 z(1)(4) + s(4) + 2792 y(4)(3) <= 2792
 c111: y(0)(1) + y(1)(0) <= 1
 c112: z(0)(0) + z(0)(1) - y(0)(1) - y(1)(0) <= 1
 c113: z(1)(0) + z(0)(1) + y(0)(1) + y(1)(0) <= 2
 c114: z(1)(0) + z(1)(1) - y(0)(1) - y(1)(0) <= 1
 c115: z(0)(0) + z(1)(1) + y(0)(1) + y(1)(0) <= 2
 c116: y(0)(2) + y(2)(0) <= 1
 c117: z(0)(0) + z(0)(2) - y(0)(2) - y(2)(0) <= 1
 c118: z(1)(0) + z(0)(2) + y(0)(2) + y(2)(0) <= 2
 c119: z(1)(0) + z(1)(2) - y(0)(2) - y(2)(0) <= 1
 c120: z(0)(0) + z(1)(2) + y(0)(2) + y(2)(0) <= 2
 c121: y(0)(3) + y(3)(0) <= 1
 c122: z(0)(0) + z(0)(3) - y(0)(3) - y(3)(0) <= 1
 c123: z(1)(0) + z(0)(3) + y(0)(3) + y(3)(0) <= 2
 c124: z(1)(0) + z(1)(3) - y(0)(3) - y(3)(0) <= 1
 c125: z(0)(0) + z(1)(3) + y(0)(3) + y(3)(0) <= 2
 c126: y(0)(4) + y(4)(0) <= 1
 c127: z(0)(0) + z(0)(4) - y(0)(4) - y(4)(0) <= 1
 c128: z(1)(0) + z(0)(4) + y(0)(4) + y(4)(0) <= 2
 c129: z(1)(0) + z(1)(4) - y(0)(4) - y(4)(0) <= 1
 c130: z(0)(0) + z(1)(4) + y(0)(4) + y(4)(0) <= 2
 c131: y(1)(2) + y(2)(1) <= 1
 c132: z(0)(1) + z(0)(2) - y(1)(2) - y(2)(1) <= 1
 c133: z(1)(1) + z(0)(2) + y(1)(2) + y(2)(1) <= 2
 c134: z(1)(1) + z(1)(2) - y(1)(2) - y(2)(1) <= 1
 c135: z(0)(1) + z(1)(2) + y(1)(2) + y(2)(1) <= 2
 c136: y(1)(3) + y(3)(1) <= 1
 c137: z(0)(1) + z(0)(3) - y(1)(3) - y(3)(1) <= 1
 c138: z(1)(1) + z(0)(3) + y(1)(3) + y(3)(1) <= 2
 c139: z(1)(1) + z(1)(3) - y(1)(3) - y(3)(1) <= 1
 c140: z(0)(1) + z(1)(3) + y(1)(3) + y(3)(1) <= 2
 c141: y(1)(4) + y(4)(1) <= 1
 c142: z(0)(1) + z(0)(4) - y(1)(4) - y(4)(1) <= 1
 c143: z(1)(1) + z(0)(4) + y(1)(4) + y(4)(1) <= 2
 c144: z(1)(1) + z(1)(4) - y(1)(4) - y(4)(1) <= 1
 c145: z(0)(1) + z(1)(4) + y(1)(4) + y(4)(1) <= 2
 c146: y(2)(3) + y(3)(2) <= 1
 c147: z(0)(2) + z(0)(3) - y(2)(3) - y(3)(2) <= 1
 c148: z(1)(2) + z(0)(3) + y(2)(3) + y(3)(2) <= 2
 c149: z(1)(2) + z(1)(3) - y(2)(3) - y(3)(2) <= 1
 c150: z(0)(2) + z(1)(3) + y(2)(3) + y(3)(2) <= 2
 c151: y(2)(4) + y(4)(2) <= 1
 c152: z(0)(2) + z(0)(4) - y(2)(4) - y(4)(2) <= 1
 c153: z(1)(2) + z(0)(4) + y(2)(4) + y(4)(2) <= 2
 c154: z(1)(2) + z(1)(4) - y(2)(4) - y(4)(2) <= 1
 c155: z(0)(2) + z(1)(4) + y(2)(4) + y(4)(2) <= 2
 c156: y(3)(4) + y(4)(3) <= 1
 c157: z(0)(3) + z(0)(4) - y(3)(4) - y(4)(3) <= 1
 c158: z(1)(3) + z(0)(4) + y(3)(4) + y(4)(3) <= 2
 c159: z(1)(3) + z(1)(4) - y(3)(4) - y(4)(3) <= 1
 c160: z(0)(3) + z(1)(4) + y(3)(4) + y(4)(3) <= 2
Bounds
      r(5) Free
      x2 = 0
 0 <= x({3,2}) <= 1
 0 <= x({5,2}) <= 1
 0 <= x({6,2}) <= 1
 0 <= x({7,2}) <= 1
 0 <= x({8,2}) <= 1
 0 <= x({9,2}) <= 1
 0 <= x({2,3}) <= 1
 0 <= x({5,3}) <= 1
 0 <= x({6,3}) <= 1
 0 <= x({7,3}) <= 1
 0 <= x({8,3}) <= 1
 0 <= x({9,3}) <= 1
 0 <= x({2,5}) <= 1
 0 <= x({3,5}) <= 1
 0 <= x({6,5}) <= 1
 0 <= x({7,5}) <= 1
 0 <= x({8,5}) <= 1
 0 <= x({9,5}) <= 1
 0 <= x({2,6}) <= 1
 0 <= x({3,6}) <= 1
 0 <= x({5,6}) <= 1
 0 <= x({7,6}) <= 1
 0 <= x({8,6}) <= 1
 0 <= x({9,6}) <= 1
 0 <= x({2,7}) <= 1
 0 <= x({3,7}) <= 1
 0 <= x({5,7}) <= 1
 0 <= x({6,7}) <= 1
 0 <= x({8,7}) <= 1
 0 <= x({9,7}) <= 1
 0 <= x({2,8}) <= 1
 0 <= x({3,8}) <= 1
 0 <= x({5,8}) <= 1
 0 <= x({6,8}) <= 1
 0 <= x({7,8}) <= 1
 0 <= x({9,8}) <= 1
 0 <= x({2,9}) <= 1
 0 <= x({3,9}) <= 1
 0 <= x({5,9}) <= 1
 0 <= x({6,9}) <= 1
 0 <= x({7,9}) <= 1
 0 <= x({8,9}) <= 1
 0 <= z(0)(0) <= 1
 0 <= z(1)(0) <= 1
      s(0) Free
      W(0) Free
 0 <= z(0)(1) <= 1
 0 <= z(1)(1) <= 1
      s(1) Free
      W(1) Free
      r(6) Free
 0 <= z(0)(2) <= 1
 0 <= z(1)(2) <= 1
      s(2) Free
      W(2) Free
      r(7) Free
 0 <= z(0)(3) <= 1
 0 <= z(1)(3) <= 1
      s(3) Free
      W(3) Free
      r(8) Free
 0 <= z(0)(4) <= 1
 0 <= z(1)(4) <= 1
      s(4) Free
      W(4) Free
      r(9) Free
      r(2) Free
      r(3) Free
 0 <= y(0)(1) <= 1
 0 <= y(0)(2) <= 1
 0 <= y(0)(3) <= 1
 0 <= y(0)(4) <= 1
 0 <= y(1)(0) <= 1
 0 <= y(1)(2) <= 1
 0 <= y(1)(3) <= 1
 0 <= y(1)(4) <= 1
 0 <= y(2)(0) <= 1
 0 <= y(2)(1) <= 1
 0 <= y(2)(3) <= 1
 0 <= y(2)(4) <= 1
 0 <= y(3)(0) <= 1
 0 <= y(3)(1) <= 1
 0 <= y(3)(2) <= 1
 0 <= y(3)(4) <= 1
 0 <= y(4)(0) <= 1
 0 <= y(4)(1) <= 1
 0 <= y(4)(2) <= 1
 0 <= y(4)(3) <= 1
Binaries
 x({3,2})  x({5,2})  x({6,2})  x({7,2})  x({8,2})  x({9,2})  x({2,3}) 
 x({5,3})  x({6,3})  x({7,3})  x({8,3})  x({9,3})  x({2,5})  x({3,5}) 
 x({6,5})  x({7,5})  x({8,5})  x({9,5})  x({2,6})  x({3,6})  x({5,6}) 
 x({7,6})  x({8,6})  x({9,6})  x({2,7})  x({3,7})  x({5,7})  x({6,7}) 
 x({8,7})  x({9,7})  x({2,8})  x({3,8})  x({5,8})  x({6,8})  x({7,8}) 
 x({9,8})  x({2,9})  x({3,9})  x({5,9})  x({6,9})  x({7,9})  x({8,9})  z(0)(0) 
 z(1)(0)  z(0)(1)  z(1)(1)  z(0)(2)  z(1)(2)  z(0)(3)  z(1)(3)  z(0)(4) 
 z(1)(4)  y(0)(1)  y(0)(2)  y(0)(3)  y(0)(4)  y(1)(0)  y(1)(2)  y(1)(3) 
 y(1)(4)  y(2)(0)  y(2)(1)  y(2)(3)  y(2)(4)  y(3)(0)  y(3)(1)  y(3)(2) 
 y(3)(4)  y(4)(0)  y(4)(1)  y(4)(2)  y(4)(3) 
End
