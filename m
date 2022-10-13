Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B80C433FE
	for <phone-devel@archiver.kernel.org>; Thu, 13 Oct 2022 21:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiJMVTK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Oct 2022 17:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiJMVSr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Oct 2022 17:18:47 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9E4900FB
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 14:18:24 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id i9so2148501qvo.0
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 14:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kapsffevo7CiEyz0RzVrGEoVlV5mkWbfwdc9eC+twpE=;
        b=e9jgQtk6B0QyKrNah7ZqUZxxivK03N2oEntaWnQfofK65ngKboOvppvw2o/ZjZGDQo
         aHjmjaaIFuMBZtc485FtqbjAKhKlcuiUewyy/RM2AjU+z1nrFjuLGVpBsITP9sK9y9ml
         WklnVabFvSNTtywMAiCGn3E/ZcFESB8ImMJySwfufwjfPL/NRoK9pYx/YFgKqzEeEQuq
         ZXFZLu7BzLeXf916YvIfaay8L6sC59nX1bQ4ippQv1J5oyrwlgGIiyhD5XG+BggNX7o8
         YKuddxyDTcA/JhkUn5Q+tCsoUcL6oAGYBrhoQs+44Lg12hlsI5EMLTkaY29481IXCSsr
         3T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kapsffevo7CiEyz0RzVrGEoVlV5mkWbfwdc9eC+twpE=;
        b=VWL+6oT8tEm/h48QGV8qJomovt2cIZ4RU55ElOYUcJo2aqFv/JbUTYUIc2LYo5+LEt
         rR9pU/riuZvPN3CaTyD9B8Vh5w7zHClGNg7RvZCm4V3+oVOygasmhMbV2p9WVbnY5IkF
         t8NHgejYgp0bUeWFahemlN/waj0TMYPzngCHw4p/oj/c6W20AHWfFNzFeKCx6PXc1/BF
         dldo21rP6aQrJsmgCLRPj2R2L3ag+9UqP3gLp1vLxE3HkKyjcTRNd0TpK1JBz0y3tVV9
         vxZy4cQgmw5g2ZzXewRGV0QGj0hrhY/7cYVqTyI5pRg2hYV62Ml6Yru2kT1+hGjeJtnh
         +y2g==
X-Gm-Message-State: ACrzQf2+Ii0gvgD+mFWio0fcR5KIK6+Ccn9CPcCuJ3JiVfVqPkdIYzGy
        k0SFcpUsn8ZBTGv4J5qXXOjMLJyxD6WTYw==
X-Google-Smtp-Source: AMsMyM4ZIBu4HZXfpI+8e0m7scRAcHECSqvEtArxQcX5dfEfLzXy+g3tz2P5MPZeekNo0dqRVe6Qaw==
X-Received: by 2002:a0c:a953:0:b0:4af:a643:dfc with SMTP id z19-20020a0ca953000000b004afa6430dfcmr1823330qva.10.1665695871793;
        Thu, 13 Oct 2022 14:17:51 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id w6-20020a05620a148600b006bb0f9b89cfsm613550qkj.87.2022.10.13.14.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 14:17:51 -0700 (PDT)
Message-ID: <163116cc-a5b1-aa98-01de-c24702a7aed7@linaro.org>
Date:   Thu, 13 Oct 2022 17:17:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 3/3] ARM: dts: qcom: apq8064: fix coresight compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013190657.48499-1-luca@z3ntu.xyz>
 <20221013190657.48499-3-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013190657.48499-3-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/10/2022 15:06, Luca Weiss wrote:
> There's a typo missing the arm, prefix of arm,coresight-etb10. Fix it to
> make devicetree validation happier.
> 

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")

> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

With fixes tag:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

