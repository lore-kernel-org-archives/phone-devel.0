Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F66C433EF
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 14:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78F1E61131
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 14:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243047AbhIIOhF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Sep 2021 10:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240410AbhIIOg5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Sep 2021 10:36:57 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE04BC199395
        for <phone-devel@vger.kernel.org>; Thu,  9 Sep 2021 06:46:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id k13so3868717lfv.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Sep 2021 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IcwFUmmVK4ypxuZB23EEwU2VdYJAuPPWgw97xtMQXeU=;
        b=RINgsBNhJnCucEyXqV3FOzzraqEYyxPdozRS9NKc72eAh06i1T6Gj5zxbFPIf9eG2I
         6JmenaLmC7P9DfI1SztdX6NWRzh5Qy2Lam0FGQhLsKOAm0rftefD7Q48aaec0NHKfil1
         M5fQiqk8iz1TDrGBR4hg2in/9UPakmlNJJW2HFfCtQBgAEwGxk0SlJ2r/1A528FCojRB
         2K89O0XOXJd7vkYBaKvyRfYq065zoCXx5ZLxdAFZx0A60a6UHr+T2QXotcAlVVyDzqsO
         V+pZwquUI98tXSDgn48q+J8ECzQ22N9/qyN/1nMZRn1xRHP91Jl/LMqdL/EhSIliWy5Z
         PHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IcwFUmmVK4ypxuZB23EEwU2VdYJAuPPWgw97xtMQXeU=;
        b=ueuRquBQ0rqnG/Ps7qNlovgjuYD6+VOPrk/d9b6HgSJhpkZ70VsFceINL11LEbnfhb
         JZlo3+P8+yhqpIpG76nJ0Wo0NJxGMwWPtGSyPKlZvkvgjEp+kPWZ80+7gexsd1UKWiKH
         aPKNMNp9UTKlfZcZrKX1D40jYwEy4tGSygPiZ3NpNqPOWeLy1EcAxqFDNh9UWqhfLfyd
         AelvmUmaMU+un2enghx61Bea8TZ9woEvTe2Y4teEFJpc9L4iaBgKhEED4cZaTbjncW8/
         f7sLav10Hz3WU3tBU4oSpglEZKo0kmqA9vWaWZX4AlCNbsPAHMmOyKU93pluEPf9PhK/
         7odQ==
X-Gm-Message-State: AOAM531Tf84B0o/HXffOx36wmlg0am3MkhPzJj5G9VWsDeFjI1PJM/GE
        iAJEJvOfPGKtESZ9ohvI4cK3MA==
X-Google-Smtp-Source: ABdhPJyF6qKPZwa2rQgVlQLfXg7myYMb6+RC7nDu5gtDEdqGAda5fbEso5nkszPL4Y+XWmWjXZ0w4g==
X-Received: by 2002:ac2:5c0d:: with SMTP id r13mr2487808lfp.552.1631195188217;
        Thu, 09 Sep 2021 06:46:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm205874lfr.72.2021.09.09.06.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 06:46:27 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org, DTML <devicetree@vger.kernel.org>
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
 <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
 <CAOCk7NqhuCJqh-u6ke=Mn=EPgHnc7C2RS_X1nSCg_Nc8An=yPA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2d25526f-dd9c-e336-970d-e8882f848d65@linaro.org>
