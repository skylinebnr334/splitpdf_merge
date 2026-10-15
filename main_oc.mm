#import <Foundation/Foundation.h>
#import <PDFKit/PDFKit.h>
#include "pdfkit_manager.h"
int main(int argc,char** argv)
{
    @autoreleasepool{
        pdfkit_manager manager;
        if(argc<3)
        {
            NSLog(@"Usage: %@ [input pdf] [output pdf]", manager.stringWithUTF8String(argv[0]));
            return 0;
        }
        NSString* pdfpath=manager.stringWithUTF8String(argv[1]);
        NSString* pdf_Wpath=manager.stringWithUTF8String(argv[2]);
        auto* pdfurl=[NSURL fileURLWithPath:pdfpath];
        NSLog(@"PDF URL:%@",pdfurl);

        @try {
            auto PDFData=[NSData dataWithContentsOfURL:pdfurl];
            auto pdfdoc=[[PDFDocument alloc] initWithData:PDFData];
            auto pdfdoc_W=[[PDFDocument alloc] init];
            auto pagecount=pdfdoc.pageCount;
            NSLog(@"Page Count : %lu",pagecount);
            for(int i=0;i<pagecount;i++)
            {
                PDFPage* page=[pdfdoc pageAtIndex:i];
                NSRect rect=[ page boundsForBox:kPDFDisplayBoxMediaBox];
                NSRect newrect_1;
                NSRect newrect_2;
                NSRect newrect_3;
                NSRect newrect_4;
                newrect_1.origin.x=rect.origin.x;
                newrect_1.origin.y=rect.origin.y;
                newrect_1.size.width=rect.size.width/2.0f;
                newrect_1.size.height=rect.size.height/2.0f;
                newrect_3.origin.x=rect.origin.x+rect.size.width/2.0f;
                newrect_3.origin.y=rect.origin.y;
                newrect_3.size.width=rect.size.width/2.0f;
                newrect_3.size.height=rect.size.height/2.0f;
                newrect_2.origin.x=rect.origin.x;
                newrect_2.origin.y=rect.origin.y+rect.size.height/2.0f;
                newrect_2.size.width=rect.size.width/2.0f;
                newrect_2.size.height=rect.size.height/2.0f;
                newrect_4.origin.x=rect.origin.x+rect.size.width/2.0f;
                newrect_4.origin.y=rect.origin.y+rect.size.height/2.0f;
                newrect_4.size.width=rect.size.width/2.0f;
                newrect_4.size.height=rect.size.height/2.0f;
                PDFPage* newpage_1=[page copy];
                PDFPage* newpage_2=[page copy];
                PDFPage* newpage_3=[page copy];
                PDFPage* newpage_4=[page copy];
                [newpage_1  setBounds: newrect_1 forBox:kPDFDisplayBoxCropBox];
                [newpage_2  setBounds: newrect_2 forBox:kPDFDisplayBoxCropBox];
                [newpage_3  setBounds: newrect_3 forBox:kPDFDisplayBoxCropBox];
                [newpage_4  setBounds: newrect_4 forBox:kPDFDisplayBoxCropBox];
               [pdfdoc_W insertPage:newpage_1 atIndex:pdfdoc_W.pageCount];
               [pdfdoc_W insertPage:newpage_2 atIndex:pdfdoc_W.pageCount];
               [pdfdoc_W insertPage:newpage_3 atIndex:pdfdoc_W.pageCount];
               [pdfdoc_W insertPage:newpage_4 atIndex:pdfdoc_W.pageCount];

            }
            [pdfdoc_W writeToFile:pdf_Wpath];
        }
        @catch(NSException* e)
        {
            NSLog(@"Failed to Open File");
            @throw e;
        }
    }
    return 0;
}
