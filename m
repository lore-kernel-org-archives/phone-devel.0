Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E15C6FA82
	for <phone-devel@archiver.kernel.org>; Wed, 21 Sep 2022 18:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbiIUSGD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 21 Sep 2022 14:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiIUSGB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 21 Sep 2022 14:06:01 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9F680E88
        for <phone-devel@vger.kernel.org>; Wed, 21 Sep 2022 11:05:59 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r7so11342109wrm.2
        for <phone-devel@vger.kernel.org>; Wed, 21 Sep 2022 11:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=c/1ZTI/JqD0DxpOU+Jn7OqD7FPGryOOpO8thonVZ3AY=;
        b=KkeAmqj8PGjVxuILsheKSbIvIEF6OeiTOhU0mrL2EVTxIdOBELzH9G2uQJa28ugxmX
         jtrFhvg8JeJRI7gfbY4vJ4MG3wZ6H1Nwch8ujJnpVCiyFo/LH5HMr01e8srzNcIRg8tQ
         mgNKNta5/yMVJFexzgk83fgOT3MDUvCRLP9R+VztUusBJQoRnh++Sk8hIuhhtEGubzQN
         EgQc/2/LI4fpjZqXikS63ghPhgU0Kh3b9LN4s/OZJaNALUioH1SituwyN3W+nxcW17Io
         y+gMxyP9idryOPqZSgfknIyKtMVoSgW5c1855VevsWtFl0pShiFaaZo38YmjAWh1kvOg
         mbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=c/1ZTI/JqD0DxpOU+Jn7OqD7FPGryOOpO8thonVZ3AY=;
        b=qvpr6Eu5fH/D+slnK1+Gaf1nXouwhN28pWybfyBYkvx8dSOviuc4ZbvMD7Nf1ixwce
         CEAr3JJfl5hHJDocsUqnJdpL1lCHyoAkVXLU4HLLh2siUSgMma0V9/p0Wo9P5R98jkYe
         kigOtEmFOQ+QmMWaYiPmXI6EN0YVK9ViLSiFHWzfYOBkKcrkf0Fbz9bjVBZPcHPBlmxd
         cKxEFYMwFALTtpMbBSOrD3CYsY3gyVnTKbiqm01gc9YmCmLYiFCsnvcCzrsOqB1b/qex
         CufJz5NKnfejni6kVqhjA5ry+tNVDZxoZ5NWMpemW2p66QDFlEMZVe2SOOILp2V85NCJ
         Ndzg==
X-Gm-Message-State: ACrzQf3DvQ3Wh2aGxWa5+s5yn7sNy5c05yM6KPlg/LBCg8vw2pjJrVhT
        kdTP7tlg6nl7oNDo5g64SwY3pQ==
X-Google-Smtp-Source: AMsMyM6rJM460HHXhJwaPA2mVegk2iBFHBUP27phO8l7hBX97WOIM5KVroTTwxhQVcrcskQiYFv5bg==
X-Received: by 2002:adf:d1ca:0:b0:22a:cb10:450d with SMTP id b10-20020adfd1ca000000b0022acb10450dmr17369474wrd.120.1663783558380;
        Wed, 21 Sep 2022 11:05:58 -0700 (PDT)
Received: from [192.168.0.11] (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id f15-20020a1cc90f000000b003b2878b9e0dsm3499836wmb.20.2022.09.21.11.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 11:05:57 -0700 (PDT)
Message-ID: <b7551b18-887a-c895-b347-776bb537ae9f@linaro.org>
Date:   Wed, 21 Sep 2022 19:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers lowercase
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
 <YylwxQSulh7C48T7@google.com> <CN1UV8GZPKW8.3KT1X7WYEM4K5@otso>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CN1UV8GZPKW8.3KT1X7WYEM4K5@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 21/09/2022 07:12, Luca Weiss wrote:
> Hi Lee, hi Caleb
> 
> On Tue Sep 20, 2022 at 9:50 AM CEST, Lee Jones wrote:
>> On Thu, 15 Sep 2022, Luca Weiss wrote:
>>
>>> There are some IDs that are written in uppercase. For consistency
>>> convert them to lowercase.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Changes since v2:
>>> * Split out to separate patch
>>>
>>>   include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> These aren't MFD patches.  Please reword the subject.
> 
> Do you have any suggestion what subject to use then? The most I can
> think of is "soc: qcom: " which is sometimes used for other files in
> this include directory.
> I've used the current subject because the previous two patches touching
> this file had this subject also.

This file just contains platform data which used to be in the qcom SPMI
PMIC driver. In hindsight, maybe it would have been better suited in
include/linux/mfd but I don't think it matters too much. I guess it makes
sense to follow convention for the directory and treat it like the other
platform headers, maybe something like:

soc: qcom: spmi-pmic: convert hex numbers to lowercase
> 
> Regards
> Luca
> 
>>
>> -- 
>> DEPRECATED: Please use lee@kernel.org
> 

-- 
Kind Regards,
Caleb (they/them)
