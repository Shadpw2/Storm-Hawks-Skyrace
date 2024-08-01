# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/symbol.py
# Compiled at: 2008-12-16 09:37:52
"""Non-terminal symbols of Python grammar (from "graminit.h")."""
single_input = 256
file_input = 257
eval_input = 258
decorator = 259
decorators = 260
funcdef = 261
parameters = 262
varargslist = 263
fpdef = 264
fplist = 265
stmt = 266
simple_stmt = 267
small_stmt = 268
expr_stmt = 269
augassign = 270
print_stmt = 271
del_stmt = 272
pass_stmt = 273
flow_stmt = 274
break_stmt = 275
continue_stmt = 276
return_stmt = 277
yield_stmt = 278
raise_stmt = 279
import_stmt = 280
import_name = 281
import_from = 282
import_as_name = 283
dotted_as_name = 284
import_as_names = 285
dotted_as_names = 286
dotted_name = 287
global_stmt = 288
exec_stmt = 289
assert_stmt = 290
compound_stmt = 291
if_stmt = 292
while_stmt = 293
for_stmt = 294
try_stmt = 295
with_stmt = 296
with_var = 297
except_clause = 298
suite = 299
testlist_safe = 300
old_test = 301
old_lambdef = 302
test = 303
or_test = 304
and_test = 305
not_test = 306
comparison = 307
comp_op = 308
expr = 309
xor_expr = 310
and_expr = 311
shift_expr = 312
arith_expr = 313
term = 314
factor = 315
power = 316
atom = 317
listmaker = 318
testlist_gexp = 319
lambdef = 320
trailer = 321
subscriptlist = 322
subscript = 323
sliceop = 324
exprlist = 325
testlist = 326
dictmaker = 327
classdef = 328
arglist = 329
argument = 330
list_iter = 331
list_for = 332
list_if = 333
gen_iter = 334
gen_for = 335
gen_if = 336
testlist1 = 337
encoding_decl = 338
yield_expr = 339
sym_name = {}
for (_name, _value) in globals().items():
    if type(_value) is type(0):
        sym_name[_value] = _name

def main():
    import sys, token
    if len(sys.argv) == 1:
        sys.argv = sys.argv + ['Include/graminit.h', 'Lib/symbol.py']
    token.main()


if __name__ == '__main__':
    main()