Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55E9C43334
	for <phone-devel@archiver.kernel.org>; Tue, 14 Jun 2022 18:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbiFNSfx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 14 Jun 2022 14:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiFNSfw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 14 Jun 2022 14:35:52 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3EF49687
        for <phone-devel@vger.kernel.org>; Tue, 14 Jun 2022 11:35:50 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 187so9302258pfu.9
        for <phone-devel@vger.kernel.org>; Tue, 14 Jun 2022 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/BHxuvsblLJskDtY/Ztfk5dtjeHyzSHSV/rpTnqFptw=;
        b=lcoBGgDAY+q45GquTu+sVCB0NXJEi5szmJMRopFLtIAqeBX+DDMcbjxDxiFwpC6zuq
         SaP7ZnWqwKmm1ss9NYvk9GsPgjTWagLliMbiufb3MUDO2jPbOJcUZ5EaZ55OIlsxwLEF
         NkHIEPzarwZ0qK4KUQZJvUYA7rom3TlhIw+uiT5pGZDKFXtbOxbcntaM0B90E1sEpwNn
         vmAN8Vpw7zfFPSf81U2uSU2RKS3fkJdH+3VuIyFkmkuBoOoLImfiXvobBy8ahzbbR68Z
         xAGNn3t4qswNweXxmmwC5EB4Bhyi5ust0I8h6rtp+ELtY3a5nfz0XBBFbiLVxTplFWXT
         kehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/BHxuvsblLJskDtY/Ztfk5dtjeHyzSHSV/rpTnqFptw=;
        b=0vTAMMx6AkaSTgdIG7hxly7awETTBHGUg4zmXEjpkP53cfLCAJY8i/B9nFikawPDBf
         dlUqpMNVBKitdtXhgJQqo4GOurmzIr9TIc6b32rs7hOyhABVThxxLcN1mnWCNDspqOkb
         X0n5QnqIEaj5gupa0zQLsThxbTGbJYZG+Z4gIr7QEfs0EjaxsHuzixlIzMzZDQ9vTJrA
         mgJx/G1Z91rOrkJpxmNqMgUlzpHezZspsJkjcguCepoPh9xZelf5QEMC84Pe5aAi3CzR
         7bk2hVT3DCn2rZmkB5I/7j82dmXKk79wDkFduurqfIgBxwzOt+80pVLBh8DQc8C6/gXA
         tv7g==
X-Gm-Message-State: AOAM531cIai5K9x1kjVsYkz8sZLfFlbLXOzcu1U8x/z3ijYIusKlhBot
        MGmaYWllm0CVpREO3Kjx6c4N8w==
X-Google-Smtp-Source: ABdhPJzDFH6QBQEGfpJxh/mQFjNzcSLTTlMIgYVW/e/UgH6wiLL/c2cBLAcoqjqL2X2p7IuRr9EweQ==
X-Received: by 2002:a63:d50f:0:b0:408:994a:96d5 with SMTP id c15-20020a63d50f000000b00408994a96d5mr5600253pgg.299.1655231749808;
        Tue, 14 Jun 2022 11:35:49 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id r21-20020a170902e3d500b0016393148c9esm7522489ple.110.2022.06.14.11.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 11:35:45 -0700 (PDT)
Message-ID: <277ec646-b709-4a4a-8216-49d528d0e43e@linaro.org>
Date:   Tue, 14 Jun 2022 20:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
 <20220613133819.35318-3-angelogioacchino.delregno@collabora.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220613133819.35318-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/06/2022 15:38, AngeloGioacchino Del Regno wrote:
> Some MediaTek platforms with a buggy TrustZone ATF firmware will not
> initialize the AArch64 System Timer correctly: in these cases, the
> System Timer address is correctly programmed, as well as the CNTFRQ_EL0
> register (reading 13MHz, as it should be), but the assigned hardware
> timers are never started before (or after) booting Linux.
> 
> In this condition, any call to function get_cycles() will be returning
> zero, as CNTVCT_EL0 will always read zero.
> 
> One common critical symptom of that is trying to use the udelay()
> function (calling __delay()), which executes the following loop:
> 
>              start = get_cycles();
>              while ((get_cycles() - start) < cycles)
>                      cpu_relax();
> 
> which, when CNTVCT_EL0 always reads zero, translates to:
> 
>              while((0 - 0) < 0)  ==> while(0 < 0)
> 
> ... generating an infinite loop, even though zero is never less
> than zero, but always equal to it (this has to be researched,
> but it's out of the scope of this commit).
> 
> To fix this issue on the affected MediaTek platforms, the solution
> is to simply start the timers that are designed to be System Timer(s).
> These timers, downstream, are called "CPUXGPT" and there is one
> timer per CPU core; luckily, it is not necessary to set a start bit
> on each CPUX General Purpose Timer, but it's conveniently enough to:
>   - Set the clock divider (input = 26MHz, divider = 2, output = 13MHz);
>   - Set the ENABLE bit on a global register (starts all CPUX timers).
> 
> The only small hurdle with this setup is that it's all done through
> the MCUSYS wrapper, where it is needed, for each read or write, to
> select a register address (by writing it to an index register) and
> then to perform any R/W on a "CON" register.
> 
> For example, writing "0x1" to the CPUXGPT register offset 0x4:
> - Write 0x4 to mcusys INDEX register
> - Write 0x1 to mcusys CON register
> 
> Reading from CPUXGPT register offset 0x4:
> - Write 0x4 to mcusys INDEX register
> - Read mcusys CON register.
> 
> Finally, starting this timer makes platforms affected by this issue
> to work correctly.

Why not fix the ATF ?




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
