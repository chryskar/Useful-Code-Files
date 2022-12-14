clear all;
clc;
close all;

pdfFile = 'Journal_2022_video_front.pdf';
pwd = './';

import org.apache.pdfbox.*
import java.io.*
filename = fullfile(pwd,pdfFile);
jFile = File(filename);
document = pdmodel.PDDocument.load(jFile);
pdfRenderer = rendering.PDFRenderer(document);
count = document.getNumberOfPages();
images = [];
for ii = 1:count
    bim = pdfRenderer.renderImageWithDPI(ii-1, 1000, rendering.ImageType.RGB);
    images = [images (filename(1:end-4)+ ".jpg")];
    
    tools.imageio.ImageIOUtil.writeImage(bim, [filename(1:end-4) num2str(ii)] + ".jpg", 1000);
end
document.close()
