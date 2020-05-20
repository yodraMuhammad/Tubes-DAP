program perpusatakaan1;
uses crt;
const nMAx=20;
type
        buku = record
        namaBuku:string;
        penerbit:string;
        iTahun:longint;
        iBuku:integer;
end;
type
        tabLokasi=record
        namaLokasi:string;
        nBuku:integer;
        tabBuku:array[1..nMAX]of buku;
end;
type
        lokasi = record
        nLokasi:array[1..nMAX]of tabLokasi;
        iLokasi:integer;
        stat:boolean;
end;
procedure inputLokasi(var t:lokasi);
var
        N,i:integer;
begin
        clrscr;
        writeln('=================================================================');
        writeln('=                         input Lokasi                          =');
        writeln('=================================================================');
        writeln;
        write('Masukan Jumlah Lokasi yang akan di inputkan : ');readln(N);
        i:=1;
        while(i<=N) do
        begin
          t.iLokasi:=t.iLokasi+1;
          Write('Masukan Nama Lokasi ke ',t.iLokasi,' : ');
          readln(t.nLokasi[t.iLokasi].namaLokasi);
          i:=i+1;
        end;
end;
procedure inputBuku(var t:lokasi);
var
        i,n,pil,x:integer;
begin
        if (t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('                        Input data buku                          ');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
          repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                       Input data buku                         =');
            writeln('=================================================================');
            writeln;
            writeln('Pilih Lokasi Buku : ');
            n:=t.ilokasi;
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;
            write('pilih nomer lokasi : ');
            readln(pil);
          until(pil<>0)and(pil<=t.ilokasi);
          i:=1;
          write('Input Jumlah Buku : ');readln(N);
          writeln;
          x:=t.nLokasi[pil].Nbuku;
          while(i<=n)do
          begin
            x:=x+1;
            writeln('Input data buku ke-',x);
            write('Nama buku    : ');readln(t.nLokasi[pil].tabBuku[i].namaBuku);
            write('Penerbit     : ');readln(t.nLokasi[pil].tabBuku[i].penerbit);
            write('Tahun terbit : ');readln(t.nLokasi[pil].tabBuku[i].iTahun);
            write('Jumlah Buku  : ');readln(t.nLokasi[pil].tabBuku[i].iBuku);
            writeln;
            i:=i+1;            
          end;
          t.nLokasi[pil].Nbuku:=x;
        end;
end;
procedure ubahNLokasi(var t:lokasi);
var
        i,pil:integer;
begin
        if (t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                       Ubah Nama Lokasi                        =');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia, tekan "enter" untuk kembali');
          readln;
        end
        else
        begin
          repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                      Ubah Nama Lokasi                         =');
            writeln('=================================================================');
            writeln;
            writeln('Pilih Lokasi yang aka di-edit : ');
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;
            write('pilih nomer lokasi : ');
            readln(pil);
          until(pil<>0)and(pil<=t.ilokasi);
          write('nama lokasi baru : ' );readln(t.nLokasi[pil].namaLokasi);
        end;
end;
procedure delLokasi(var t:lokasi);
var
        i,pil:integer;
begin
        if (t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                        Hapus Lokasi                           =');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
          repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                        Hapus Lokasi                           =');
            writeln('=================================================================');
            writeln;
            writeln('Jumlah Lokasi :',t.iLokasi);
            writeln('Pilih Lokasi yang akan dihapus : ');
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;            
            write('pilih nomer lokasi : ');
            readln(pil);
          until(pil<>0)and(pil<=t.iLokasi);
          while (pil<t.iLokasi)do
          begin
            t.nLokasi[pil].namaLokasi:=t.nLokasi[pil+1].namaLokasi;
            pil:=pil+1;
          end;
          t.iLokasi:=t.ILokasi-1;
        end
end;
procedure editLokasi(var t:lokasi);
var
  pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                           Edit Lokasi                         =');
          writeln('=================================================================');
          writeln;
          writeln('1. Ubah Nama Lokasi');
          writeln('2. Hapus Nama Lokasi');
          writeln('3. Kembali');
          write('Pilihan : ');readln(pil);
          case pil of
              1:ubahNLokasi(t);
              2:delLokasi(t);
            end;
        until(pil=3);
end;
procedure ubahData(var t:lokasi);
var
        i,pil,pil2:integer;
begin
        if (t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('                        Edit Data Buku                           ');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
          repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                       Edit Data Buku                          =');
            writeln('=================================================================');
            writeln;
            writeln('Pilih Lokasi Buku : ');
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;
            write('pilih nomer lokasi : ');
            readln(pil);
          until(pil<>0)and(pil<=t.ilokasi);
          i:=1;
          if(t.nLokasi[pil].Nbuku=0)then
          begin
            writeln;
            write('Data buku belum tersedia, tekan "enter" untuk kembali');readln;
          end
          else
          begin
            write('Jumlah Buku : ');Writeln(t.nLokasi[pil].tabBuku[i].namaBuku);
            writeln('Pilih buku yang akan di-edit :');
            while(i<=t.nLokasi[pil].Nbuku)do
            begin
              write(i,'. ');writeln(t.nLokasi[pil].tabBuku[i].namaBuku);
              i:=i+1;
            end;
            write('Pilihan : ');readln(pil2);
            writeln;
            writeln('Masukan data baru');
            write('Nama buku    : ');readln(t.nLokasi[pil].tabBuku[pil2].namaBuku);
            write('Penerbit     : ');readln(t.nLokasi[pil].tabBuku[pil2].penerbit);
            write('Tahun terbit : ');readln(t.nLokasi[pil].tabBuku[pil2].iTahun);
            write('Jumlah Buku  : ');readln(t.nLokasi[pil].tabBuku[pil2].iBuku);
            writeln;
            write('Data sudah di-update, tekan "enter" untuk kembali');readln;
          end
        end;
end;
procedure delBuku(var t:lokasi);
var
        i,pil,pil2:integer;
begin
        if (t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('                        Hapus Data Buku                          ');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
          repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                      Hapus Data Buku                          =');
            writeln('=================================================================');
            writeln;
            writeln('Pilih Lokasi Buku : ');
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;
            write('pilih nomer lokasi : ');
            readln(pil);
          until(pil<>0)and(pil<=t.ilokasi);
          if(t.nLokasi[pil].Nbuku=0)then
          begin
            writeln;
            write('Data buku belum tersedia, tekan "enter" untuk kembali');readln;
          end
          else
          begin
            write('Jumlah Buku : ');Writeln(t.nLokasi[pil].tabBuku[i].namaBuku);
            writeln('Pilih buku yang akan dihapus :');
            i:=1;
            while(i<=t.nLokasi[pil].Nbuku)do
            begin
              write(i,'. ');writeln(t.nLokasi[pil].tabBuku[i].namaBuku);
              i:=i+1;
            end;
            write('Pilihan : ');readln(pil2);
            while (pil2<t.nLokasi[pil].nBuku)do
            begin
              t.nLokasi[pil].tabBuku[pil2].namaBuku  :=t.nLokasi[pil].tabBuku[pil2+1].namaBuku;
              t.nLokasi[pil].tabBuku[pil2].penerbit  :=t.nLokasi[pil].tabBuku[pil2+1].penerbit;
              t.nLokasi[pil].tabBuku[pil2].iTahun    :=t.nLokasi[pil].tabBuku[pil2+1].iTahun;
              t.nLokasi[pil].tabBuku[pil2].iBuku     :=t.nLokasi[pil].tabBuku[pil2+1].iBuku;
              pil2:=pil2+1;
            end;
            t.nLokasi[pil].nBuku:=t.nLokasi[pil].nBuku-1;
          end
        end
end;
procedure editBuku(var t:lokasi);
var
        pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                           Edit buku                           =');
          writeln('=================================================================');
          writeln;
          writeln('1. Ubah Data Buku');
          writeln('2. Hapus Data Buku');
          writeln('3. Kembali');
          write('Pilihan : ');readln(pil);
          case pil of
            1: ubahData(t);
            2: delBuku(t);
          end;
        until(pil=3);
end;
procedure urutLokasi(t:lokasi);
var 
        pass,i,temp:integer;
        temp2:string;
begin
        if(t.iLokasi>0)then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                        Menampilkan Lokasi                     =');
          writeln('=================================================================');
          writeln;
          for pass:=2 to t.iLokasi do
          begin
            i:=pass + 1;
            temp:=t.nlokasi[i].nBuku;
            temp2:=t.nlokasi[i].namaLokasi;
            while((i>1)and(temp<t.nlokasi[i].nBuku))do
            begin
              t.nlokasi[i].nBuku:=t.nlokasi[i-1].nBuku;
              t.nlokasi[i].namaLokasi:=t.nlokasi[i-1].namaLokasi;
              i:=i-1;
            end;
            t.nlokasi[i].nBuku:=temp;
            t.nlokasi[i].namaLokasi:=temp2;
          end;
          writeln;
          i:=1;
          writeln('Jumlah judul Buku | Nama Buku');
          while(i<=t.iLokasi)do
          begin
              write(t.nlokasi[i].nBuku,'                   ');writeln(t.nlokasi[i].namaLokasi);
              i:=i+1;
          end;
          writeln;
          write('Tekan "Enter" untuk kembali');readln;
        end
        else
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                        Menampilkan Lokasi                     =');
          writeln('=================================================================');
          writeln;
          write('Lokasi belum tersedia, tekan "Enter" untuk kembali');readln;
        end
end;
procedure tampilLokasi(t:lokasi);
var 
        i,n:integer;
begin
        if(t.iLokasi>0)then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                        Menampilkan Lokasi                     =');
          writeln('=================================================================');
          writeln;
          i:=1;
          while(i<=t.iLokasi) do
          begin
            Write('Nama Lokasi ke ',i,' : ');
            writeln(t.nLokasi[i].namaLokasi);
            if(t.nLokasi[i].nBuku>0)then
            begin
              n:=1;
              while(n<=t.nLokasi[i].nBuku)do
              begin
                writeln('buku ke-',n);
                write('Nama buku    : ');writeln(t.nLokasi[i].tabBuku[n].namaBuku);
                write('Jumlah Buku  : ');writeln(t.nLokasi[i].tabBuku[n].iBuku);
                writeln;
                n:=n+1;
              end;
            end
            else
            begin
              writeln('Buku belum tersedia');
              writeln;
            end;
          i:=i+1;
          end;
          write('Tekan "Enter" untuk kembali');readln;
        end
        else
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                        Menampilkan Lokasi                     =');
          writeln('=================================================================');
          writeln;
          write('Lokasi belum tersedia, tekan "Enter" untuk kembali');readln;
        end
end;
procedure outputLokasi(t:lokasi);
var
        pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                        Menampilkan Lokasi                     =');
          writeln('=================================================================');
          writeln;
          writeln('1. Urutkan menurut banyaknya judul buku');
          writeln('2. Tampilkan Data lokasi');
          writeln('3. Kembali');
          write('Pilihan : ');readln(pil);
          case pil of
            1: urutLokasi(t);
            2: tampilLokasi(t);
          end;
         until(pil=3);
        {}
end;
procedure urutJumlah(t:lokasi);
var
        pass,i,temp,pil:integer;
        temp2:string;
begin
        if (t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                      Tampilkan data buku                      =');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
          repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                      Tampilkan data buku                      =');
            writeln('=================================================================');
            writeln;
            writeln('Pilih Lokasi Buku : ');
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;
            write('pilih nomer lokasi : ');
            readln(pil);
          until(pil<>0)and(pil<=t.ilokasi);
          for pass:=2 to t.nLokasi[pil].nBuku do
          begin
            i:=pass + 1;
            temp:=t.nlokasi[pil].tabBuku[i].iBuku;
            temp2:=t.nlokasi[pil].tabBuku[i].namaBuku;
            while((i>1)and(temp>t.nlokasi[pil].tabBuku[i].iBuku))do
            begin
              t.nlokasi[pil].tabBuku[i].iBuku:=t.nlokasi[pil].tabBuku[i-1].iBuku;
              t.nlokasi[pil].tabBuku[i].namaBuku:=t.nlokasi[pil].tabBuku[i-1].namaBuku;
              i:=i-1;
            end;
            t.nlokasi[pil].tabBuku[i].iBuku:=temp;
            t.nlokasi[pil].tabBuku[i].namaBuku:=temp2;
            end;
            writeln;
            i:=1;
            writeln('Jumlah Buku | Nama Buku');
            while(i<=t.nLokasi[pil].nBuku)do
            begin
              write('  ',t.nlokasi[pil].tabBuku[i].iBuku,'          ');writeln(t.nlokasi[pil].tabBuku[i].namaBuku);
              i:=i+1;
            end;
            writeln;
            write('Tekan "enter" untuk kembali');readln;
        end
end;
procedure urutTahun(t:lokasi);
var
        pass,i,temp,pil:integer;
        temp2:string;
begin
        if (t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                      Tampilkan data buku                      =');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
         repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                      Tampilkan data buku                      =');
            writeln('=================================================================');
            writeln;
            writeln('Pilih Lokasi Buku : ');
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;
            write('pilih nomer lokasi : ');
            readln(pil);
          until(pil<>0)and(pil<=t.ilokasi);
          pass:=1;
          for pass:=1 to t.nLokasi[pil].nBuku do
          begin
            i:=pass + 1;
            temp:=t.nlokasi[pil].tabBuku[i].iTahun;
            temp2:=t.nlokasi[pil].tabBuku[i].namaBuku;
            while((i>1)and(temp<t.nlokasi[pil].tabBuku[i].iBuku))do
            begin
              t.nlokasi[pil].tabBuku[i].iTahun:=t.nlokasi[pil].tabBuku[i-1].iTahun;
              t.nlokasi[pil].tabBuku[i].namaBuku:=t.nlokasi[pil].tabBuku[i-1].namaBuku;
              i:=i-1;
            end;
            t.nlokasi[pil].tabBuku[i].iTahun:=temp;
            t.nlokasi[pil].tabBuku[i].namaBuku:=temp2;
            end;
            writeln;
            i:=1;
            writeln('Tahun Terbit | Nama Buku');
            while(i<=t.nLokasi[pil].nBuku)do
            begin
              write(t.nlokasi[pil].tabBuku[i].iTahun,'             ');writeln(t.nlokasi[pil].tabBuku[i].namaBuku);
              i:=i+1;
            end;
            writeln;
            write('Tekan "enter" untuk kembali');readln;
        end
end;
procedure tampilData(t:lokasi);
var
  i,pil:integer;
begin
        if(t.ilokasi=0) then
        begin
          clrscr;
          writeln('=================================================================');
          writeln('=                      Tampilkan data buku                      =');
          writeln('=================================================================');
          writeln;
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
          repeat
            clrscr;
            writeln('=================================================================');
            writeln('=                      Tampilkan data buku                      =');
            writeln('=================================================================');
            writeln;
            writeln('Pilih Lokasi Buku : ');
            i:=1;
            while(i<=t.iLokasi)do
            begin
              writeln(i,'. ',t.nLokasi[i].namaLokasi);
              i:=i+1;
            end;
            write('pilih nomer lokasi : ');readln(pil);
          until(pil<=t.iLokasi)and(pil<>0);
          write('Jumlah Buku : ');writeln(t.nLokasi[pil].nBuku);
          writeln;
          i:=1;
          repeat
            writeln('Data ke-',i);
            write('Nama buku    : ');writeln(t.nLokasi[pil].tabBuku[i].namaBuku);
            write('Penerbit     : ');writeln(t.nLokasi[pil].tabBuku[i].penerbit);
            write('Tahun terbit : ');writeln(t.nLokasi[pil].tabBuku[i].iTahun);
            write('Jumlah Buku  : ');writeln(t.nLokasi[pil].tabBuku[i].iBuku);
            writeln;
            i:=i+1;
          write('Tekan "Enter" untuk Kembali');readln;
          until (i=t.nLokasi[pil].nBuku);
          end;
end;
procedure outputBuku(t:lokasi);
var
        pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                      Tampilkan data buku                      =');
          writeln('=================================================================');
          writeln;
          writeln('1. Urutkan menurut jumlah yang tersedia');
          writeln('2. Urutkan menurut tahun terbit');
          writeln('3. Tampilkan seluruh data buku');
          writeln('4. Kembali');
          write('Pilihan : ');readln(pil);
          case pil of
                  1:urutJumlah(t);
                  2:urutTahun(t);
                  3:tampilData(t);
          end;
        until(pil=4);
end;
Procedure MenuInput(var t:lokasi);
var
        pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                            Menu input                         =');
          writeln('=================================================================');
          writeln;
          writeln('1. Input Lokasi Buku');
          writeln('2. Input Buku');
          writeln('3. Edit Lokasi');
          writeln('4. Edit Data Buku');
          writeln('5. Kembali');
          write('Masukan Pilihan : ');readln(pil);
          case pil of
            1:inputLokasi(t);
            2:inputBuku(t);
            3:editLokasi(t);
            4:editBuku(t);
          end;
        until(pil=5);
end;
procedure menuOutput(t:lokasi);
var
        pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                          Menu Output                          =');
          writeln('=================================================================');
          writeln;
          writeln('1. Tampilkan Lokasi');
          writeln('2. Tampilkan Data Buku');
          writeln('3. Kembali');
          write('Masukan Pilihan : ');
          readln(pil);
          case pil of
                1:outputLokasi(t);
                2:outputBuku(t);
          end;
        until(pil=3)
end;
procedure cariLokasi(t:lokasi);
var
  i:integer;
  key:string;
begin
        clrscr;
        writeln('=================================================================');
        writeln('=                          Cari Lokasi                          =');
        writeln('=================================================================');
        writeln;
        if (t.ilokasi=0) then
        begin
          writeln('Lokasi belum tersedia "tekan enter untuk kembali"');
          readln;
        end
        else
        begin
          write('Nama lokasi yang akan dicari : ');readln(key);
          i:=0;
          while(key<>t.nLokasi[i].namalokasi)and(i<t.iLokasi)do
          begin
            i:=i+1;
          end;
          if(key=t.nLokasi[i].namalokasi)then
            writeln('Lokasi ada pada daftar')
          else
            writeln('Lokasi tidak ada pada daftar');
          writeln;
          write('tekan "enter" untuk kembali');readln;
        end
end;
procedure cariBuku(t:lokasi);
var
        i,n:integer;
        key:string;
        status:boolean;
begin
        clrscr;
        writeln('=================================================================');
        writeln('=                            Cari Buku                          =');
        writeln('=================================================================');
        writeln;
        if (t.ilokasi=0) then
        begin
          writeln('Lokasi belum tersedia, tekan "enter" untuk kembali');
          readln;
        end
        else
        begin
          write('Nama buku yang akan dicari : ');readln(key);
          i:=1;
          status:=false;
          while(not(status)and(i<=t.ilokasi))do
          begin
            n:=1;
            while(not(status)and(n<=t.nLokasi[i].nBuku))do
            begin
              if((t.nLokasi[i].tabBuku[n].namaBuku<>key))then
                n:=n+1
              else
                status:=true;
            end;
            i:=i+1;
          end;
          if (status)then
            writeln('Buku ada pada lokasi ',t.nlokasi[i-1].namaLokasi)
          else
            writeln('Buku tidak ada pada daftar');
          writeln;
          write('Tekan "enter" untuk kembali');readln;
        end;
end;
procedure menuCari(t:lokasi);
var
        pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                            Menu Cari                          =');
          writeln('=================================================================');
          writeln;
          writeln('1. Cari Lokasi');
          writeln('2. Cari Buku');
          writeln('3. Kembali');
          write('Pilihan : ');readln(pil);
          case pil of
            1:cariLokasi(t);
            2:cariBuku(t);
          end;
        until(pil=3);
end;

Procedure menuUtama(var t:lokasi);
var
        pil:integer;
begin
        repeat
          clrscr;
          writeln('=================================================================');
          writeln('=                    PROGRAM PERPUSTAKAN 1                      =');
          writeln('=================================================================');
          writeln;
          writeln('1. Edit Data');
          writeln('2. Tampilkan Data');
          writeln('3. Cari Data');
          writeln('4. Keluar Program');
          write('Masukan pilihan : ');readln(pil);
          case pil of
            1:menuINput(t);
            2:menuOutput(t);
            3:menuCari(t);
          end;
        until(pil=4);
end;

var
        t:lokasi;
begin
        menuUtama(t);
end.