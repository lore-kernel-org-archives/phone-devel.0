Return-Path: <SRS0=B2mx=D6=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E35C388F9
	for <phone-devel@archiver.kernel.org>; Fri, 23 Oct 2020 09:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43A6C2225F
	for <phone-devel@archiver.kernel.org>; Fri, 23 Oct 2020 09:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461756AbgJWJxq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 23 Oct 2020 05:53:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:46150 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S461703AbgJWJxp (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Fri, 23 Oct 2020 05:53:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A99ADABD1;
        Fri, 23 Oct 2020 09:53:44 +0000 (UTC)
Subject: Re: gsm muxing for Droid 4
To:     Pavel Machek <pavel@denx.de>, gregkh@linuxfoundation.org,
        jhovold@gmail.com, kernel list <linux-kernel@vger.kernel.org>,
        tony@atomide.com, phone-devel@vger.kernel.org
References: <20201023095113.GA18590@amd>
From:   Jiri Slaby <jslaby@suse.cz>
Message-ID: <f3a783cc-2299-9258-46c9-70afa2f06276@suse.cz>
Date:   Fri, 23 Oct 2020 11:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201023095113.GA18590@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On 23. 10. 20, 11:51, Pavel Machek wrote:
> a579767c1 interferes with gsmmux patches for Droid 4.

Would it be possible to upstream the patches?

> Reverting it gets the stuff to compile again in 5.10-rc0.9.

As there are no in-tree users, Droid needs to carry one more patch, I'm 
afraid.

thanks,
-- 
js
suse labs
