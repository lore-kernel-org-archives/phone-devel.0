Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597A7C001B0
	for <phone-devel@archiver.kernel.org>; Tue,  8 Aug 2023 17:42:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234893AbjHHRmx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235095AbjHHRm0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Aug 2023 13:42:26 -0400
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08965A48
        for <phone-devel@vger.kernel.org>; Tue,  8 Aug 2023 09:18:47 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe2fb9b4d7so49854345e9.1
        for <phone-devel@vger.kernel.org>; Tue, 08 Aug 2023 09:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511417; x=1692116217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/ENPbWDACTq/gT25pwElyGsToVBQemAbfEgTyGefM8=;
        b=ivT1f0T0nwg1goFDF920oof6BJK2nNnUMIJ6WYdDYxl1SLLacFz4HF4FlDAi7oiEyg
         wPHaH9aw2mD6woU8wlmrHkHufsUolmQaXE16Jar+2ULa74dnUbxOJRIGd0cqx+hJe4Qg
         NZqin1B5acOXvHtFwpli2hFocvfumDNF67ZlCpXFy2Jflx1QS4UQVhtlL4ax5qJZfXrT
         inUd+iFkW5q4KGePDPp+ASKKUIwzsK8aJS365emD2AN5wD5A/aOW52COyhqa72AElA6l
         Au0b+4R7dgCDYfbthEQ23sBEnebdpKj4xV59OgmpFqp2SUoA9t1fxH/yfQTz+VutdWkF
         evXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511417; x=1692116217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/ENPbWDACTq/gT25pwElyGsToVBQemAbfEgTyGefM8=;
        b=UmepmuM6vX1n61SeS3XyEIDf/YiQWeRyyvxqReQ+Z7cQYcx+vUubZnMFcyk5o1Yfcr
         UBsp2cVZx/8d09oHywKH+vU5P4k4Q4G0DGg2mPY3CeZ3GIFuRPTVEmrqyxXzxc8PvpNN
         vdcKCu5pPbGQp3Jibe7kzSIfpt96LXntP8JLdYGErCDZ5PruIgv0+maiijV4WBQ8RhYs
         +7KDOCRzXrq05XveBa0KI2hM4lzJgcO4yI5S0SEFkztjAGtLFlSxdOcCslAM7OYsA5vu
         XyCpmcPxZVhT0WeRbB5li4oSjL1m57w8SqT+07VRPV07aMTrEzeFfMHHeqrVJW44xaO8
         9EBg==
X-Gm-Message-State: AOJu0YxCmzAYwLtjlxxh9zUgEjDn4INt6Ck/oPUiMvwgcpILv+rBdb+b
        MK6P3vKsKPjyeQDATeLIpVUU4+UQV/NEfse0uIg=
X-Google-Smtp-Source: AGHT+IH20o5oXu1MzFaME7Vqm8k1vG/h5IULgofIK8nWT0wfuYK0Ryctno9bzeuLujRtR/SQOzZBWA==
X-Received: by 2002:a17:906:d8:b0:99b:ca5d:1466 with SMTP id 24-20020a17090600d800b0099bca5d1466mr11379531eji.66.1691474329221;
        Mon, 07 Aug 2023 22:58:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e4-20020a1709062c0400b00982d0563b11sm3463474ejh.197.2023.08.07.22.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 22:58:48 -0700 (PDT)
Message-ID: <9e235de6-972a-84e5-3e09-f0b07b10e28d@linaro.org>
Date:   Tue, 8 Aug 2023 07:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 0/8] Initial Marvell PXA1908 support
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230807-pxa1908-lkml-v4-0-cb387d73b452@skole.hr>
 <5723818.DvuYhMxLoT@radijator>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5723818.DvuYhMxLoT@radijator>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 07/08/2023 23:02, Duje Mihanović wrote:
> Patch 8/8 is missing because b4 lost connection to my SMTP server while 
> sending it. Should I resend the whole series?
> 
>

Just send patch 8 manually setting in-reply-to= argument to git
send-email. b4 maybe also has this option, I don't know.

Best regards,
Krzysztof

