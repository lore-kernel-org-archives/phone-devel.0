Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD9CC47088
	for <phone-devel@archiver.kernel.org>; Sun, 27 Nov 2022 19:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiK0TAS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 27 Nov 2022 14:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiK0TAR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 27 Nov 2022 14:00:17 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9328CE3A
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 11:00:15 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f13so14320617lfa.6
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 11:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YuBw92pxeQwKVlKRbENz9IYihbx8j+4ZbQtAXKypSmU=;
        b=Rm9sozFdmP9JwIIDw13M91Boea212y8IU3s/nK2J4WM4L8oUTUO3me/Pn0lp2XhXQ2
         XMlZpOsoEj/BD4fHFG7+w9OyvTew3BSw8yXd9pxDu/D2R9d+ji326a1RhtoucCXGCQsn
         UHqyd17nrEKPsHQwRs51VuV2HSlE7AJeMByW01oSvqJDKtjIiltuwKEwdLBHn5+t51jz
         u1N+OTVEktz2JwsqL6rtmuuNEc8nHyyVVLQWq7uKAFUbUvyKCDxojo/duvDwT30T0bv6
         HyVlH3RG/YDz+afjn1L924XKNBEWinrfZGsnqHE8wewJbZvkh6GCCSny4WTt5Mu8cet8
         asyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YuBw92pxeQwKVlKRbENz9IYihbx8j+4ZbQtAXKypSmU=;
        b=KLHAvrdrR2Yq+mKzyFs6DKHx33pS3ZBrnEFyI06md+tI8IrcLUoY1Mx3+mkN31cJC0
         Ixh0JKB1OlNnZmcTRVCTtmYdX0SufzHyDld1xrNJrvE8kbEVNPza2jqF1fxmFS5jtOPM
         Zc8dMfXmFoTUgKaCkKBya3IGV3qPSvuv/JCZJAf0IJ0dpz7XZ+FJXTLEVrCM2+0loyGp
         O5ujlVv/U5e4VLRcZGB6U30NMHhX1wFP4o+lUdLEMI7KNhX1GYFlOFFnbRHZsUfWA9aO
         wBgMidua/RLGN9uoI5wYf9d5WI2HrdDAYpaJuZ/lKgsfA1gEUa39qE5A9DkUli/ClARZ
         SZfw==
X-Gm-Message-State: ANoB5pmyfGtrljYu6iqrxE+QFPTpyTxMIoyh5C0hm/sC6JNvcZXU/hWS
        eRsfrJhhBB6gG78k/v+5QzHF5w==
X-Google-Smtp-Source: AA0mqf5kbMlH8ISJnSS7Kf5zLj0aqFhsW5wI1U64+gddgHillrWAkqEDFJj2ZUkK9FOIPoHQLhl6Xg==
X-Received: by 2002:ac2:4f14:0:b0:4ab:79a2:4202 with SMTP id k20-20020ac24f14000000b004ab79a24202mr15483610lfr.414.1669575613815;
        Sun, 27 Nov 2022 11:00:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b12-20020a05651c032c00b0027741daec09sm979961ljp.107.2022.11.27.11.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 11:00:13 -0800 (PST)
Message-ID: <f11d7f03-c96b-590e-b71e-f854f1785b68@linaro.org>
Date:   Sun, 27 Nov 2022 20:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document Lenovo Xiaoxin Pad
 Pro 2021
To:     David Wronek <davidwronek@gmail.com>, linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221127170858.440040-1-davidwronek@gmail.com>
 <20221127170858.440040-2-davidwronek@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127170858.440040-2-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/11/2022 18:08, David Wronek wrote:
> Document the compatible for the Lenovo Xiaoxin Pad Pro 2021 Android
> tablet.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

