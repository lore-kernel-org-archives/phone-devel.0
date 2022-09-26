Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9BCC07E9D
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbiIZIxN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbiIZIxL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:53:11 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1713D599
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:53:07 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id t16so2604682ljh.3
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=pWOHmZ8E2Cu1dLgJ7asOhy3zHG160ayaZ2FbZvz261c=;
        b=aNc4BJHhjnh1fR9WCl0peylVqakw6v+i/Oi7ZTYVB/d+XvbWtMG5TqnVnE4QVvhpaL
         jasloUKpm1elTA15qfaHEXtHZADJ/EcfnLB/jkbCPRcf9Ys0qt5VfuQ/1FvblhKOjCAj
         pSUcK8qbU8CmFq+G0o8lt7H2mIg7kjgPR0/4Oe7FCdn5ALBUJl1c/Kiqx5Zc2UvLm8Vy
         cQEldEhSy0IWUtmHMdEf3LIhM773EDtXda8jXHxX+6uB9U/cj4QoOsibWjwf0Q+kjkt8
         D6/R/hnNtyD1QNtDHnxfzgoorhQl6LtUR4MeuOBL6rfhZMnRePdfidFlEgjX5qgOG4P+
         tLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pWOHmZ8E2Cu1dLgJ7asOhy3zHG160ayaZ2FbZvz261c=;
        b=6KjKBJxcbQkFoIBk8K7l2o3idJbntbO8eAX5Hc7eUdeuMNrhr3ybAuR2Gk1B3yUWia
         RvsqdbtBITvnND2rbS8Wzm/MKLGWstuSanFh41UdvQVIBextU6yAVAmcTBGh4UUTDWDL
         xA47qAjziZWOngGIyTOm/wrX4eb8caXuxPIpSzadE+fEj6XVEzNALA9JOtTYTciArIjU
         OVh6y6sJ9zN64paAz/YRtVy0LSjNk1M7hj3moT4yge2yMd1dLVIqwqIMYlZ3WK/pBeqG
         6FJwP46NJg++UQNnRshNmD6q8+fRwynimWm2vfdo8wnuDe/N+OobAEbh/aEjXan9mE8C
         ElHw==
X-Gm-Message-State: ACrzQf2g/vLyc9xImi645cbH4HtVE6EcXFLAla7c77klzSmTO4M0ARBP
        B0CjDdmrgyLVZdz6TU08Xb2JsX/0aCC8fQ==
X-Google-Smtp-Source: AMsMyM6VuOH6igw6JziYly4OClY40KRp0xPRhIeOGJFZvE/PKxRm5TWnlRfvp6nk78lUnYxK4fBNgA==
X-Received: by 2002:a2e:818f:0:b0:26b:e97e:d830 with SMTP id e15-20020a2e818f000000b0026be97ed830mr6970676ljg.420.1664182385656;
        Mon, 26 Sep 2022 01:53:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w14-20020a05651234ce00b00492d064e8f8sm2467982lfr.263.2022.09.26.01.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:53:05 -0700 (PDT)
Message-ID: <205a80be-de12-b610-eef2-e9e42179cf02@linaro.org>
Date:   Mon, 26 Sep 2022 10:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916: Align dsi phy-names with
 schema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925172443.92900-1-luca@z3ntu.xyz>
 <20220925172443.92900-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925172443.92900-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 19:24, Luca Weiss wrote:
> Use dsi instead of dsi-phy as required by the binding.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Already sent:

https://lore.kernel.org/all/20220924090108.166934-4-dmitry.baryshkov@linaro.org/

Best regards,
Krzysztof

