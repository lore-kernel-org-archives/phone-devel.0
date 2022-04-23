Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B4FC433EF
	for <phone-devel@archiver.kernel.org>; Sat, 23 Apr 2022 19:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbiDWTxj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 23 Apr 2022 15:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbiDWTxi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 23 Apr 2022 15:53:38 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A77F3BFA0
        for <phone-devel@vger.kernel.org>; Sat, 23 Apr 2022 12:50:40 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id be20so5837892edb.12
        for <phone-devel@vger.kernel.org>; Sat, 23 Apr 2022 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6fjTjTPcfDZjkRtfhvn6NsFPWQqOM4LedF+co9scxG0=;
        b=hjd8kcCx3pivEDDrp2IDRrPDoNH+aRW8KquzJNIWY2VmN/etiAQrhLgaSVslvw1T1R
         CqyZ/787AF6zrK9I6IMSWLZ1/rYfdj6Sne30lX2gmtMgQeV6/qZCPYGeIZvvEvDyC6r+
         9tN6HjxWkkY11XjggALQ7f7EJ+jXHxulm7UADyOokXm3PwEHvLl99lAwa16b3uu6raQe
         khi6NChlxMNxkax9JJG053E/8JT/SJoKVN7ribQnXwDeeoxz0HL953m3yOaJU143UjZq
         YblIxrrhe/Jqb1nDIcmOdXsC+Te3n4QGr0Q/ATD7i7YpRcpVZrcU8sL7WIqi422tyzMt
         RjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6fjTjTPcfDZjkRtfhvn6NsFPWQqOM4LedF+co9scxG0=;
        b=uIwZUJ2I9KbcnjURSIDxB7dc507EpHJ8E4KfVxxaNtlAGiahpoTgq+NNshj/2ioptD
         V8HkUcpZu6srqXbOiOgGZBY6pw7l1CkOIF90TzSXVBP/AvAAyfOk+uOCZUbEHC3qGonY
         5LUkkgcXPtIoSz+u6/gvnnSAZmLdben8aUbFsOQT6FfNM1ifNgA4xoyheQMMdv8PjHKC
         hHDpCc85cXvFkTTtUTjla7wW/bTCRKeBrQJfXXkrTVjis0UuxE/W7+qvHGRLnYrSFM7J
         UskedEVSl0ETvVJRJO3fOnAacDYA74+DNpNihjCRZjNS2TiOR5jjq8e8XJlQeMLtrARD
         0UDA==
X-Gm-Message-State: AOAM530aDW0cKWoo50LRQD2Mdd/zRZPQDqi3TCIR0Ki4wQjnZsjCTghc
        aQUQJ34Oa3bSVxCOx9E2gf7p8Q==
X-Google-Smtp-Source: ABdhPJyfHhAc+3mt15wEfwhpPnCDtF/MqjY5igzzGbbebultLJxw+AxdkamvOD854af/fMAhWNJ9iA==
X-Received: by 2002:a50:9985:0:b0:425:c2dd:4cf7 with SMTP id m5-20020a509985000000b00425c2dd4cf7mr8186584edb.19.1650743438811;
        Sat, 23 Apr 2022 12:50:38 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y25-20020a170906915900b006f377b60785sm717862ejw.12.2022.04.23.12.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 12:50:38 -0700 (PDT)
Message-ID: <0c5a6c77-afc6-9314-e238-28fde7eacc85@linaro.org>
Date:   Sat, 23 Apr 2022 21:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/4] interconnect: qcom: Add SM6350 driver support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20220422144021.232993-1-luca.weiss@fairphone.com>
 <20220422144021.232993-4-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422144021.232993-4-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 22/04/2022 16:40, Luca Weiss wrote:
> Add a driver that handles the different NoCs found on SM6350, generated
> from the downstream dtb.
> 
> We're exluding ALC, IP0 and all _display nodes. ALC will not be voted
> from the kernel[1] and IP0 is handled by the clk-rpmh driver[2].

(...)

> +
> +static struct qcom_icc_desc sm6350_system_noc = {
> +	.nodes = system_noc_nodes,
> +	.num_nodes = ARRAY_SIZE(system_noc_nodes),
> +	.bcms = system_noc_bcms,
> +	.num_bcms = ARRAY_SIZE(system_noc_bcms),
Apply all the changes I did in this set:
https://lore.kernel.org/all/20220412102623.227607-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof
