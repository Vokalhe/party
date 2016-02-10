//
//  VCViewController.m
//  PartyMaker
//
//  Created by 2 on 05.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "NSString+TimeOfSlider.h"
#import "EVAParty.h"
#import "EVAVCViewController.h"
@class UIButton;

@interface EVAVCViewController () <UITextFieldDelegate, UIScrollViewDelegate, UITextViewDelegate, UIAlertViewDelegate>


@property (nonatomic) UIButton *buttonChooseDate;
@property (nonatomic) UITextField* yourPartyName;
@property (nonatomic) NSDate* pickerDate;
@property (nonatomic) UIDatePicker *datePicker;
@property (nonatomic) UIToolbar *toolBar;
@property (nonatomic) UISlider* sliderSrart;
@property (nonatomic) UISlider* sliderEnd;
@property (nonatomic) UIView* line;
@property (nonatomic) UILabel *labelTimeStart;
@property (nonatomic) UILabel *labelTimeEnd;
@property (nonatomic) UIView* moving;
@property (nonatomic) UIScrollView* viewScroll;
@property (nonatomic) NSString* textDescription;
@property (nonatomic) UIPageControl* pageControl;
@property (nonatomic) UITextView *viewDescription;
@property (nonatomic) UIButton *buttonCancel;
@property (nonatomic) UIButton *buttonSave;
@end

@implementation EVAVCViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - newView!
-(void) newView{
    //Create new VC
    EVAVCViewController *newView = [EVAVCViewController new];
    newView.view = [[UIView alloc]initWithFrame:self.view.frame];
    [newView.view setBackgroundColor:[[UIColor alloc]initWithRed:46/255.f green:49/255.f blue:56/255.f alpha:1]];
    newView.title = @"CREATE PARTY";
    [newView.navigationItem setHidesBackButton:YES];
    //Create UINavigationController with root vc
    UINavigationController *nav = [[UINavigationController new]initWithRootViewController:newView];//
    [nav.navigationBar setBarStyle:UIBarStyleBlack];
    
    //Create log controllers array
    NSLog(@"%@", nav.viewControllers);
    [nav.navigationBar setBarTintColor:[UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1]];
    [self.navigationController.navigationBar setTranslucent:NO];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:@"MyriadPro-Bold" size:15]}];

    [self.navigationController pushViewController:newView animated:YES];


    [newView chooseDate];
    [newView nameTextField];
    [newView newSliders];
    [newView newScrollViews];
    [newView lineBlue];
    [newView newDescription];
    [newView butCancel];
    [newView butSave];
    [newView newLineRight];
  //  [newView creatingSlidersWithLabels];
}

#pragma mark - Button CHOOSE DATE!
-(void) chooseDate{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect){120, 9, 190, 36};
    button.layer.cornerRadius = 5.0f;
    [button setTitle:@"CHOOSE DATE" forState:UIControlStateNormal];
    [button setTitle:@"CHOOSE DATE" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"MyriadPro-Bold" size:16];
    button.backgroundColor = [UIColor colorWithRed:239/255.f green:177/255.f blue:27/255.f alpha:1];
    [button addTarget:self action:@selector(chooseDatePicker)
    forControlEvents:UIControlEventTouchUpInside];
    self.buttonChooseDate = button;
    [self.view addSubview:button];

}

-(void) chooseDatePicker{
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame: CGRectMake(0, 345.5, 320, 158.5)];
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 309.5, 320, 36)];
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    UIBarButtonItem* editCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(Cancel)];
    UIBarButtonItem* editDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(Done)];
    UIBarButtonItem* editSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];;
    editCancel.tintColor = [UIColor whiteColor];
    editDone.tintColor = [UIColor whiteColor];
    toolbar.items = @[editCancel, editSpace, editDone];
    self.datePicker = datePicker;
    self.toolBar = toolbar;
    [self.view addSubview:datePicker];
    [self.view addSubview:toolbar];
    
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 27);
    }];
}

-(void) Cancel{
    [self.toolBar removeFromSuperview];
    [self.datePicker removeFromSuperview];
    
}

-(void) Done{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"MM.dd.yyyy"];
    [self.buttonChooseDate setTitle: [dateFormatter stringFromDate:self.datePicker.date] forState:UIControlStateNormal];
    self.pickerDate = self.datePicker.date;
    [self Cancel];
}

#pragma mark - textField NAME!
-(void) nameTextField{
    UITextField *textField = [[UITextField alloc] initWithFrame:(CGRect){120, 56, 190, 39.5}];
    textField.layer.cornerRadius = 4.0f;
    
     NSAttributedString *stroka = [[NSAttributedString alloc] initWithString:@"Your party name" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:76/255.f green:82/255.f blue:92/255.f alpha:1]}];
    textField.attributedPlaceholder = stroka;
    [textField setTextAlignment:NSTextAlignmentCenter];
    textField.font = [UIFont fontWithName:@"MariadPro-Regular" size:16];
    textField.backgroundColor = [UIColor colorWithRed:35/255.f green:37/255.f blue:43/255.f alpha:1];
    textField.textColor = [UIColor whiteColor];
    [textField setReturnKeyType:UIReturnKeyDone];
   
    textField.delegate = self;
    self.yourPartyName = textField;
    [self.view addSubview:textField];
}

- (BOOL) textFieldShouldReturn:(UITextField*) textField;{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 76);
    }];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - sliders Time!
-(void) newSliders{//!!!!!
    UISlider *startSlider = [[UISlider alloc] initWithFrame:(CGRect){120, 107, 190, 31}];
    UISlider *endSlider = [[UISlider alloc] initWithFrame:(CGRect){120, 149, 190, 31}];
    startSlider.minimumValueImage = [UIImage imageNamed:@"TimePopup"];
    endSlider.maximumValueImage = [UIImage imageNamed:@"TimePopupOn180"];
    
    startSlider.value = 0.f;
    endSlider.value = 0.f;
   
    startSlider.minimumTrackTintColor = [UIColor colorWithRed:238/255.f green:179/255.f blue:31/255.f alpha:1];
    startSlider.maximumTrackTintColor = [UIColor colorWithRed:29/255.f green:31/255.f blue:36/255.f alpha:1];
    endSlider.minimumTrackTintColor = [UIColor colorWithRed:238/255.f green:179/255.f blue:31/255.f alpha:1];
    endSlider.maximumTrackTintColor = [UIColor colorWithRed:29/255.f green:31/255.f blue:36/255.f alpha:1];
    
    self.sliderSrart = startSlider;
    self.sliderEnd = endSlider;
    [self.view addSubview:startSlider];
    [self.view addSubview:endSlider];
    
    
    [endSlider addTarget:self action:@selector(endSliderChanged) forControlEvents:UIControlEventValueChanged];
    [endSlider addTarget:self action:@selector(endSliderTouched) forControlEvents:UIControlEventValueChanged];
    [startSlider addTarget:self action:@selector(startsSliderChanged) forControlEvents:UIControlEventValueChanged];
    [startSlider addTarget:self action:@selector(startsSliderTouched) forControlEvents:UIControlEventValueChanged];
    
    UILabel *labelTimeStart = [[UILabel alloc] initWithFrame:CGRectMake(120, 107, 40, 31)];
    labelTimeStart.text = @"00:00";
    labelTimeStart.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelTimeStart.textColor = [UIColor whiteColor];
    UILabel *labelTimeEnd = [[UILabel alloc] initWithFrame:CGRectMake(269, 149, 40, 31)];
    labelTimeEnd.text = @"00:30";
    labelTimeEnd.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelTimeEnd.textColor = [UIColor whiteColor];
    
    self.labelTimeStart = labelTimeStart;
    [self.view addSubview:labelTimeStart];
    self.labelTimeEnd = labelTimeEnd;
    [self.view addSubview:labelTimeEnd];
}

