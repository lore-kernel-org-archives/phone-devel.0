Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2142FC876;
	Tue, 18 Nov 2025 00:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427256; cv=none; b=Vu1jxe0sIUbnXkMUDNmznhOyvq32gnWJVGDI4ueIQ6gKCPD9NgAgstSW/DrG2vdODVHFkJwblfj+Ql16SfCZ/YWrL8Ly5lhezxBLc+S2QS4/Pvn+0E9LUKmf3NWjh4GIr0TNsdQYTMnmOc0yOqXZiJBhQ4HHUwhgI04W5Z+BXHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427256; c=relaxed/simple;
	bh=eGWvO7D5EM7ECyIrHX4ktygWBzTzotYEXHtgcB10f5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdxLz6JtTo8Mm5GURI40ssezl83UMoiwh9OwcEaGVSmw+Y5FF4y/tq3RuXvvLAOQ9vRtGhjLh4fkspn115JQkDmLH6LXY0mh2JP5qZfCJB2/LVG9/JNbIL17ls8x4ae0skgJ1mf2nu2CWOkIWcfK1GgnNkP//WLR4YGbq4csUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwvdGA6x; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwvdGA6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763427255; x=1794963255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eGWvO7D5EM7ECyIrHX4ktygWBzTzotYEXHtgcB10f5k=;
  b=kwvdGA6xAeSAY72ZWueYKqE7hJCLGevQWkU6xqZ0Xk03q9ZF9WCheIj7
   NiLb7H9eYTbuMLBqAktUBMPF4+RIBgrVgNnqVVz5rYT/Xi7gRtQ4KzZwC
   sylsPoWAubVmO/AqCHO5QG/SmqWuBIhHLMGDuYFhmCyV04L1G5bXRlGyP
   4vZuirhDpk5yUCX0qYrmUua04i4ICACq/3FA1lqfp4whM/wHR/sWg3vPe
   YhQpozEDw2csJ/3xnSScx8iFtKthdfi58aO2XULi8OYZwJvoPlj5ARhuj
   k1OpgJ5Pnm5fvok98zljUMG+VK283t1objsGDWPV+jp1hQiQt5YAX8QnY
   Q==;
X-CSE-ConnectionGUID: KGEmJqo+Ss67Pm5liMnXWw==
X-CSE-MsgGUID: Uy/v+DZ2R9u9HEeX+Sum8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65470807"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="65470807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 16:54:14 -0800
X-CSE-ConnectionGUID: OfzuSc/sTqagsxQEJnRKhA==
X-CSE-MsgGUID: ZRBnWoAVTR28HjN0L0qnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="213994704"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2025 16:54:10 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL9yy-0001CF-2d;
	Tue, 18 Nov 2025 00:54:08 +0000
Date: Tue, 18 Nov 2025 08:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid
 gfp flags
Message-ID: <202511180838.vEBLp7Hm-lkp@intel.com>
References: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0c1c7a6a83feaf2cf182c52983ffe330ffb50280]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/mm-vmalloc-warn-only-once-when-vmalloc-detect-invalid-gfp-flags/20251118-080722
base:   0c1c7a6a83feaf2cf182c52983ffe330ffb50280
patch link:    https://lore.kernel.org/r/20251118-only-one-vmalloc-v1-1-29f8eacb4605%40ixit.cz
patch subject: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid gfp flags
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180838.vEBLp7Hm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180838.vEBLp7Hm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180838.vEBLp7Hm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/vmalloc.h:5,
                    from mm/vmalloc.c:11:
   mm/vmalloc.c: In function 'vmalloc_fix_flags':
>> mm/vmalloc.c:3938:19: error: expected ')' before 'invalid_mask'
    3938 |                   invalid_mask, &invalid_mask, flags, &flags);
         |                   ^~~~~~~~~~~~
   include/asm-generic/bug.h:105:62: note: in definition of macro '__WARN_printf'
     105 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:159:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   mm/vmalloc.c:3937:9: note: in expansion of macro 'WARN_ONCE'
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |         ^~~~~~~~~
   include/asm-generic/bug.h:105:34: note: to match this '('
     105 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                  ^
   include/asm-generic/bug.h:141:17: note: in expansion of macro '__WARN_printf'
     141 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:159:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   mm/vmalloc.c:3937:9: note: in expansion of macro 'WARN_ONCE'
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |         ^~~~~~~~~
>> mm/vmalloc.c:3937:22: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:105:62: note: in definition of macro '__WARN_printf'
     105 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:159:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   mm/vmalloc.c:3937:9: note: in expansion of macro 'WARN_ONCE'
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |         ^~~~~~~~~
   mm/vmalloc.c:3937:41: note: format string is defined here
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                                       ~~^
         |                                         |
         |                                         unsigned int