Date:   Thu, 9 Sep 2021 16:46:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7NqhuCJqh-u6ke=Mn=EPgHnc7C2RS_X1nSCg_Nc8An=yPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/09/2021 17:22, Jeffrey Hugo wrote:
> On Wed, Sep 8, 2021 at 2:26 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Hi,
>>
>> On Tue, 7 Sept 2021 at 22:13, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>>>
>>> On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@somainline.org> wrote:
>>>>
>>>> Bringup functionality for MSM8998 in the DPU, driver which is mostly
>>>> the same as SDM845 (just a few variations).
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>
>>> I don't seem to see a cover letter for this series.
>>>
>>> Eh, there are a fair number of differences between the MDSS versions
>>> for 8998 and 845.
>>>
>>> Probably a bigger question, why extend the DPU driver for 8998, when
>>> the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
>>> dumb, but I don't see a valid reason for both drivers supporting the
>>> same target/display revision.  IMO, if you want this support in DPU,
>>> remove it from MDP5.
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785
>>
>> I don't think that we should enforce such requirements. Having support
>> both in MDP5 and DPU would allow one to compare those two drivers,
>> performance, features, etc.
>> It might be that all MDP5-supported hardware would be also supported
>> by DPU, thus allowing us to remove the former driver. But until that
>> time I'd suggest leaving support in place.
> 
> Well, then you have a host of problems to solve.
> 
> Lets ignore the code duplication for a minute and assume we've gone
> with this grand experiment.  Two drivers enter, one leaves the victor.
> 
> How are the clients supposed to pick which driver to use in the mean
> time?  We already have one DT binding for 8998 (which the MDP5 driver
> services).  This series proposes a second.  If we go forward with what
> you propose, we'll have two bindings for the same hardware, which IMO
> doesn't make sense in the context of DT, and the reason for that is to
> select which driver is "better".  Driver selection is not supposed to
> be tied to DT like this.
> 
> So, some boards think MDP5 is better, and some boards think DPU is
> better.  At some point, we decide one of the drivers is the clear
> winner (lets assume DPU).  Then what happens to the existing DTs that
> were using the MDP5 description?  Are they really compatible with DPU?
> 
>  From a DT perspective, there should be one description, but then how
> do you pick which driver to load?  Both can't bind on the single
> description, and while you could argue that the users should build one
> driver or the other, but not both (thus picking which one at build
> time), that doesn't work for distros that want to build both drivers
> so that they can support all platforms with a single build (per arch).

Yep, the DT issue wasn't thought about from my side at the review time. 
I considered qcom,msm8998-dpu as an extension/upgrade of bare qcom,mdp5 
compatibility string (as we usually add chip-specific compatibilities).

In fact using just 'qcom,mdp5' prevents us from having such kind of 
driver upgrades.

What I'd propose if everybody else agrees on moving 8998 (and maybe 
others later) from MDP5 to DPU would be to continue supporting qcom,mdp5 
binding in the mdp5 driver and to add qcom,msm8998-dpu binding used by 
the DPU driver. Maybe with the warning telling to update the binding. 
Then at some point if all the MDP5-supported hardware is supported by 
the DPU we can drop the MDP5 driver and implement required bindings 
compatibility in the DPU.

> 
>  From where I sit, your position starts with a good idea, but isn't
> fully thought out and leads to problems.
> 
> If there is some reason why DPU is better for 8998, please enumerate
> it.  Does DPU support some config that MDP5 doesn't, which is valuable
> to you? 

The DPU receives more attention from both Qualcomm and Linaro, so it 
will continue acquiring features (which MDP5 might not have at the moment).

For example consider the SmartDMA (multirect) support. For now the 
multirect patchset it is limited to newer versions, but it might be 
extended to support older chips (in the DPU) too. We did not have plans 
to backport SmartDMA v1 support to MDP5.

Writeback also has more chances to be supported in the DPU rather than 
in the MDP5 driver (I remember Rob's patches for the MDP5, but they 
never actually landed upstream).

Last but not least at this moment DPU has bandwidth scaling support, 
while MDP5 does not. I've sent a patch for MDP5 earlier, which then got 
reverted because of armv7 support. At this moment I did not resend it 
since we found some underrun issues on resume or when quickly changing 
bw down and up.

> I'm ok with ripping out the MDP5 support, the reason I didn't
> go with DPU was that the DPU driver was clearly written only for 845
> at the time, and needed significant rework to "downgrade" to an
> earlier hardware.  However, the "reason" DPU exists separate from MDP5
> is the claim that the MDP hardware underwent a significant
> rearchitecture, and thus it was too cumbersome to extend MDP5.  While
> I disagree with the premise, that "rearch" started with 8998.

Just checked, the SDE, the origin (or parent) of the DPU driver starts 
it's support from the 8996 and 8998.




-- 
With best wishes
Dmitry
