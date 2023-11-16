Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEBAC54FB9
	for <phone-devel@archiver.kernel.org>; Thu, 16 Nov 2023 14:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345360AbjKPO7i (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 16 Nov 2023 09:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345357AbjKPO7h (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 16 Nov 2023 09:59:37 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02904D5B
        for <phone-devel@vger.kernel.org>; Thu, 16 Nov 2023 06:59:34 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50970c2115eso1364969e87.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Nov 2023 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700146772; x=1700751572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZznfpNYp2K+gv/eV5dWRUl0My2eaThlyxN6BclNZEOc=;
        b=zYNjg7CI4EPWRIJI2C6N4Qjjxj5TaGUNhvDz2Jqh0eHhvEY7E6b+Kyy2Vr7P8j0rY7
         jq39W1ECNQgbE5iDHW1swMnYgVCYT2aEFcFyqCMYTG4Gx1w6s0U3j4pfmu54khoq7Dq6
         I6g/SCXTL31epj2XClSdRY5iVuKh72hhzjLXdh8V5NqdAwDGx/3Z1vasCLnkHTBrRRzU
         VjdbZqTrgBOXbQfvPzIsDaryWANpufJHPfOR1USHnLfg8yGsa14jO0RRtplBDrPCTXOT
         y6BPAeNYd9g1NFD/dudtEWvueCnAXwa6Lp79lgfHx0YTPvT5Y7BAaAUBHldz//HeL5XR
         Ffig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146772; x=1700751572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZznfpNYp2K+gv/eV5dWRUl0My2eaThlyxN6BclNZEOc=;
        b=OLTPECQ21Rkyzyq5NXVBLEpZuNZR8kvGPZM2e0nuOZ6meBuz/l3IU59g968xW9g77z
         8IkKpoppVkE1w58D+Q0jQzal0PacRtr0jkqkWEnm3HHlaM9xsvUckiOJ4YBJHCTmlvn0
         Cqjm023tzsoLbQOc+Cx61fvm6cICl+T4HX1faaANT2gB6ZYUT3dRXaH0Gy6ezmg8dwI+
         SiztOJQ0GPnqI1TV1aH9p85XSOwmylCucYm3W4qb4Io/DlwPOBq8D7p7zIP+wGFwD6hY
         dAovGsBRObIsWJNucE0Wo7qpCpkS+S/DIpdRhVY20+xf7jmEv1pQSflIUF1v1Ks3kdF9
         jDkQ==
X-Gm-Message-State: AOJu0YzNPwNs8VK6CVU7q1bSKCBfATJqDKbzb1I+iwE6SnYgJUQD3/0V
        aJ0jm+YPld1Rmsmv/uCa1DTIhw==
X-Google-Smtp-Source: AGHT+IGRhd32Eae/+/fJ/TOBsRvxst0EQUkVv4rV1p2XEMWXT+a+vnfSBCC+UA9XOPQ9BtFB8PMbJw==
X-Received: by 2002:a05:6512:234c:b0:508:12f6:ff07 with SMTP id p12-20020a056512234c00b0050812f6ff07mr14724159lfu.48.1700146772188;
        Thu, 16 Nov 2023 06:59:32 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a199142000000b00509463003e7sm17278lfj.186.2023.11.16.06.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:59:31 -0800 (PST)
Message-ID: <19f7f5ec-e45d-4dc9-882c-5015e3df62c9@linaro.org>
Date:   Thu, 16 Nov 2023 15:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 WiFi
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
 <20231113-sc7280-remoteprocs-v2-11-e5c5fd5268a7@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-11-e5c5fd5268a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 11/13/23 09:56, Luca Weiss wrote:
> Now that the WPSS remoteproc is enabled, enable wifi so we can use it.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
