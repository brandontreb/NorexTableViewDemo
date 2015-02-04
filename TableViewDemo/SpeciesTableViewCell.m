//
//  SpeciesTableViewCell.m
//  TableViewDemo
//
//  Created by Brandon Trebitowski on 2/4/15.
//  Copyright (c) 2015 Pixegon. All rights reserved.
//

#import "SpeciesTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SpeciesTableViewCell()
@property(nonatomic, weak) IBOutlet UILabel *speciesLabel;
@property(nonatomic, weak) IBOutlet UIImageView *speciesImage;
@end

@implementation SpeciesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void) setSpeciesDictionary:(NSDictionary *)speciesDictionary {
    _speciesDictionary = speciesDictionary;
    self.speciesLabel.text = speciesDictionary[@"name"];
    
    
    NSURL *imageURL = speciesDictionary[@"image_url"];
    [self.speciesImage sd_setImageWithURL:imageURL placeholderImage:nil];
}

@end
