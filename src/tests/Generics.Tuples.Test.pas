unit Generics.Tuples.Test;

interface

uses
  TestFramework, Generics.Tuples;

type
  // Test methods for class TTuple
  TestTPair = class(TTestCase)
  published
    procedure TestOrdinalTypes;
    procedure TestStringType;
    procedure TestClassType;
    procedure TestFunctionReturnClassType;
  end;

  TestTTuple3 = class(TTestCase)
  published
    procedure TestOrdinalTypes;
    procedure TestClassType;
  end;

implementation
uses
  System.Classes, SysUtils;

const
  LValue1 = 10;
  LValue2 = 20;
  LValue3 = 30;

{ TestTTuple }

procedure TestTPair.TestClassType;
var
  LTuple : ITuple<TComponent, TComponent>;
begin
  LTuple := TTuple<TComponent, TComponent>.Create( TComponent.Create(nil),
                                                  TComponent.Create(nil));
  LTuple.Value1.Tag := LValue1;
  LTuple.Value2.Tag := LValue2;
  CheckEquals(LValue1, LTuple.Value1.Tag);
  CheckEquals(LValue2, LTuple.Value2.Tag);
end;

procedure TestTPair.TestFunctionReturnClassType;
var
  LTupleBuilderFunc : TFunc<Integer, TComponent, ITuple<Integer, TComponent>>;
  LTuple : ITuple<Integer, TComponent>;
  LComponent : TComponent;
begin
  LTupleBuilderFunc :=  function (Value1 : Integer; Value2 : TComponent) : ITuple<Integer, TComponent>
                        begin
                          Result := TTuple<Integer, TComponent>.Create(Value1, Value2);
                        end;

  LComponent := TComponent.Create(nil);
  LComponent.Tag := LValue2;
  LTuple := LTupleBuilderFunc(LValue1, LComponent);

  CheckEquals(LValue1, LTuple.Value1);
  CheckEquals(LValue2, LTuple.Value2.Tag);
end;

procedure TestTPair.TestOrdinalTypes;
const
  LValue1 = 10;
  LValue2 = 20;
var
  LTuple : ITuple<Integer, Integer>;
begin
  LTuple := TTuple<Integer, Integer>.Create(LValue1, LValue2);
  CheckEquals(LValue1, LTuple.Value1);
  CheckEquals(LValue2, LTuple.Value2);
end;

procedure TestTPair.TestStringType;
const
  LValue1 = 10;
  LValue2 = 'Value2';
var
  LTuple : ITuple<Integer, String>;
begin
  LTuple := TTuple<Integer, String>.Create(LValue1, LValue2);
  CheckEquals(LValue1, LTuple.Value1);
  CheckEquals(LValue2, LTuple.Value2);
end;

{ TestTTuple3 }

procedure TestTTuple3.TestClassType;
var
  LTuple : ITuple<TComponent, TComponent, TComponent>;
begin
  LTuple := TTuple<TComponent, TComponent, TComponent>.Create( TComponent.Create(nil),
                                                                TComponent.Create(nil),
                                                                TComponent.Create(nil));
  LTuple.Value1.Tag := LValue1;
  LTuple.Value2.Tag := LValue2;
  LTuple.Value3.Tag := LValue3;
  CheckEquals(LValue1, LTuple.Value1.Tag);
  CheckEquals(LValue2, LTuple.Value2.Tag);
  CheckEquals(LValue3, LTuple.Value3.Tag);
end;

procedure TestTTuple3.TestOrdinalTypes;
var
  LTuple : ITuple<Integer, Integer, Integer>;
begin
  LTuple := TTuple<Integer, Integer, Integer>.Create(LValue1, LValue2, LValue3);
  CheckEquals(LValue1, LTuple.Value1);
  CheckEquals(LValue2, LTuple.Value2);
  CheckEquals(LValue3, LTuple.Value3);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPair.Suite);
  RegisterTest(TestTTuple3.Suite);
end.

