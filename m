Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE617C4332F
	for <phone-devel@archiver.kernel.org>; Sun, 29 Oct 2023 19:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjJ2T4d (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 29 Oct 2023 15:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJ2T4c (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 29 Oct 2023 15:56:32 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4BDBD
        for <phone-devel@vger.kernel.org>; Sun, 29 Oct 2023 12:56:29 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4084de32db5so31701655e9.0
        for <phone-devel@vger.kernel.org>; Sun, 29 Oct 2023 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698609388; x=1699214188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBjaEDFH2L20pCiIDxvatCP6Y3N/isgm8vU1EI+Cv9k=;
        b=mZMy5FL7v4eWKOG7xM+D1+YMg8qx3cN4t9c2DV7n2W0YFN2jyg7KOJp61ZzyZR6OfG
         XMD15AVBEXELLKSDBYK43x2uZocQOZSswHgFdl2GHPqi0wesU/ZVlzVDYqsg3NEuqrRQ
         Je9PwRlPwcTiuVZKuu3ZQT+eXEVqcir+AFINJxy/+B5K9ANAqqbtTKYu+BVfU7pFo+SA
         lPjs8JD79BqU2Myj0exYjuwVxmMocB98uhkW6WdNCj9AAJ91sHcoG2xa2FWf9DE7q1pK
         6jJhnP4p/BzIlE+iSLPx5G+2jQHZKxVWFxz/WpalKEwnfjesS/Mvg+BaUI0dr4WkHGgE
         +/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698609388; x=1699214188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBjaEDFH2L20pCiIDxvatCP6Y3N/isgm8vU1EI+Cv9k=;
        b=cHLqgv4OoOnJC1dsb812IgN59DcXxhjq3Wa8uWJE1pwIFMl46MmZiMBb8zF2I4/5z+
         c2s9I/O2qvo+T//pCY+UhGDiFEPMAfFiw8JpqSqlCYOEWDaQT6RT3fFVUpeo7kQNLpTp
         4ND7qNUkzwestaT3eib5cehNxJRGlYZZX8WpG1e5DPY0UcfoRYWqtMgimgIpRMuVQ+sc
         mtOFnWDM/hiI9h9jt+78uTQ/a5ybmXYmOAvYGknv+7g4BOgJe+kR0s5ps8arzo61zUcW
         9Y4St97+92dZ2azuy1VrwK9LodgLfU2XsyrVWU7ES7SC+o2fBU4mgAAmzvbJqhsKjYTs
         l0wg==
X-Gm-Message-State: AOJu0YzrZWrgFK54G/Dtj/RNlBlreP8zl1jmjUlHmOOeu6LG+Qful0Tj
        Llqfo2bNc//biYmavQlHp615Fg==
X-Google-Smtp-Source: AGHT+IEi1Yyfb3UFTgrRlCELfvUo+XrKxRvz3CPs1ECtt3zmTkP2oaRcalosIGlPQTA3Htg7mSge+Q==
X-Received: by 2002:a05:600c:4f81:b0:401:23fc:1f92 with SMTP id n1-20020a05600c4f8100b0040123fc1f92mr6929891wmq.25.1698609387737;
        Sun, 29 Oct 2023 12:56:27 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c138700b003feea62440bsm7385225wmf.43.2023.10.29.12.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 12:56:27 -0700 (PDT)
Message-ID: <298df163-c4f2-4075-a33f-661276b2e657@linaro.org>
Date:   Sun, 29 Oct 2023 19:56:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] Input: synaptics-rmi4 - f12: use hardcoded values for
 aftermarket touch ICs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org>
 <20230929-caleb-rmi4-quirks-v1-3-cc3c703f022d@linaro.org>
 <ZTzlChOS0OR95Ykp@localhost>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <ZTzlChOS0OR95Ykp@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 28/10/2023 11:40, Pavel Machek wrote:
> Hi!
> 
>> Some replacement displays include third-party touch ICs which are
>> devoid of register descriptors. Create a fake data register descriptor
>> for such ICs and provide hardcoded default values.
>>
>> It isn't possible to reliably determine if the touch IC is original or
>> not, so these fallback values are offered as an alternative to the error
>> path when register descriptors aren't available.
>>
>> Signed-off-by: methanal <baclofen@tuta.io>
> 
> I guess we should have full/real name here.

I must disagree [1] [2]. These patches have my SoB and are being sent by
me on behalf of the author, who has no interest in contributing upstream.

[1]:
https://lore.kernel.org/lkml/c1bf62a2-e381-c796-2219-17a578987a76@marcan.st/T/

[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330
> 
> Best regards,
> 							Pavel
> 							

-- 
// Caleb (they/them)
