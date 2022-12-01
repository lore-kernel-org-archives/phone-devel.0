Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BE2C4321E
	for <phone-devel@archiver.kernel.org>; Thu,  1 Dec 2022 16:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbiLAQ1R (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Dec 2022 11:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiLAQ1Q (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Dec 2022 11:27:16 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4C6B68E4
        for <phone-devel@vger.kernel.org>; Thu,  1 Dec 2022 08:27:15 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id g7so3281274lfv.5
        for <phone-devel@vger.kernel.org>; Thu, 01 Dec 2022 08:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ioDN+pQOq5HgtdlEf9mzg0ol1oWyOo4wG8Vd6+93HFU=;
        b=DcPJ/+ro4LTVRBqT5fBcbYkOTmqVTNe/CEugS6D/beI6xfBxbs78ENrgSxClvaMHcf
         RkbIdl7gtHfOWwI7vMXWHhX3/ZQJeTmu6dmNEE9l+s7/JEKxMpaKnirFvkUKKDnsR6jx
         L1MSIZ/lnV08pyOMAh+9dQPAme6uv1CtegPV9HmyAnBJp+wpSBA3UaM+weZbXxut9o39
         ByIve5BWXDhp765OWpbJ6zeXzaR0ZoPf+5HezQBGY/u0jgUdnTuZA2W6Obo6IM5ajJyK
         hLpoSl+NddeROjGsWeZjbzHBYqzf/+UCxy4xp9TE3sE07m3HM/2L4X1wD2zpQgYSdMvh
         m46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ioDN+pQOq5HgtdlEf9mzg0ol1oWyOo4wG8Vd6+93HFU=;
        b=PMjysx3r3L75uvH4b+VgsCKzHByTZArX5PVCxx5GGDauvfj02bIUtaLDt/Gd+xgLdG
         GB34gYGmxTo+8KdW5iWWSIuimN95XXT+N9/a7kp2Xxt4eCF6yq8Npu4pZV0B/jkwl1jS
         d6PuFibJ4ekB8ZPmZLU8g5hCaR0qHWtiRSJRBS00DUqn1icRGhUo1GesB/8mqrDeU8Jm
         p4mNNWkmEGvKEOPKlC9Ib0UBl+lL8g6wDbO+0AqcNM2FCyjKUx/jciHeXilmsCtOU+qh
         faMvPZKPRMrR9yFTLlYdutm4vClJd4LrEBs6VuzVCeBZQMdqG3kt8msylfM9py7A4Rw0
         y39A==
X-Gm-Message-State: ANoB5pkAxYcFwt7Ga3do36IwYDJ1dE+/MvctxCMCA2djH3/ckf1/9dNR
        NC7gpurRdy6F6lujuYRbR+5OEQ==
X-Google-Smtp-Source: AA0mqf7SXeJYAFY40xLBV+mv7rmI1226pH4qxPkT72pkjWhQqM7mclAyG6E0AGksRTezv8lCWk5gNA==
X-Received: by 2002:a05:6512:3a7:b0:4a4:77a8:5ba1 with SMTP id v7-20020a05651203a700b004a477a85ba1mr20981287lfp.569.1669912033890;
        Thu, 01 Dec 2022 08:27:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p21-20020a2eba15000000b002796fb63dbdsm439396lja.13.2022.12.01.08.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:27:12 -0800 (PST)
Message-ID: <9ea881a6-5786-2e3b-7341-60180359d2b0@linaro.org>
Date:   Thu, 1 Dec 2022 17:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350
 compatible
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221130081430.67831-1-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130081430.67831-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30/11/2022 09:14, Luca Weiss wrote:
> Add the compatible describing the combo phy found on SM6350.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes since v2:
> * Drop misc schema changes again since same schema applies to sm6350


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

