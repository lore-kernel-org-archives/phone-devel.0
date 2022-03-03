Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8D5C433EF
	for <phone-devel@archiver.kernel.org>; Thu,  3 Mar 2022 15:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbiCCPnn (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 3 Mar 2022 10:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbiCCPnm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 3 Mar 2022 10:43:42 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF6965D1E
        for <phone-devel@vger.kernel.org>; Thu,  3 Mar 2022 07:42:53 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 46C803F5FD
        for <phone-devel@vger.kernel.org>; Thu,  3 Mar 2022 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646322172;
        bh=ME4I2xtDxLjtSdGBX3DKk+XrqVNliOSTqfJoYUoRWk0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UOyA3UQCRiTXq3BUUQLdGK40qlctSLcRko7WtSOm4zJRti1g0/cnpZsVW+AQ0O2Ld
         ubJFtJ4yJtLMYiQw28qA3zrF5+f9/tfUuwyTEkEqlLx2w8TWilsXirgvR3kK8TpllB
         qPm8UlUaVRyYPv4zx0AuttJeYT1bktvs9R8jBSurfUtXNlxLPVo7sAW3wSInsOGwI+
         GnG1iieKNa2wl+GUlqU5r+XkP6ux09h3C46UTGDvr+Oy6JR6CkIw1e7IMck2IRlHZw
         1A696/WvfDdpdbt+EYZqhe71oTeYtAxRGJZmTAQxCBA8FsRQOHC1V0LvZGQ9rQ5FHi
         05f6pH5mLAC7w==
Received: by mail-ed1-f71.google.com with SMTP id y10-20020a056402358a00b00410deddea4cso3048227edc.16
        for <phone-devel@vger.kernel.org>; Thu, 03 Mar 2022 07:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ME4I2xtDxLjtSdGBX3DKk+XrqVNliOSTqfJoYUoRWk0=;
        b=7Wca0uUeckr95iHCYNNhyEpQYcAkviiaVnSI3YiTplnj5Uyu0ncwPXZTd8+0ambQfJ
         gAntpdanNzJCi+fV1RANvHpZ979ikpF3fJGwTsA1riWT+/6XfUb76J2Ytyqur5Pok5vF
         AENkH1+JRsIsD487aTepHhCvTfFR2yJtafTkmwgRFJPrRZ8vg3NpQi6YOWv125honsKB
         O90omsl2Ry6vbqTLTx+h6g0RiLdnVCYQyWlhjyUP5fDPpfoyZsOvb5hjgElvuFFDNO/p
         WjZvxyGgBMfOu6cCf3mfU3jXxGys/31scXk5JZU7TiNgRRGGweC3sMjiiLJfzqRphyuX
         TVgg==
X-Gm-Message-State: AOAM531/V/YX1XY6x4E4TQy/wSS28XDdTJsih27h3KScCfBd0ulEcVqE
        BDKElPy8IBc1cSeqxChzdIxa0ah1qE9eqk4w7Kyq84Ys33cFw94FZ6JnXDPCHmHxZlxF48KsqQe
        okDM4/VCAqc8ox8t+r07Hg7HrUhGvZFMzCfEuUQal
X-Received: by 2002:a17:907:3e22:b0:6da:83fd:418 with SMTP id hp34-20020a1709073e2200b006da83fd0418mr4705168ejc.321.1646322171423;
        Thu, 03 Mar 2022 07:42:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo2mCEi6JNvhbFVtiZ/5DeFZMU3OF1EMgZti7mkxs4OomQXS6Xn1JoWk2kQOUgUWbTOWbjDQ==
X-Received: by 2002:a17:907:3e22:b0:6da:83fd:418 with SMTP id hp34-20020a1709073e2200b006da83fd0418mr4705157ejc.321.1646322171259;
        Thu, 03 Mar 2022 07:42:51 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709062f8f00b006cd545d4af6sm817849eji.45.2022.03.03.07.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 07:42:50 -0800 (PST)
Message-ID: <758fc38c-53ec-4351-534a-95e1a54fb60d@canonical.com>
Date:   Thu, 3 Mar 2022 16:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: add QCOM SM6125 display clock
 bindings
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220303131812.302302-1-marijn.suijten@somainline.org>
 <20220303131812.302302-3-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303131812.302302-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 03/03/2022 14:18, Marijn Suijten wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM6125 SoC.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm6125.yaml    | 87 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,dispcc-sm6125.h    | 41 +++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