- (void) startsSliderChanged{
    int valueInMinutes = self.sliderSrart.value * 1409;
    
    
    if (self.sliderSrart.value - self.sliderEnd.value > 0){
        self.sliderEnd.value = self.sliderSrart.value;
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes + 30]];
        
    }
       else{
           self.sliderSrart.value = self.sliderEnd.value;
           self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];
           self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes + 30]];

    }
}

- (void) endSliderChanged{
        int valueInMinutes = self.sliderEnd.value * 1439;
    if (self.sliderSrart.value - self.sliderEnd.value > 0){
        self.sliderSrart.value = self.sliderEnd.value;
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes - 30]];
        
    }
        else {
            
            self.sliderSrart.value = self.sliderEnd.value;
            self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes - 30]];
            self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];

        }
    
    }

- (void) startsSliderTouched{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 123.5);
    }];
}

- (void) endSliderTouched{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 164.5);
    }];
}

#pragma mark - IMAGE!
- (void) newScrollViews{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(120, 191.5, 190, 100)];
    scrollView.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(190*6, 100);
    scrollView.layer.cornerRadius = 3.0f;
    scrollView.delegate = self;
    for (int i = 0; i < 6; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"PartyLogo_Small_%d", i]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(190*i, 0, 190, 80)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView setImage:image];
        [scrollView addSubview:imageView];
    }
    self.viewScroll = scrollView;
    [self.view addSubview:scrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(120, 273, 190, 20)];
    pageControl.numberOfPages = 6;
    pageControl.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    [pageControl addTarget:self
                    action:@selector(newPage)
          forControlEvents:UIControlEventValueChanged];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
}

-(void) newPage{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 241);
    }];
    CGPoint contentOffset = CGPointMake(self.viewScroll.frame.size.width * self.pageControl.currentPage, 0);
    [self.viewScroll setContentOffset:contentOffset animated:YES];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 241);
    }];
    NSInteger currentPage = self.viewScroll.contentOffset.x/self.viewScroll.frame.size.width;
    [self.pageControl setCurrentPage:currentPage];

}

#pragma mark - Description!!!
-(void) lineBlue{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(120, 302, 190, 5)];
    line.backgroundColor = [[UIColor alloc] initWithRed:40/255.f green:132/255.f blue:175/255.f alpha:1];
    [self.view addSubview:line];
}

-(void) newDescription{
        UITextView* description = [[UITextView alloc] initWithFrame:CGRectMake(120, 307, 190, 94.5)];
        description.backgroundColor = [UIColor colorWithRed:35/255.f green:37/255.f blue:43/255.f alpha:1];
        description.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
        description.textColor = [UIColor whiteColor];
        description.layer.cornerRadius = 3;
        [self.view addSubview:description];
    
        UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 375, 50)];
        toolbar.barStyle = UIBarStyleBlackOpaque;
        toolbar.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];

        UIBarButtonItem *itemCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                       style:UIBarButtonItemStylePlain target:self action:@selector(buttonCancelOnDescription)];
        UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                     style:UIBarButtonItemStyleDone target:self action:@selector(buttonDoneOnDescription)];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                       target:nil action:nil];
        itemDone.tintColor = itemCancel.tintColor = [UIColor whiteColor];
        toolbar.items = @[itemCancel, flexibleSpace, itemDone];
        [toolbar sizeToFit];
        self.viewDescription = description;
        description.inputAccessoryView = toolbar;
        description.delegate = self;
    }

- (void) buttonCancelOnDescription{
        self.viewDescription.text = self.textDescription;
        [self.viewDescription resignFirstResponder];
    }


- (void) buttonDoneOnDescription{
    
        [self.viewDescription resignFirstResponder];
    }

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView{
        [UIView animateWithDuration:0.3f animations:^{
            self.moving.center = CGPointMake(15, 359.5);
        }];
        return YES;
    }

- (BOOL) textViewShouldEndEditing:(UITextView *)textView{
        self.textDescription = self.viewDescription.text;
        return YES;

    }

