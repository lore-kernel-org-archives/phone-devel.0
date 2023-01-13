Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CACC54EBD
	for <phone-devel@archiver.kernel.org>; Fri, 13 Jan 2023 08:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjAMIlf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Jan 2023 03:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240729AbjAMIlY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Jan 2023 03:41:24 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD89F544EE
        for <phone-devel@vger.kernel.org>; Fri, 13 Jan 2023 00:41:07 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ss4so43390630ejb.11
        for <phone-devel@vger.kernel.org>; Fri, 13 Jan 2023 00:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yz1iep6wwOeN+vmRCG5+ADl2hYT6VJO9EZLLoXnFTT4=;
        b=OlhSzGW8EgrgMP1Z9Eq9dQ0rABO1GoOJqbb/OQy8GNngicmpYf0/Eu1EYglMp7RHoS
         3/s7+UDUhPFp7YqV+rb27RJHi5+9d2SMnA9vMI4T6KY7HEzYIAiuvULGmMCBmP5GU6ZO
         3N02Q02Kw5oKmBSPgJX8R3xB2l3kzrJxRmOTR0IKSNgmpI20J2kJzCorq3m8ERXRbILE
         Gw62ITtgGut79kPUKXteSVfCgjZkmepWkjuNZpFwMEeTIDeYQljKYd8BTrR2yKNRspMH
         BByTeCfIVwsZH6GLnUqJo2bM5w39556+jV7gyS/+kzPAYfrcJLC/zDOkRI6xXFW0sTIJ
         MpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz1iep6wwOeN+vmRCG5+ADl2hYT6VJO9EZLLoXnFTT4=;
        b=5mbZI9Us1iRgGgFAr6EdYuDce2b0ruy8YI/zeKciCf4hTWzrirmLws92KcaN3mcXr/
         WOjHKTKgJ7LETkAnV3JNnAEXTjeoT+GP+7hOlMT7MQ82igkxcqjtpr3y8RX0d37RCsse
         fxlrIg0WRtOWGhPdfoZwHTmgrXhEzDUIKT19vWeIXiIBolHR/g1Fs+hXY4AhZlIF2J4K
         +NhpXahDh36iCSOEnDkczM6VvWdcANSqy3liHbWsttwOx1aF9b+VVkYI7EjsQ/egJoUG
         6sGN0GY/ihzyd27moGJ6Y+Q9HlLupcJ+1oik60NKedNmOBi9n5KWiq4QxIlS4qXcrs7G
         SsqA==
X-Gm-Message-State: AFqh2ko8OzA1MAW2GKtdPkhxIVc92kn8CZr5cVXs4y/rfABgY62vCjyS
        MMsG0suB2ZoVIRi2bZd5/avhZQ==
X-Google-Smtp-Source: AMrXdXvb3jZmU5kReftlX2XLV/8iQFknuSeVjV7HaRg0dX2snzktfWyLZRA909hmS0Py6xIypC+Vew==
X-Received: by 2002:a17:906:2857:b0:7c1:8f53:83a0 with SMTP id s23-20020a170906285700b007c18f5383a0mr62796871ejc.13.1673599266400;
        Fri, 13 Jan 2023 00:41:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906310f00b00738795e7d9bsm8198314ejx.2.2023.01.13.00.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:41:05 -0800 (PST)
Message-ID: <4ab67085-b589-2a90-4289-a4f5665b182e@linaro.org>
Date:   Fri, 13 Jan 2023 09:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/8] dt-bindings: mfd: qcom,tcsr: Add compatible for
 MSM8226
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230112202612.791455-1-matti.lehtimaki@gmail.com>
 <20230112202612.791455-5-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112202612.791455-5-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/01/2023 21:26, Matti Lehtimäki wrote:
> Document the qcom,msm8226-tcsr compatible.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

