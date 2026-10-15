//
// Created by skylinebnr334 on 2026/09/02.
//

#ifndef NUMATAPDF_TOOL_PDFKIT_MANAGER_H
#define NUMATAPDF_TOOL_PDFKIT_MANAGER_H
#import <Foundation/Foundation.h>
#import <PDFKit/PDFKit.h>
#ifdef __OBJC__
#endif
class pdfkit_manager
{
    public:
        pdfkit_manager();
        NSString* stringWithUTF8String(const char*);
private:
    NSString* (*_stringWithUTF8String)(Class,SEL,const char*);
    Class _NSString;
    SEL _stringWithUTF8String_SEL;
};


#endif //NUMATAPDF_TOOL_PDFKIT_MANAGER_H