-(void)keyboardWillShow:(NSNotification*)notification{
        if(self.viewDescription.isFirstResponder){
            CGRect keyboardRect =
            [[[notification userInfo]
              objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
            float duration =
            [[[notification userInfo]
              objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
            [UIView animateWithDuration:duration animations:^{
                    CGRect viewFrame = self.view.frame;
                     viewFrame.origin.y -= keyboardRect.size.height;
                     self.view.frame = viewFrame;
            }];
        } else{
            return;
        }
    }

-(void)keyboardWillHide:(NSNotification*)notification{
        float duration = [[[notification userInfo]
                           objectForKey:UIKeyboardAnimationDurationUserInfoKey]
                          floatValue];

        [UIView animateWithDuration:duration animations:^{
                        CGRect viewFrame = self.view.frame;
                       viewFrame.origin.y = 64;
                       self.view.frame = viewFrame;
        }];
    }




- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillShow:)
     name:UIKeyboardWillShowNotification
     object:nil];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector: @selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification
     object:nil];

}

#pragma mark - Last buttons, Cancel and Save!
-(void) butCancel{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect){120, 460.5, 190, 35.5};
    button.layer.cornerRadius = 5.0f;
    [button setTitle:@"CANCEL" forState:UIControlStateNormal];
    [button setTitle:@"CANCEL" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"MyriadPro-Bold" size:16];
    button.backgroundColor = [UIColor colorWithRed:236/255.f green:71/255.f blue:19/255.f alpha:1];
    [button addTarget:self action:@selector(touchCancel)
     forControlEvents:UIControlEventTouchUpInside];
    self.buttonCancel = button;
    [self.view addSubview:button];

    }

-(void) touchCancel{
     [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) butSave{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect){120, 413.5, 190, 35.5};
    button.layer.cornerRadius = 5.0f;
    [button setTitle:@"SAVE" forState:UIControlStateNormal];
    [button setTitle:@"SAVE" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"MyriadPro-Bold" size:16];
    button.backgroundColor = [UIColor colorWithRed:140/255.f green:186/255.f blue:29/255.f alpha:1];
    [button addTarget:self action:@selector(touchSave)
     forControlEvents:UIControlEventTouchUpInside];
    self.buttonSave = button;
    [self.view addSubview:button];
    }

-(void) touchSave{
    if (!self.pickerDate){
        __block UIAlertController *alert = [UIAlertController
                                            alertControllerWithTitle:@"Erorr!"
                                            message:@"Please enter date"
                                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Good" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if ([self.yourPartyName.text isEqualToString:@""]){
        __block UIAlertController *alert = [UIAlertController
                                            alertControllerWithTitle:@"Erorr!"
                                            message:@"Please enter your party name"
                                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Good" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {

        [self.navigationController popToRootViewControllerAnimated:YES];
        EVAParty* newParty = [[EVAParty alloc]initWithName: (NSString*) self.yourPartyName date: (NSString*) self.datePicker timeStart: (NSString*) self.labelTimeStart timeEnd: (NSString*) self.labelTimeEnd description: (NSString*) self.textDescription image: (NSString*) self.pageControl];

        [newParty touchSave];
       
    }
    
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 478.5);
    }];
    
    
    
}

