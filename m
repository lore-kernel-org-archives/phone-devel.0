Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D4CC7EE24
	for <phone-devel@archiver.kernel.org>; Mon,  5 Jun 2023 14:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbjFEOjb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Jun 2023 10:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbjFEOj3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Jun 2023 10:39:29 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740FAE9
        for <phone-devel@vger.kernel.org>; Mon,  5 Jun 2023 07:39:26 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so41336085e9.0
        for <phone-devel@vger.kernel.org>; Mon, 05 Jun 2023 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685975965; x=1688567965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fm6omFP2aCod8XtHm5L9yMfAAfEAX4qQM59CrdBf6A4=;
        b=RMH5yFvFB0L/bXyqSylorgHfQYaSpe5UFg3pbVvpMOsYNLI+duwnbm4E/mAvX75tff
         pftEb/5lY+zanSgbOgffu9KDhISS58D8Xzemn47sA6Q2fqNB/zT7GhuayAIJ04hgumfb
         8hkcYIkG+zOleWLy2rc1b3Gda2R/6i9NZ9VIh66Oir26xsZEdC5BxsaywJ7Ma9YRl5kK
         vl/J2WNI6h+e4m3szVQJcin+zCaQYog6iyf8jn0GOsw+Nbd7lLfuyRn6YZ5Z8Qh4gOtt
         qfwpfL/HDDZE7drv2hGb4s5QnTyB1oQelYwLG9VaI2suY8m/wNeNqCM7IbbYsBmNcSAg
         ppQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975965; x=1688567965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm6omFP2aCod8XtHm5L9yMfAAfEAX4qQM59CrdBf6A4=;
        b=M80TB9QkZQz+0qVqSZNO4Z/JnLAMM88N2u1vPX3bMX4kw6b+0VpV4z0dOs5gHl5DWl
         cfiiexCNvrOjufRdRSxizNSj/Inpj9fcSY9xT9c9ViYQrA03CBtWHb0BzejOqq5WmPVW
         0k//HSmJc1cb9eLIihtpIPHu5fluWkUYmFC/3SSFndJUd41ApI6hzg+vJGg+Ss/et2cQ
         VL5EUzOCInLPqAw422SeAJU8tSwA/2Gyc2lTdx5Zt6OYnZOn4wk2/Yh7AJu5kcNMx8Gz
         jW8+2MsbDFcWYz4gZqi/SlQ5selWsfYW5dYskCEMV2tHs9lDDRrysi1J4mgpoUAmyX3R
         9OrQ==
X-Gm-Message-State: AC+VfDxgWZa34q9tLBrTe4FncoQN2jBKr5B6/r0c1RSnprB0okcGKL0x
        J216Qbx4zm43AZE9Upp2zPqKWw==
X-Google-Smtp-Source: ACHHUZ7Qw6Z8nNf0J0a233uM9vzNDjf3b+Y4VTNAP90U+Djmy4CPnjwmIeGuRE/YDnhaRXFeMoTCcQ==
X-Received: by 2002:a05:600c:2947:b0:3f7:3074:d2f2 with SMTP id n7-20020a05600c294700b003f73074d2f2mr3626394wmd.34.1685975964911;
        Mon, 05 Jun 2023 07:39:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2385:9257:ace1:1efc? ([2a05:6e02:1041:c10:2385:9257:ace1:1efc])
        by smtp.googlemail.com with ESMTPSA id c4-20020a5d4144000000b0030ade1b9400sm9960903wrq.30.2023.06.05.07.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:39:24 -0700 (PDT)
Message-ID: <4097223e-5297-1536-18bb-512ef28c8329@linaro.org>
Date:   Mon, 5 Jun 2023 16:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/6] thermal/drivers/qcom/tsens-v0_1: Add support for
 MSM8226
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230507201225.89694-1-matti.lehtimaki@gmail.com>
 <20230507201225.89694-4-matti.lehtimaki@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230507201225.89694-4-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 07/05/2023 22:12, Matti Lehtimäki wrote:
> The MSM8226 TSENS IP has 6 thermal sensors in a TSENS v0.1 block.
> The thermal sensors use non-standard slope values.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

