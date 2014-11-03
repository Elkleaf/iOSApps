//
//  main.m
//  Assignment2
//
//  Created by Matthew Elko on 9/3/14.
//  Copyright (c) 2014 Matthew Elko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <string.h>
#import <stdio.h>

@interface WordsList : NSObject
{

   
    NSMutableArray *_words;
    NSString *_WordToCheck;
    int _numberOfWords;
    


}

-(id)initWithWord:(NSString*)someWord WordToCheck:(NSString*)aWord;
-(int)numberOfWords;
-(void)addWord:(NSString*)newWord;
-(void)print;



@end

@implementation WordsList


-(id)initWithWord:(NSString*)someWord WordToCheck:(NSString*)aWord
    {
        self = [super init];
        if(self !=nil){
            _words = [[NSMutableArray alloc] init];
            _WordToCheck = [NSString stringWithString:aWord];
            [_words addObject:someWord];
            _numberOfWords = 0;
        }
        return self;
    }
-(int)numberOfWords{
    return _numberOfWords;
}
-(void)addWord:(NSString*)newWord{
    [_words addObject:newWord];
    _numberOfWords++;
}
-(void)print{
    printf("The largest set of anagrams contains %i words: \n", (_numberOfWords +1));
    for(NSString *s in _words)
    {
        printf("%s", [s UTF8String]);
    }
   
}


@end

int char_cmp(const void *a, const void* b)
{
    return *(char*)a - *(char*)b;
}

int main(int argc, const char * argv[])
{
    
    
    @autoreleasepool {
        double TotalTime;
        clock_t begin, end;
        NSString *keyValue = [[NSString alloc] init];
        int MaxCount = 0;
        char string[256]; //temporary string buffer to hold one line from the file
        
        //creates NSStrings to hold the values of the word being read in(TempWord)
        //and creates a string to hold the value of the sorted word (tempkey)
        NSString *tempWord = [[NSString alloc]init];
        NSString *tempkey = [[NSString alloc] init];
        
        
        //the has map table that will hold all of the different sets of anagrams
        NSMapTable *SortedWords = [[NSMapTable alloc] init];
       
        FILE *fp = fopen("words.txt", "r");
        //start the clock
        begin = clock();
        //reads in one line from file until EOF
        while(fgets(string,256,fp)!=NULL){
            
            tempWord = [NSString stringWithFormat:@"%s",string];
            
            //changes the recently read word into all lowercase
            for (int i = 0; i< (strlen(string)-1); i++) {
                string[i] = tolower(string[i]);
            }
            
            //sort the characters in the word
            qsort(string, strlen(string), sizeof(char), char_cmp);

            tempkey = [NSString stringWithFormat:@"%s", string];
            
            
            //checks to see if there are any word sets in SortedWords; if not, add first one
            if ([SortedWords count] == 0) {
                WordsList * tempList = [[WordsList alloc] initWithWord:tempWord WordToCheck:tempkey];
                [SortedWords setObject:tempList forKey:tempkey];
                
            }
            
            
            //checks to see if the tempkey of the current word isn't in SortedWords; creates
            //new word list
            if ([SortedWords objectForKey:tempkey] == nil) {
                WordsList * tempList = [[WordsList alloc] initWithWord:tempWord WordToCheck:tempkey];
                [SortedWords setObject:tempList forKey:tempkey];
                
            }
            //else, tempkey of current word is a key in one of the word sets and adds the word;
            else{
                WordsList *templist = [[WordsList alloc]init];
                
                templist = [SortedWords objectForKey:tempkey];
                [templist addWord:tempWord];
               
                if ([templist numberOfWords] > MaxCount) {
                    MaxCount = [templist numberOfWords];
                    keyValue = [NSString stringWithString:tempkey];
                    
                }
                
            }
            
        }
        //get the end time and calculate the total time
        end = clock();
        TotalTime = (double)(end-begin)/CLOCKS_PER_SEC;
        
        WordsList *FinalList = [[WordsList alloc] init];
        FinalList = [SortedWords objectForKey:keyValue];
        
        [FinalList print];
        
        
        printf("the time elapsed: %f", TotalTime);
        fclose(fp);
        
        
        
    }
    return 0;
}

