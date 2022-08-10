unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TEdit;
    btnTraduzirParaRomano: TButton;
    edtRomano: TEdit;
    btnTraduzirParaDecimal: TButton;
    grdTabela: TStringGrid;
    bllAviso: TBalloonHint;
    procedure btnTraduzirParaRomanoClick(Sender: TObject);
    procedure btnTraduzirParaDecimalClick(Sender: TObject);
    procedure edtRomanoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    const
      CharRomano = ['C', 'D', 'I', 'L', 'M', 'V', 'X'];

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function IntToRomano(nmNumeroInput: Integer): string;
const

  nmNumeros: array [1..13] of integer =
    (1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);

  nmRomanos: array [1..13] of string[2] =
    ('I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C',
    'CD', 'D', 'CM', 'M');
var
  iPosArray: 1..13; //posição do array
  sDeletar : String;

begin
  result := '';
  iPosArray := 13;

  while nmNumeroInput > 0 do
    begin
      while nmNumeros[iPosArray] > nmNumeroInput do  //nmNumero comeca em 1000, se o imput for menor diminui uma pos
        Begin                                        //ate chegar no numero correspondente ao nm imput, caso maior result+M
          dec(iPosArray); // iPosArray - 1
        End;
      dec (nmNumeroInput, nmNumeros[iPosArray]); //numeroInput -  nmNumeros[posAtual] //ex: se add um M, então -1000
      result := result + nmRomanos[iPosArray] //add to result
    end;
end;

function RomanoToInt(nmRomano: String): Integer;
const
  nmRomanos = ['C', 'D', 'I', 'L', 'M', 'V', 'X'];
  valoresRomanos: array['C'..'X'] of Word =
    (100, 500, 0, 0, 0, 0, 1, 0, 0, 50, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 10);
var
  Index, Next: Char;
  I: Integer;
  Negative: Boolean;
begin
  Result := 0;
  I := 0;
  Negative := (Length(nmRomano) > 0) and (nmRomano[1] = '-');
  if Negative then Inc(I);
  while (I < Length(nmRomano)) do begin
    Inc(I);
    Index := UpCase(nmRomano[I]);
    if Index in nmRomanos then begin
      if Succ(I) <= Length(nmRomano) then Next := UpCase(nmRomano[I + 1])
      else Next := #0;
      if (Next in nmRomanos) and (valoresRomanos[Index] < valoresRomanos[Next]) then
      begin
        Inc(Result, valoresRomanos[Next]);
        Dec(Result, valoresRomanos[Index]);
        Inc(I);
      end
      else Inc(Result, valoresRomanos[Index]);
    end
    else begin
      Result := 0;
      Exit;
    end;
  end;
  if Negative then Result := -Result;
end;
procedure TfrmMain.btnTraduzirParaRomanoClick(Sender: TObject);
var
  valorDecimal : Integer;

begin
  if TryStrToInt(edtNumero.Text, valorDecimal) then
    edtRomano.Text := (IntToRomano(StrToInt(edtNumero.Text)));
end;




procedure TfrmMain.edtNumeroChange(Sender: TObject);
var
  valorDecimal : Integer;
    aPoint: TPoint;

begin
  if edtNumero.Text = EmptyStr  then
        edtRomano.Text := EmptyStr;

  if TryStrToInt(edtNumero.Text, valorDecimal) then
    begin
      edtRomano.Text := (IntToRomano(StrToInt(edtNumero.Text)));
      if StrToInt(edtNumero.Text) >= 3999 then
        begin
          bllAviso.Title := 'Os numerais  Romanos são tradicionalemnte'+ #13+
                              '                validos até 3999, ou MMMCMXCIX';
          bllAviso.ShowHint(edtRomano);
        end
      else
         bllAviso.HideHint;
    end;

end;

procedure TfrmMain.edtNumeroKeyPress(Sender: TObject; var Key: Char);
var
i : integer;
const
  ValidChars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', Char(VK_BACK), Char(VK_DELETE)];
begin
  if not CharInSet(CharUpper(key), ValidChars) then
    key := #0;
end;


procedure TfrmMain.edtRomanoKeyPress(Sender: TObject; var Key: Char);
var
i : integer;
const
  ValidChars = ['C', 'D', 'I', 'L', 'M', 'V', 'X', Char(VK_BACK), Char(VK_DELETE)];
begin
  if not CharInSet(CharUpper(key), ValidChars) then
    key := #0;
end;



procedure TfrmMain.FormShow(Sender: TObject);
begin
  grdTabela.Cells[0,0] := 'Simbolo';
  grdTabela.Cells[1,0] := 'Valor';
  grdTabela.Cells[0,1] := 'M';
  grdTabela.Cells[1,1] := '1000';
  grdTabela.Cells[0,2] := 'D';
  grdTabela.Cells[1,2] := '500';
  grdTabela.Cells[0,3] := 'C';
  grdTabela.Cells[1,3] := '100';
  grdTabela.Cells[0,4] := 'L';
  grdTabela.Cells[1,4] := '50';
  grdTabela.Cells[0,5] := 'X';
  grdTabela.Cells[1,5] := '10';
  grdTabela.Cells[0,6] := 'V';
  grdTabela.Cells[1,6] := '5';
  grdTabela.Cells[0,7] := 'I';
  grdTabela.Cells[1,7] := '1';
end;


procedure TfrmMain.btnTraduzirParaDecimalClick(Sender: TObject);
var
  valorRomano : String;
  bRomanoValido : Boolean;
  i : integer;
begin
  edtNumero.Text := (RomanoToInt(edtRomano.Text).ToString);
  edtRomano.Text := (IntToRomano(StrToInt(edtNumero.Text)));
end;


end.
