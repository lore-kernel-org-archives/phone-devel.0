Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E135C6FA82
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbiIZIyz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbiIZIyy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:54:54 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A875A1116C
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:54:51 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id c7so6589529ljm.12
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xH/VWjkeReXpRX9hNsqn6iJRBBhODPMyKniE40e1DmQ=;
        b=WPMvGa3GhTVyne+ucl3l1h2e3EAmtJjpnv+EEXkKaRBAWimtux3gr0VjPeN5H+Vydf
         YqiyGepJ8FZjkdWvybIzokJSwN9n5FhUh0ZJcEuOnzNw/neaCpVlEdsilA4ghUdft4GR
         YQSe8BHuCQWmq+d4J5SELoxT4190MIdC83GRKh5F4G90B8ny7gw7DqJvREAE/OSSsQgI
         Zk2AVqLSZ7wl1JRn9flbtQy6Lmglcz30bM318D/MfHdxWyCT47IoN3QggzJ41ClPe2Mo
         GtiGe+g0tpmoKj6dJ7IvTRdgSyGHX3+FGOWwt+D6j4LwKYWHfFAlyJZWM601MX6hgy6R
         f2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xH/VWjkeReXpRX9hNsqn6iJRBBhODPMyKniE40e1DmQ=;
        b=1WMMVrRNoT4I/vXM2tPpFBlU75UgZDR/3NAHSnCCwEPavb777rjAd6vOmW22ysqgyB
         p1vAahO4pcC/+MiyZIRAS4ZUhh801rbB4tfEVC8WQZ9TeWExiUuIO12kpVXVGf4UDGzR
         UwLe/IOcEkh+vxmtOpTcDf5XDLtvEwDZucT4Eg7aa6teMunPvxIrarnTy1/UdQT3C/DF
         uNq+H9q5ZL3xTEU0Y/DdQf45s7w/sA+axn66FmorQb25EV+cEfnWsJjhq2RGwChFo3aH
         EO4F+EpaZ2mCTV3RJMlbduN4+Kdvwo8MiAr3Iq/1NFMdPDLBhQAZnXZ6OS9nuSiK1rfw
         kvFQ==
X-Gm-Message-State: ACrzQf2i6aFJLMhD2ni6a7PEfDPLzJvyuxqv4KOWsrYMjgZe3oPHhIQX
        75zLPVs1RpjMmJrKgfyq4n8V0Q==
X-Google-Smtp-Source: AMsMyM5/QP3PvbYuQkluMZfjda3hzOgQHl0/rxn5wuQcIYRdv65cbyR7Cu1V8aQFSUV2WHXmpDyzjQ==
X-Received: by 2002:a05:651c:2205:b0:26c:622e:afef with SMTP id y5-20020a05651c220500b0026c622eafefmr7711929ljq.242.1664182489969;
        Mon, 26 Sep 2022 01:54:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o3-20020a198c03000000b00497ad9ae486sm2471618lfd.62.2022.09.26.01.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:54:49 -0700 (PDT)
Message-ID: <825b1178-6c05-e39b-2f65-4936e6280531@linaro.org>
Date:   Mon, 26 Sep 2022 10:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: pm8941: fix vadc channel node names
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925161821.78030-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925161821.78030-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 18:18, Luca Weiss wrote:
> Node names for the channel are supposed to be adc-chan@REG.

Why exactly?

> 
> Use this format and at the same time sort the nodes by reg value.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-pm8941.dtsi | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 

Best regards,
Krzysztof

