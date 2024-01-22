#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __PRETTY_FUNCTION__);

    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];

    // Increase the height of the window
    CGRect newFrame = mainScreenBounds;
    newFrame.size.height *= 2; // Adjust the multiplier based on your desired height
    
    self.window = [[UIWindow alloc] initWithFrame:newFrame];
    
    // Create the view controller and add it to the window.
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.view.frame = self.window.bounds;
    self.window.rootViewController = viewController;

    // Create a horizontal stack view
    UIStackView *horizontalStackView = [[UIStackView alloc] init];
    horizontalStackView.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView.distribution = UIStackViewDistributionFill;
    horizontalStackView.alignment = UIStackViewAlignmentCenter;
    horizontalStackView.spacing = 20.0; // Adjust the spacing based on your preference

    // Create a button and add it to the horizontal stack view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Top Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [horizontalStackView addArrangedSubview:button];

    [viewController.view addSubview:horizontalStackView];

    // Create a vertical stack view
    UIStackView *verticalStackView = [[UIStackView alloc] init];
    verticalStackView.axis = UILayoutConstraintAxisVertical;
    verticalStackView.distribution = UIStackViewDistributionFill;
    verticalStackView.alignment = UIStackViewAlignmentLeading;
    verticalStackView.spacing = 20.0; // Adjust the spacing based on your preference

    // Create the first label and add it to the vertical stack view
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"Hello, worasidjaosdijld!";
    label1.textColor = [UIColor blackColor];
    [verticalStackView addArrangedSubview:label1];

    // Create the second label and add it to the vertical stack view
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"Hello, World";
    label2.textColor = [UIColor blackColor];
    [verticalStackView addArrangedSubview:label2];

    [viewController.view addSubview:verticalStackView];

    // Set constraints for the horizontal stack view
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topHorizontalStackView = [NSLayoutConstraint constraintWithItem:horizontalStackView
            attribute:NSLayoutAttributeTop
            relatedBy:NSLayoutRelationEqual
            toItem:viewController.view
            attribute:NSLayoutAttributeTop
            multiplier:1.0
            constant:20.0]; // Adjust the constant based on your desired top spacing

    NSLayoutConstraint *centerXHorizontalStackView = [NSLayoutConstraint constraintWithItem:horizontalStackView
            attribute:NSLayoutAttributeCenterX
            relatedBy:NSLayoutRelationEqual
            toItem:viewController.view
            attribute:NSLayoutAttributeCenterX
            multiplier:1.0
            constant:0.0];

    [NSLayoutConstraint activateConstraints:@[topHorizontalStackView, centerXHorizontalStackView]];

    // Set constraints for the vertical stack view
    verticalStackView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topVerticalStackView = [NSLayoutConstraint constraintWithItem:verticalStackView
            attribute:NSLayoutAttributeTop
            relatedBy:NSLayoutRelationEqual
            toItem:horizontalStackView
            attribute:NSLayoutAttributeBottom
            multiplier:1.0
            constant:20.0]; // Adjust the constant based on your desired spacing

    NSLayoutConstraint *centerXVerticalStackView = [NSLayoutConstraint constraintWithItem:verticalStackView
            attribute:NSLayoutAttributeCenterX
            relatedBy:NSLayoutRelationEqual
            toItem:viewController.view
            attribute:NSLayoutAttributeCenterX
            multiplier:1.0
            constant:0.0];

    [NSLayoutConstraint activateConstraints:@[topVerticalStackView, centerXVerticalStackView]];

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)buttonTapped {
    NSLog(@"Button tapped!");
}

@end

int main(int argc, char *argv[]) {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