#pragma mark - BIG Line!!!
-(void) newLineRight{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(15, 27, 1, 451.5)];
    line.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    UIView *moving = [[UIView alloc] initWithFrame:CGRectMake(15, 27, 14, 14)];
    moving.center = CGPointMake(15, 27);
    moving.layer.cornerRadius = 7.5f;
    moving.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [moving.layer setBorderWidth: 2];
    [moving.layer setBorderColor:[UIColor colorWithRed:107/255.f green:107/255.f blue:108/255.f alpha:1].CGColor];
    self.moving = moving;
    [self.view addSubview:moving];
    //
    UIView *movingChooseDay = [[UIView alloc] initWithFrame:CGRectMake(15, 27, 10, 10)];
    movingChooseDay.center = CGPointMake(15, 27);
    movingChooseDay.layer.cornerRadius = 4.0f;
    movingChooseDay.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:movingChooseDay];
    UILabel *labelChooseDay = [[UILabel alloc] initWithFrame:CGRectMake(28, 22.5, 94.5, 12)];
    labelChooseDay.text = @"CHOOSE DAY";
    labelChooseDay.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelChooseDay.textColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:labelChooseDay];
    //
    UIView *movingPartyName = [[UIView alloc] initWithFrame:CGRectMake(15, 76, 10, 10)];
    movingPartyName.center = CGPointMake(15, 76);
    movingPartyName.layer.cornerRadius = 4.0f;
    movingPartyName.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:movingPartyName];
    UILabel *labelyourPartyName = [[UILabel alloc] initWithFrame:CGRectMake(28, 72, 94.5, 12)];
    labelyourPartyName.text = @"PARTY NAME";
    labelyourPartyName.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelyourPartyName.textColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:labelyourPartyName];

    //
    UIView *movingStartTime = [[UIView alloc] initWithFrame:CGRectMake(15, 123.5, 10, 10)];
    movingStartTime.center = CGPointMake(15, 123.5);
    movingStartTime.layer.cornerRadius = 4.0f;
    movingStartTime.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:movingStartTime];
    UILabel *labelTimeStart = [[UILabel alloc] initWithFrame:CGRectMake(29, 118.5, 94.5, 12)];
    labelTimeStart.text = @"START";
    labelTimeStart.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelTimeStart.textColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:labelTimeStart];
    //
    UIView *movingEndTime = [[UIView alloc] initWithFrame:CGRectMake(15, 164.5, 10, 10)];
    movingEndTime.center = CGPointMake(15, 164.5);
    movingEndTime.layer.cornerRadius = 4.0f;
    movingEndTime.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:movingEndTime];
    UILabel *labelTimeEnd = [[UILabel alloc] initWithFrame:CGRectMake(29, 160.5, 94.5, 12)];
    labelTimeEnd.text = @"END";
    labelTimeEnd.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelTimeEnd.textColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:labelTimeEnd];
    //
    UIView *movingImage = [[UIView alloc] initWithFrame:CGRectMake(15, 241, 10, 10)];
    movingImage.center = CGPointMake(15, 241);
    movingImage.layer.cornerRadius = 4.0f;
    movingImage.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:movingImage];
    UILabel *labelImage= [[UILabel alloc] initWithFrame:CGRectMake(29, 237, 94.5, 12)];
    labelImage.text = @"LOGO";
    labelImage.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelImage.textColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:labelImage];
    //
    UIView *movingTextDescription = [[UIView alloc] initWithFrame:CGRectMake(15, 359.5, 10, 10)];
    movingTextDescription.center = CGPointMake(15, 359.5);
    movingTextDescription.layer.cornerRadius = 4.0f;
    movingTextDescription.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:movingTextDescription];
    UILabel *labelDescription = [[UILabel alloc] initWithFrame:CGRectMake(29, 355, 94.5, 12)];
    labelDescription.text = @"DESCRIPTION";
    labelDescription.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelDescription.textColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:labelDescription];
    //
    UIView *movingCancel = [[UIView alloc] initWithFrame:CGRectMake(15, 478.5, 10, 10)];
    movingCancel.center = CGPointMake(15, 478.5);
    movingCancel.layer.cornerRadius = 4.0f;
    movingCancel.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:movingCancel];
    UILabel *labelAllFinal = [[UILabel alloc] initWithFrame:CGRectMake(29, 474, 94.5, 12)];
    labelAllFinal.text = @"FINAL";
    labelAllFinal.font = [UIFont fontWithName:@"MyriadPro-Regular" size:12];
    labelAllFinal.textColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [self.view addSubview:labelAllFinal];
    
    [self.view addSubview:line];
}
@end