>> mm/vmalloc.c:3937:22: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:105:62: note: in definition of macro '__WARN_printf'
     105 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:159:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   mm/vmalloc.c:3937:9: note: in expansion of macro 'WARN_ONCE'
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |         ^~~~~~~~~
   mm/vmalloc.c:3937:45: note: format string is defined here
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                                            ~^
         |                                             |
         |                                             void *
>> mm/vmalloc.c:3937:22: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:105:62: note: in definition of macro '__WARN_printf'
     105 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:159:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   mm/vmalloc.c:3937:9: note: in expansion of macro 'WARN_ONCE'
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |         ^~~~~~~~~
   mm/vmalloc.c:3937:71: note: format string is defined here
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                                                                     ~~^
         |                                                                       |
         |                                                                       unsigned int
>> mm/vmalloc.c:3937:22: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:105:62: note: in definition of macro '__WARN_printf'
     105 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:159:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   mm/vmalloc.c:3937:9: note: in expansion of macro 'WARN_ONCE'
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |         ^~~~~~~~~
   mm/vmalloc.c:3937:75: note: format string is defined here
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |                                                                          ~^
         |                                                                           |
         |                                                                           void *
>> mm/vmalloc.c:3934:15: warning: unused variable 'invalid_mask' [-Wunused-variable]
    3934 |         gfp_t invalid_mask = flags & ~GFP_VMALLOC_SUPPORTED;
         |               ^~~~~~~~~~~~


vim +3938 mm/vmalloc.c

^1da177e4c3f41 Linus Torvalds        2005-04-16  3921  
7179b225631532 Vishal Moola (Oracle  2025-11-12  3922) /*
7179b225631532 Vishal Moola (Oracle  2025-11-12  3923)  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
7179b225631532 Vishal Moola (Oracle  2025-11-12  3924)  * This gfp lists all flags currently passed through vmalloc. Currently,
7179b225631532 Vishal Moola (Oracle  2025-11-12  3925)  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
7179b225631532 Vishal Moola (Oracle  2025-11-12  3926)  * and BPF also use GFP_USER, which is GFP_KERNEL | __GFP_HARDWALL.
7179b225631532 Vishal Moola (Oracle  2025-11-12  3927)  */
7179b225631532 Vishal Moola (Oracle  2025-11-12  3928) #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
7179b225631532 Vishal Moola (Oracle  2025-11-12  3929) 				__GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
7179b225631532 Vishal Moola (Oracle  2025-11-12  3930) 				__GFP_HARDWALL)
7179b225631532 Vishal Moola (Oracle  2025-11-12  3931) 
7179b225631532 Vishal Moola (Oracle  2025-11-12  3932) static gfp_t vmalloc_fix_flags(gfp_t flags)
7179b225631532 Vishal Moola (Oracle  2025-11-12  3933) {
7179b225631532 Vishal Moola (Oracle  2025-11-12 @3934) 	gfp_t invalid_mask = flags & ~GFP_VMALLOC_SUPPORTED;
7179b225631532 Vishal Moola (Oracle  2025-11-12  3935) 
7179b225631532 Vishal Moola (Oracle  2025-11-12  3936) 	flags &= GFP_VMALLOC_SUPPORTED;
bf791000a32caf David Heidelberg      2025-11-18 @3937  	WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
7179b225631532 Vishal Moola (Oracle  2025-11-12 @3938) 		  invalid_mask, &invalid_mask, flags, &flags);
7179b225631532 Vishal Moola (Oracle  2025-11-12  3939) 	return flags;
7179b225631532 Vishal Moola (Oracle  2025-11-12  3940) }
7179b225631532 Vishal Moola (Oracle  2025-11-12  3941) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
