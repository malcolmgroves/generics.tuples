program TupleTest;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  Generics.Tuples in '..\Generics.Tuples.pas',
  Generics.Tuples.Test in 'Generics.Tuples.Test.pas';

{R *.RES}

begin
  ReportMemoryLeaksOnShutdown := True;
  DUnitTestRunner.RunRegisteredTests;
end.

