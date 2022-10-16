Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA185C433FE
	for <phone-devel@archiver.kernel.org>; Sun, 16 Oct 2022 15:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiJPPDM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 16 Oct 2022 11:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiJPPDL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 16 Oct 2022 11:03:11 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F0C41D1C
        for <phone-devel@vger.kernel.org>; Sun, 16 Oct 2022 08:03:05 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h24so6094038qta.7
        for <phone-devel@vger.kernel.org>; Sun, 16 Oct 2022 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzvwTMSw07ABrDaayCgmtud3SdcvEAeM6AiZcmocPSY=;
        b=kIzHvxErSVmdpJvFvU9Vz4nFeDGuLpvoTBfdwJGS+c4txKn5I7jebPxATJBeuLRVLq
         3sSb/derXAqtnw/dwiV+d9NBYcTggBQPe0K7G3Mmlxao0k8XapS4Z41IrJtYuZn2H48d
         EWaldfISw4+VydHYRlcSQpMycdOqPMBVqUZqn3/BzXCthJPxfjrdHJhwImMVkPIft3lK
         zR8OdWvGaNTH6+Lo1Oiwc8g0lS3UKEyE33/6Dv/F3bSGg6tJyoZuJ69oE0nTfcELmJQ2
         LxmEKQ2Puvjlb9nLQh1uX5PCnhmxkAkuG7/jJLJPc/PEClzQn9QZqnknlFR/HLl3BFLg
         6J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzvwTMSw07ABrDaayCgmtud3SdcvEAeM6AiZcmocPSY=;
        b=dNi5Wk+P5F6u12O9lBEFouCqi2PCh44tuWaIOFUNQikVepy5uzRDtzmXqztGmsZ959
         ijAAAxc0m4Xnd+XfsVfoHRv7gKdIGeehEiiAvssRtZQLvS2kUueD1z+j2Mwkq3B6Z33p
         J1dj77UFVQ92nKFuEhr/4+ZGIqvEjTi7plUenBL6GPjdZBx+Te/KCeNFE+m+cCGm8ZoW
         p3Jc46vDezp08q6Zi4umAxQUIoBMsGSTMgLGSjM/4ViItR6mAlu3xgWYreqkiMGEL6+a
         P/DYxiGdXpVMcXDxkYZHdaodWIGDLUUNxVhD2nAQ7yYgtyBKz4J1K4dMMALYLLgypJam
         MNdw==
X-Gm-Message-State: ACrzQf00UB25fgnKZwVcMtyED8AWfSI/9mT4abuDha4CpaT4lb30FlAW
        GcTRzCjBiVnSR5/UJS2pQKNzsA==
X-Google-Smtp-Source: AMsMyM7MI4MznPnSRUqpABKoUxqzhTj/616aM1ma4X3elQoeOPHjLUgZ5XfE/YXnms/IeHvE/RF0JQ==
X-Received: by 2002:a05:622a:1a9d:b0:39c:d634:be42 with SMTP id s29-20020a05622a1a9d00b0039cd634be42mr5469607qtc.476.1665932584256;
        Sun, 16 Oct 2022 08:03:04 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id ay30-20020a05622a229e00b0039cb5c9dbacsm5902532qtb.22.2022.10.16.08.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 08:03:03 -0700 (PDT)
Message-ID: <734431fc-e2d9-df81-ce6a-87d38e71e9f5@linaro.org>
Date:   Sun, 16 Oct 2022 11:03:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 4/5] dt-bindings: soc: qcom: aoss: Add sc8280xp compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221016090035.565350-1-luca@z3ntu.xyz>
 <20221016090035.565350-4-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016090035.565350-4-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/10/2022 05:00, Luca Weiss wrote:
> Document the aoss-qmp compatible for sc8280xp.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

