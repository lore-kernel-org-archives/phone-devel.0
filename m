Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1D3C61DB3
	for <phone-devel@archiver.kernel.org>; Thu, 12 Jan 2023 19:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238976AbjALToH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjALTnv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 12 Jan 2023 14:43:51 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29905F72
        for <phone-devel@vger.kernel.org>; Thu, 12 Jan 2023 11:33:53 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id n5so19887167ljc.9
        for <phone-devel@vger.kernel.org>; Thu, 12 Jan 2023 11:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JIYsMoXBydeWSn636wmG/Lb0+3KtaflCFgpsVqKASE=;
        b=qbrF/2QjIGACx037/GJu0XQQcZ1Y3hPaMwOzChvkOLdToaTqaiN4h2QOJc9QgTq2i/
         WDSgTjY9P/FNpiuJoM5wPVLAz9GT0a945L5MAGu42sDfYya0i7UbcDgXwt4flH7UPLfh
         8xIk7FFcJLUy5HS1asOTzx6v1zrirnNfs8IJAZ9Sk65shK24W+/ucRe0EbRKntUhWULc
         v2P+3CoYAuOVzE+CI+Zks73+sD6up7ltZtXiAM+73xNuLMFlfBSfnNxW3MK2EIQO5vG7
         c71f8rgNmCGMhusBMu6InU+O3AFVX7t+S8NzsIKAlgOBKKf5HDHzainln9Y0vcsEmU1q
         FCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JIYsMoXBydeWSn636wmG/Lb0+3KtaflCFgpsVqKASE=;
        b=gZLgByOV1ui8h3uJilQoHb8BD7vSSgIAG5VaC2DJUnqRTtLjyl0/858rTJZRP6WVFs
         jb0n50GqRdWWUhgRdgWCACgxycWfid2/FDPh2loUYJih6k6SdyMD6Lo0MrxxPPQmpO9H
         W6YP5/MIwQxOB/Omts3FEwqUVN/wtUm4iqIIb6VCiesXYOYei4gqQXmK3b8XozDDgSEr
         bfpfXqR40TtPIyQmzrDKFwmFR5mDjsgd5Jt/ptX453Zp0R0LOqDz6i34/H1JGTuGszgv
         587ry9w2x+r38kJak10fVE9G3mhPefmc8HkDToV7+4wyH0HGWD1dBvOIdU7myvDB4thp
         ybUw==
X-Gm-Message-State: AFqh2koYnLp0Cww+t1ibhC4WQ7W0CFJ9aZl6/VMgOzSSYVqlrKad958L
        7qVneCURmU1gBv12/KVNO6qnwA==
X-Google-Smtp-Source: AMrXdXv3+ZSf9y1ilQIM6yrNYmOcMkr/mWVjVGi348euRwBv5qEqZ0+ZJ0/epNcIXFHgpqqxpAod+g==
X-Received: by 2002:a2e:80c9:0:b0:287:d8ce:6c9d with SMTP id r9-20020a2e80c9000000b00287d8ce6c9dmr2860076ljg.4.1673552032393;
        Thu, 12 Jan 2023 11:33:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v25-20020a2e87d9000000b00288470f3145sm906564ljj.36.2023.01.12.11.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 11:33:52 -0800 (PST)
Message-ID: <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org>
Date:   Thu, 12 Jan 2023 21:33:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] phy: qcom-qmp-combo: Add config for SM6350
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>
Cc:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221130081430.67831-1-luca.weiss@fairphone.com>
 <20221130081430.67831-2-luca.weiss@fairphone.com>
 <Y6xP4YRAp68TfxFi@hovoldconsulting.com> <Y8BIX+js1ircJyb9@matsya>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y8BIX+js1ircJyb9@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/01/2023 19:50, Vinod Koul wrote:
> On 28-12-22, 15:17, Johan Hovold wrote:
>> Luca, Vinod,
>>
>> On Wed, Nov 30, 2022 at 09:14:28AM +0100, Luca Weiss wrote:
>>> Add the tables and config for the combo phy found on SM6350.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Changes since v2:
>>> * Drop dp_txa/dp_txb changes, not required
>>> * Fix dp_dp_phy offset
>>>
>>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 126 ++++++++++++++++++++++
>>>   1 file changed, 126 insertions(+)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> index 77052c66cf70..6ac0c68269dc 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>
>>> @@ -975,6 +1039,19 @@ static const char * const sc7180_usb3phy_reset_l[] = {
>>>   	"phy",
>>>   };
>>>   
>>> +static const struct qmp_combo_offsets qmp_combo_offsets_v3 = {
>>> +	.com		= 0x0000,
>>> +	.txa		= 0x1200,
>>> +	.rxa		= 0x1400,
>>> +	.txb		= 0x1600,
>>> +	.rxb		= 0x1800,
>>> +	.usb3_serdes	= 0x1000,
>>> +	.usb3_pcs_misc	= 0x1a00,
>>> +	.usb3_pcs	= 0x1c00,
>>> +	.dp_serdes	= 0x1000,
>>
>> I would have expected this to be 0x2000 as that's what the older
>> platforms have been using for the dp serdes table so far. Without access
>> to any documentation it's hard to tell whether everyone's just been
>> cargo-culting all along or if there's actually something there at offset
>> 0x2000.

usb3_serdes is 0x1000, so dp_serdes equal to 0x1000 is definitely an typo.

Judging from the downstream dtsi, the DP PHY starts at offset 0x2000. So 
dp_serdes is equal to 0x2000, dp_phy = 0x2a00, ln_tx1 = 0x2200, ln_tx2 = 
0x2600.

>>
>> Vinod, could you shed some light on this as presumably you have access
>> to some documentation?
>>
>>> +	.dp_dp_phy	= 0x2a00,
> 
> No sorry, I dont have access to this version...
> 

-- 
With best wishes
Dmitry

