//
//  Created by Rene Dohan on 1/11/13.
//


#import "ScrollViewPager.h"
#import "UIScrollView+Extension.h"


@implementation ScrollViewPager {
		UIPageControl *_pageControl;
		UIScrollView *_scrollView;
		BOOL _pageControlUsed;
}

- (ScrollViewPager *)from:(UIPageControl *)control :(UIScrollView *)scrollView {
		_pageControl = control;
		_scrollView = scrollView;
		[_pageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];
		return self;
}

- (void)changePage {
		_pageControlUsed = YES;
		[self showPage:_pageControl.currentPage];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)view {
		_pageControlUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)view {
		if (!_pageControlUsed)
				_pageControl.currentPage = lround(_scrollView.contentOffset.x / (_scrollView.contentSize.width / 2));
}

- (void)showPage:(NSInteger)index {
		[_scrollView scrollToPage:index of:_pageControl.numberOfPages];
}
@end