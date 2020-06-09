program TupleTest;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
// Only one of the next two lines should be uncommented.
//  DUnitTestRunner, // uncomment to use DUnit, or
  TestInsight.Dunit, // uncomment to use TestInsight
  Generics.Tuples in '..\Generics.Tuples.pas',
  Generics.Tuples.Test in 'Generics.Tuples.Test.pas';

{R *.RES}

begin
  ReportMemoryLeaksOnShutdown := True;
  RunRegisteredTests;
end.

