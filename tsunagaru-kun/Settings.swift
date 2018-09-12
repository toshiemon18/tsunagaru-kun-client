//
//  Settings.swift
//  tsunagaru-kun
//
//  Created by 前野友里 on 2018/09/12.
//  Copyright © 2018年 softech-teama. All rights reserved.
//

import Foundation
#if (!arch(i386) && !arch(x86_64))
    let BASE_URL: String = "http://corazonMacBook-Pro.local:3000"
#else
    let BASE_URL: String = "http://localhost:3000"
#endif
