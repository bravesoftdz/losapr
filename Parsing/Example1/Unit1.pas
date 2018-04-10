unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Memo2: TMemo;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

//������� ��������
function parse(StartString, FinishString, FullString: string): string;
var
  n1,n2: integer;
begin
  n1:=pos(StartString, FullString)+length(StartString)-1;                       //����������� ��������� �����
  Delete(FullString,1,n1);                                                      //�������� ������ �� ������ � �� ���������� ������
  n2:=pos(FinishString, FullString);                                            //����������� �������� �����
  Delete(FullString,n2,length(FullString));                                     //�������� ������ �� ��������� ������ � �� ����� ������
  Result:=FullString;                                                           //�������� ��������� �������
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption:=parse(edit1.Text, edit3.Text, edit2.Text);
  //edit1.Text - ��������� �����
  //edit3.Text - �������� �����
  //edit2.Text - ������ ����� ������ ������� ����� �������
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  str: TStringList;                                                             //������ �����
  s: string;                                                                    //�����������, � ������� �������� ������ ��� ��������
  i: Integer;                                                                   //����������-�������
begin
  s:=edit2.Text;

  try
    str := TStringList.create;                                                  //������� ������ �����
    str.text := stringReplace(s, '-', ' ', [rfReplaceAll]);                     //�������� ��� ������� "-" �� �������
    str.text := stringReplace(str.text, ';', ' ', [rfReplaceAll]);              //�������� ��� ������� ";" �� �������
    str.text := stringReplace(str.text, ',', ' ', [rfReplaceAll]);              //�������� ��� ������� "," �� �������
    str.text := stringReplace(str.text, '.', ' ', [rfReplaceAll]);              //�������� ��� ������� "." �� �������
    str.text := stringReplace(str.text, '(', ' ', [rfReplaceAll]);              //�������� ��� ������� "(" �� �������
    str.text := stringReplace(str.text, ')', ' ', [rfReplaceAll]);              //�������� ��� ������� ")" �� �������
    str.text := stringReplace(str.text, '!', ' ', [rfReplaceAll]);              //�������� ��� ������� "!" �� �������
    str.text := stringReplace(str.text, '?', ' ', [rfReplaceAll]);              //�������� ��� ������� "?" �� �������
    str.text := stringReplace(str.text, '"', ' ', [rfReplaceAll]);              //�������� ��� ������� """ �� �������
    str.text := stringReplace(str.text, '�', ' ', [rfReplaceAll]);              //�������� ��� ������� "�" �� �������
    str.text := stringReplace(str.text, '   ', ' ', [rfReplaceAll]);            //�������� ��� ������� "   " �� �������
    str.text := stringReplace(str.text, '  ', ' ', [rfReplaceAll]);             //�������� ��� ������� "  " �� �������
    str.text := stringReplace(str.text, '#9', ' ', [rfReplaceAll]);             //�������� ��� ������� "���������" �� �������

    str.text := stringReplace(str.text, ' ', #13#10, [rfReplaceAll]);           //����� ������ ���� ������ ����������/��������/���������� �� ������� ������ ������, ��������� ������ ����� �� ����� ������ � ������� � ������

  for i := 0 to str.Count-1 do
    Memo2.Lines.Add(str[i]);                                                    //������� ����������� ������ � Memo2
  finally
    str.free;
  end;

end;

end.
