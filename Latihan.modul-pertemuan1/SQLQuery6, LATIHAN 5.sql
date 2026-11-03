-- 1. Buat tabel detail
CREATE TABLE PesananDetail (
PesananDetailID INT IDENTITY(1,1) PRIMARY KEY,
PesananID INT NOT NULL,
ProdukID INT NOT NULL,
Jumlah INT NOT NULL,
CONSTRAINT FK_Detail_Header
FOREIGN KEY (PesananID) REFERENCES PesananHeader(PesananID),
CONSTRAINT FK_Detail_Produk
FOREIGN KEY (ProdukID) REFERENCES Produk(ProdukID)
);
GO
-- 2. Coba hapus tabel Pelanggan (GAGAL)
PRINT 'Mencoba menghapus Pelanggan... (Harusnya Gagal)';
DROP TABLE Pelanggan;
-- Pesan Error: "Could not drop object 'Pelanggan' because it is referenced by
FOREIGN KEY constraint 'FK_Pesanan_Pelanggan'.
GO 

-- 3. Coba hapus tabel PesananHeader (GAGAL)
PRINT 'Mencoba menghapus PesananHeader... (Harusnya Gagal)';
DROP TABLE PesananHeader;
-- Pesan Error: "Could not drop object 'PesananHeader' because it is
referenced by a FOREIGN KEY constraint 'FK_Detail_Header'.
GO


-- 4. Hapus tabel secara berurutan (dari anak ke induk)
PRINT 'Menghapus PesananDetail (tabel anak) terlebih dahulu...';
DROP TABLE PesananDetail;
GO
PRINT 'Menghapus PesananHeader (tabel induk dari detail) ...';
DROP TABLE PesananHeader;
GO
PRINT 'Menghapus Pelanggan (tabel induk dari header)...';
DROP TABLE Pelanggan;
GO 
