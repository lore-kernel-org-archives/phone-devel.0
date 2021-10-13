Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C83C433FE
	for <phone-devel@archiver.kernel.org>; Wed, 13 Oct 2021 22:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA4D961177
	for <phone-devel@archiver.kernel.org>; Wed, 13 Oct 2021 22:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhJMWb4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 13 Oct 2021 18:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbhJMWbw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 13 Oct 2021 18:31:52 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0318FC061570
        for <phone-devel@vger.kernel.org>; Wed, 13 Oct 2021 15:29:48 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id s3so1451114ild.0
        for <phone-devel@vger.kernel.org>; Wed, 13 Oct 2021 15:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w7KmVBNJcTUXE08UuPtb1sRKXsVumi6IJCbkXKIH5j0=;
        b=BlUB2wtkvWiXSjrdP4FqNIgRevk4iOXFslcHNB6d8M1SUHLf5lse1TzhceaTA3fBUj
         03Jwotd824LcV393fC7nI4/qtPWgEkAFGaGaebytfmLCqwGxsyvtLyBBZh4LK7CTqjoO
         sammBH/3OOsf3/sq1C8oWzvI2DxOmb+9x2npk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w7KmVBNJcTUXE08UuPtb1sRKXsVumi6IJCbkXKIH5j0=;
        b=xIkoWNU966ENCrtCKlAAivrWfIqA7FjQkNdp9ikGM1E2mSm+iBEgT6iS2D7sFwMAaU
         QdZjIJ8r8C5uPi1FiStXcHOxrqIcIs4diwaWrpmN2HFw3fj+fMa+pcAiHpsTe15J0lBP
         Qih0bF8p7MnAE/6BaOfET94kxJSdCpWUtC2pKtwkEZpG29At2o8IrqSEvIO+tAx+x1cp
         pDXKafXB5fKl6hgIe8kEG8951XruEmbiPaZtf2nWTHNnL/+QT3SJOUhC+M8NNeJx1eG5
         nV+ncjLGIhvZ+Awcx8rT9FJYsO/ulFtnx7Q29RNmBYroC6RmYnbl0Bn6fE5STrl8zRuE
         U+1Q==
X-Gm-Message-State: AOAM530/fAiHPdOtvvRBq/Cxd06etDrg75D4P23/wlcQZp86JrBJEMFm
        Yg1AjSURsla381GeaY7n4GVrcQ==
X-Google-Smtp-Source: ABdhPJwzyFV0KS9WlcNqwkNsHjGAE2p/uHA1agSsenFc6+5JrbcIsUagtwlUDehevNbVxQSvzcHdrg==
X-Received: by 2002:a92:de41:: with SMTP id e1mr1284490ilr.289.1634164187496;
        Wed, 13 Oct 2021 15:29:47 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id v18sm359562ilq.77.2021.10.13.15.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:29:46 -0700 (PDT)
Subject: Re: [RFC PATCH 06/17] net: ipa: Add timeout for
 ipa_cmd_pipeline_clear_wait
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-7-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <5219dde9-665d-a813-a9b8-3db51aea97b5@ieee.org>
Date:   Wed, 13 Oct 2021 17:29:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-7-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 9/19/21 10:08 PM, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Sometimes the pipeline clear fails, and when it does, having a hang in
> kernel is ugly. The timeout gives us a nice error message. Note that
> this shouldn't actually hang, ever. It only hangs if there is a mistake
> in the config, and the timeout is only useful when debugging.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

This is actually an item on my to-do list.  All of the waits
for GSI completions should have timeouts.  The only reason it
hasn't been implemented already is that I would like to be sure
all paths that could have a timeout actually have a reasonable
recovery.

I'd say an error message after a timeout is better than a hung
task panic, but if this does time out, I'm not sure the state
of the hardware is well-defined.

					-Alex

> ---
>   drivers/net/ipa/ipa_cmd.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_cmd.c b/drivers/net/ipa/ipa_cmd.c
> index 3db9e94e484f..0bdbc331fa78 100644
> --- a/drivers/net/ipa/ipa_cmd.c
> +++ b/drivers/net/ipa/ipa_cmd.c
> @@ -658,7 +658,10 @@ u32 ipa_cmd_pipeline_clear_count(void)
>   
>   void ipa_cmd_pipeline_clear_wait(struct ipa *ipa)
>   {
> -	wait_for_completion(&ipa->completion);
> +	unsigned long timeout_jiffies = msecs_to_jiffies(1000);
> +
> +	if (!wait_for_completion_timeout(&ipa->completion, timeout_jiffies))
> +		dev_err(&ipa->pdev->dev, "%s time out\n", __func__);
>   }
>   
>   void ipa_cmd_pipeline_clear(struct ipa *ipa)
> 

