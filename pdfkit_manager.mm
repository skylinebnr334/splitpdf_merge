//
// Created by skylinebnr334 on 2026/09/02.
//

#include "pdfkit_manager.h"

pdfkit_manager::pdfkit_manager()
{
    _NSString=[NSString class];
    _stringWithUTF8String_SEL=@selector(stringWithUTF8String:);
    _stringWithUTF8String=(NSString* (*)(Class,SEL,const char*))[NSString methodForSelector:_stringWithUTF8String_SEL];
}
NSString* pdfkit_manager::stringWithUTF8String(const char* value)
{
    return _stringWithUTF8String(_NSString,_stringWithUTF8String_SEL,value);
}