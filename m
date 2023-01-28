Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480ECC27C76
	for <phone-devel@archiver.kernel.org>; Sat, 28 Jan 2023 13:47:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbjA1NrE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 28 Jan 2023 08:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjA1NrD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 28 Jan 2023 08:47:03 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4656298DB
        for <phone-devel@vger.kernel.org>; Sat, 28 Jan 2023 05:47:02 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id l7so1547548ilf.0
        for <phone-devel@vger.kernel.org>; Sat, 28 Jan 2023 05:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1oJHVZE7sbOrOaciQWNDM+3fD79PPz1cSM/61Eqieac=;
        b=tQLseWPJdYp/2uCPDgbjf+PAr0sbN3JIIlG1YpBt03RbXjYVRCMK81kp56DP7TtTax
         lU6bFo13L/1386VZNF2sg3iYVqskPovR7X6TpoJRBY2vueElgtSrvXx7sXopb9/te3hI
         FpNinOXMTJD4K8c7NSH2GhpEHNOpoaiTw9yJrlyZtNDDsG1mnJSadb99BOMEDLAmlisV
         qhVq1RW01e5UehNeobIQoKmxyeBQC7TpkaFs6oUPmg20LaDCq9rIYuSrhROFpWMYFbFN
         YTgGHWOCRrUYRpVGqqKD5eaq86EUAk7zLmU8+B2zNjO+JJjQJMuOhR23nKxM6q3hcZFl
         4d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1oJHVZE7sbOrOaciQWNDM+3fD79PPz1cSM/61Eqieac=;
        b=4MQ34d6PO+9bedda2TObPiVfiagGwMTUJX2bkfkDeFqqJ4j3tcSzEyQF4E8g7yzuJG
         jrDWmft28y7Bpx3b9LotDpJktAMvIbO0G45g1csom1SuC/NX8N0GejdK85Qvf388kEZl
         GY+N6PNf0UELesYMbg5j5jfH/zDGM1BU2pWj+n+q+rbTxujpsCv85QLCuE25SaninuJp
         Q0getQ4Ouxff8JIivBMUJjSj3rF9wRIcuenJYF3G0QkPIm5I2Z7UUFtoi0F3oPVBqfMT
         AY6xVm9g8xh0gnY+JMrYH9kU5Jdazu1LOKF8x2UOa6G1zf3zAeVc2YBZwD7sAj+T/uoi
         MTow==
X-Gm-Message-State: AO0yUKVpc4rf5KcUWb1uIZaE8kGCAkoy7HNpvJCPq8dKd0qkIPW9pYaP
        BEd2xwMRLm/4DxuPc2QGReBiGg==
X-Google-Smtp-Source: AK7set+MrIYOKsZbuTQqg8lLgPFRD2rHtF/Qv6E5eMONJmV1qvMcAY+UK0u07xSIxyUM1ZYtf/GaNw==
X-Received: by 2002:a92:cda3:0:b0:310:ba3b:faa1 with SMTP id g3-20020a92cda3000000b00310ba3bfaa1mr8212401ild.14.1674913622226;
        Sat, 28 Jan 2023 05:47:02 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id y8-20020a92c988000000b00310a798fce0sm2223992iln.1.2023.01.28.05.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 05:47:01 -0800 (PST)
Message-ID: <8deaed16-385b-6108-e971-0168df2b3c2f@linaro.org>
Date:   Sat, 28 Jan 2023 07:47:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next] net: ipa: use dev PM wakeirq handling
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20230127202758.2913612-1-caleb.connolly@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20230127202758.2913612-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 1/27/23 2:27 PM, Caleb Connolly wrote:
> Replace the enable_irq_wake() call with one to dev_pm_set_wake_irq()
> instead. This will let the dev PM framework automatically manage the
> the wakeup capability of the ipa IRQ and ensure that userspace requests
> to enable/disable wakeup for the IPA via sysfs are respected.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Looks OK to me.  Can you say something about how you
tested this, and what the result was?  Thanks.

					-Alex

> ---
>   drivers/net/ipa/ipa_interrupt.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index c19cd27ac852..9a1153e80a3a 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -22,6 +22,7 @@
>   #include <linux/types.h>
>   #include <linux/interrupt.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>   
>   #include "ipa.h"
>   #include "ipa_reg.h"
> @@ -269,9 +270,9 @@ struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
>   		goto err_kfree;
>   	}
>   
> -	ret = enable_irq_wake(irq);
> +	ret = dev_pm_set_wake_irq(dev, irq);
>   	if (ret) {
> -		dev_err(dev, "error %d enabling wakeup for \"ipa\" IRQ\n", ret);
> +		dev_err(dev, "error %d registering \"ipa\" IRQ as wakeirq\n", ret);
>   		goto err_free_irq;
>   	}
>   
> @@ -289,11 +290,8 @@ struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
>   void ipa_interrupt_deconfig(struct ipa_interrupt *interrupt)
>   {
>   	struct device *dev = &interrupt->ipa->pdev->dev;
> -	int ret;
>   
> -	ret = disable_irq_wake(interrupt->irq);
> -	if (ret)
> -		dev_err(dev, "error %d disabling \"ipa\" IRQ wakeup\n", ret);
> +	dev_pm_clear_wake_irq(dev);
>   	free_irq(interrupt->irq, interrupt);
>   	kfree(interrupt);
>   }

