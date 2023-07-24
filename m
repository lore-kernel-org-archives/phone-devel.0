Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37104C0015E
	for <phone-devel@archiver.kernel.org>; Mon, 24 Jul 2023 07:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjGXHaU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 24 Jul 2023 03:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjGXHaT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 24 Jul 2023 03:30:19 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AFD13D
        for <phone-devel@vger.kernel.org>; Mon, 24 Jul 2023 00:30:18 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51ff0e3d8c1so5714566a12.0
        for <phone-devel@vger.kernel.org>; Mon, 24 Jul 2023 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183816; x=1690788616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eed6DWLt+PAEv2fzjhFaM4EpHWh4NNsUY/bR4Sum1Qg=;
        b=EmZgAehGQ97/7mCNx9Vh4rXZQJcq1j3xQYqIFIr5TzLHKf9EoUo2a0OM13XHKRWmoO
         wNJymeEVAkOy7CkiuWPXHku39fqur6sFta09jHEwYX2ZE1Fz0s0Ljidbj5SNnElE6ijQ
         y1p74Ik8p3rw3wN/2Ftn04UwSkFSjXiAqjnrkOMgAZzXtooaOoJ7AgnCWrCR2lIxzUg6
         EvY7azry2ww+y7w6yfjja3fNmWHBIdvxfZ881+z2y2NZn6BmjlnReCEixqnzJ3tNB45d
         ASFCA63fD7ZsB5r43yBmsXWcTpEhqYk1Xe0QFXWQ2mGEA4V3jk465pEqejM15Y0jQC5m
         QYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183816; x=1690788616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eed6DWLt+PAEv2fzjhFaM4EpHWh4NNsUY/bR4Sum1Qg=;
        b=KOqQrRv83EKf/dORtpESBncCs6FprJ5pHNkVdDeG7J5+uZlpAii19FQC6XU1Tv84TN
         5/AHsYVumvdmzx7r3QlfnE2XpI8N0Qikw3gjqSTCPpKIqLICa2PgFd1zGBB97nhHsAWu
         5hYStflMRcD4+i3n/LCu+6gd4Z8eWp1dTLY0fE9E+cORWvucceMROPClfftZ3BWFL/AB
         73NBLDVrZXHDhj0MHQXCM0D1FjGLYKf8ryJ7S0K2BGqO2f5FHPP4I5Z8Vr9Ima4B9qVI
         OT2dAdPueEJXRD0TSLbzpNoayEG0K7bxVqWPN/jllsciAq3R9xTBWQFSdoR1g7UOW1X9
         VjXg==
X-Gm-Message-State: ABy/qLbGgI1bSK+BpgT1tQ7RT6qxb6lZVRVQiZhqkkan/RHT2zuc3usf
        KPe42bu+ILyvW85K+p4Frre1tg==
X-Google-Smtp-Source: APBJJlHN5lEzBHCiCy4veV+lfNob/NcWAOyoO7Ae0VmOjJ2HIf52w8Jy/W8Xuq9xRA3IolmjYuCDkg==
X-Received: by 2002:aa7:c753:0:b0:51e:1a51:d414 with SMTP id c19-20020aa7c753000000b0051e1a51d414mr7133256eds.32.1690183816446;
        Mon, 24 Jul 2023 00:30:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q16-20020aa7cc10000000b0051e0eba608bsm5717511edt.19.2023.07.24.00.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:30:15 -0700 (PDT)
Message-ID: <22ebee3c-c11e-ed0b-bade-c9a845f3ca41@linaro.org>
Date:   Mon, 24 Jul 2023 09:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: qcom,hfpll: Document MSM8976
 compatibles
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230723160827.22660-1-a39.skl@gmail.com>
 <20230723160827.22660-5-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230723160827.22660-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 23/07/2023 18:08, Adam Skladowski wrote:
> Document MSM8976 HFPLL compatibles.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,hfpll.txt | 3 +++
>  1 file changed, 3 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

